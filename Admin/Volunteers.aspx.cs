using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lifelink.Admin
{
    public partial class Volunteers : System.Web.UI.Page
    {
        private readonly string connectionString =
            ConfigurationManager.ConnectionStrings["LifeLinkDBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] == null)
            {
                Response.Redirect("~/Admin/AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadVolunteers("");
            }
        }

        private void LoadVolunteers(string search)
        {
            DataTable dt = new DataTable();

            string query = @"
                SELECT
                    VolunteerID,
                    FullName,
                    Email,
                    ContactNumber,
                    VolunteerActivity,
                    Availability,
                    RegistrationStatus,
                    RegisteredDate
                FROM dbo.VolunteerRegistrations";

            if (!string.IsNullOrWhiteSpace(search))
            {
                query += @"
                    WHERE FullName LIKE @Search
                       OR Email LIKE @Search
                       OR ContactNumber LIKE @Search
                       OR VolunteerActivity LIKE @Search
                       OR RegistrationStatus LIKE @Search";
            }

            query += " ORDER BY RegisteredDate DESC";

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                using (SqlCommand cmd = new SqlCommand(query, con))
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    if (!string.IsNullOrWhiteSpace(search))
                    {
                        cmd.Parameters.Add("@Search", SqlDbType.NVarChar, 200)
                            .Value = "%" + search.Trim() + "%";
                    }

                    da.Fill(dt);
                }

                gvVolunteers.DataSource = dt;
                gvVolunteers.DataBind();

                lblVolunteerCount.Text = "Total Volunteers: " + dt.Rows.Count;
                lblMessage.Text = "";
            }
            catch (Exception)
            {
                gvVolunteers.DataSource = null;
                gvVolunteers.DataBind();

                lblVolunteerCount.Text = "";
                lblMessage.Text =
                    "Unable to load volunteers. Please check the VolunteerRegistrations table and its column names.";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            gvVolunteers.PageIndex = 0;
            LoadVolunteers(txtSearch.Text.Trim());
        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            gvVolunteers.PageIndex = 0;
            LoadVolunteers("");
        }

        protected void gvVolunteers_PageIndexChanging(
            object sender, GridViewPageEventArgs e)
        {
            gvVolunteers.PageIndex = e.NewPageIndex;
            LoadVolunteers(txtSearch.Text.Trim());
        }
    }
}


using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Lifelink.Admin
{
    public partial class Donors : System.Web.UI.Page
    {
        private readonly string connectionString =
            ConfigurationManager.ConnectionStrings[
                "LifeLinkDBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadDonors("");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadDonors(txtSearch.Text.Trim());
        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadDonors("");
        }

        private void LoadDonors(string searchText)
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query = @"
                        SELECT
                            DonorName AS FullName,
                            BloodGroup,
                            ContactNumber
                        FROM dbo.BloodDonors
                        WHERE DonorName LIKE @Search
                           OR BloodGroup LIKE @Search
                           OR ContactNumber LIKE @Search
                        ORDER BY DonorName";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add(
                            "@Search", SqlDbType.NVarChar, 150)
                            .Value = "%" + searchText + "%";

                        using (SqlDataAdapter adapter =
                            new SqlDataAdapter(cmd))
                        {
                            DataTable table = new DataTable();
                            adapter.Fill(table);

                            gvDonors.DataSource = table;
                            gvDonors.DataBind();

                            lblDonorCount.Text =
                                "Total donors displayed: " +
                                table.Rows.Count;
                        }
                    }
                }

                lblMessage.Text = "";
            }
            catch (Exception)
            {
                gvDonors.DataSource = null;
                gvDonors.DataBind();

                lblDonorCount.Text = "";
                lblMessage.Text =
                    "Unable to load donors. Please check the BloodDonors table and its column names.";
            }
        }
    }
}


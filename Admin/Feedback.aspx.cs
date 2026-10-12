using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lifelink.Admin
{
    public partial class Feedback : System.Web.UI.Page
    {
        private readonly string connectionString =
            ConfigurationManager.ConnectionStrings[
                "LifeLinkDBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] == null)
            {
                Response.Redirect("~/Admin/AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadFeedback("");
            }
        }

        private void LoadFeedback(string search)
        {
            DataTable dt = new DataTable();

            string query = @"
                SELECT
                    FeedbackID,
                    UserID,
                    Subject,
                    FeedbackMessage,
                    Rating
                FROM dbo.Feedback";

            if (!string.IsNullOrWhiteSpace(search))
            {
                query += @"
                    WHERE CAST(FeedbackID AS NVARCHAR(20)) LIKE @Search
                       OR CAST(UserID AS NVARCHAR(20)) LIKE @Search
                       OR Subject LIKE @Search
                       OR FeedbackMessage LIKE @Search
                       OR CAST(Rating AS NVARCHAR(20)) LIKE @Search";
            }

            query += " ORDER BY FeedbackID DESC";

            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                using (SqlCommand cmd =
                    new SqlCommand(query, con))
                using (SqlDataAdapter da =
                    new SqlDataAdapter(cmd))
                {
                    if (!string.IsNullOrWhiteSpace(search))
                    {
                        cmd.Parameters.Add(
                            "@Search",
                            SqlDbType.NVarChar,
                            200
                        ).Value = "%" + search.Trim() + "%";
                    }

                    da.Fill(dt);
                }

                gvFeedback.DataSource = dt;
                gvFeedback.DataBind();

                lblFeedbackCount.Text =
                    "Total Feedback Records: " + dt.Rows.Count;

                lblMessage.Text = "";

                if (dt.Rows.Count == 0)
                {
                    lblMessage.Text = "No feedback records found.";
                }
            }
            catch (Exception ex)
            {
                gvFeedback.DataSource = null;
                gvFeedback.DataBind();

                lblFeedbackCount.Text = "";

                // Temporary message for troubleshooting.
                lblMessage.Text =
                    "Database error: " +
                    Server.HtmlEncode(ex.Message);
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            gvFeedback.PageIndex = 0;
            LoadFeedback(txtSearch.Text.Trim());
        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            gvFeedback.PageIndex = 0;
            LoadFeedback("");
        }

        protected void gvFeedback_PageIndexChanging(
            object sender, GridViewPageEventArgs e)
        {
            gvFeedback.PageIndex = e.NewPageIndex;
            LoadFeedback(txtSearch.Text.Trim());
        }
    }
}


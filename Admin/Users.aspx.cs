using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Lifelink.Admin
{
    public partial class Users : System.Web.UI.Page
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
                LoadUsers("");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadUsers(txtSearch.Text.Trim());
        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadUsers("");
        }

        private void LoadUsers(string searchText)
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query = @"
                        SELECT UserID,
                               FullName,
                               Email,
                               ContactNumber,
                               Role,
                               AccountStatus,
                               CreatedDate
                        FROM dbo.Users
                        WHERE FullName LIKE @Search
                           OR Email LIKE @Search
                        ORDER BY CreatedDate DESC";

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

                            gvUsers.DataSource = table;
                            gvUsers.DataBind();

                            lblUserCount.Text =
                                "Total users displayed: " +
                                table.Rows.Count;
                        }
                    }
                }

                lblMessage.Text = "";
            }
            catch (Exception)
            {
                gvUsers.DataSource = null;
                gvUsers.DataBind();

                lblUserCount.Text = "";
                lblMessage.Text =
                    "Unable to load users. Please check the database connection and table columns.";
            }
        }
    }
}


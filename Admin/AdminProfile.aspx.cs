using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace Lifelink.Admin
{
    public partial class AdminProfile : System.Web.UI.Page
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
                LoadAdminProfile();
            }
        }

        private void LoadAdminProfile()
        {
            string query = @"
                SELECT AdminID, FullName, Email, ContactNumber,
                       Role, AccountStatus, CreatedDate
                FROM dbo.Admins
                WHERE AdminID = @AdminID";

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@AdminID", Session["AdminID"]);

                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string fullName = Convert.ToString(reader["FullName"]);

                            lblAdminID.Text =
                                Convert.ToString(reader["AdminID"]);

                            lblFullName.Text = fullName;
                            lblNameDetails.Text = fullName;

                            lblEmail.Text =
                                Convert.ToString(reader["Email"]);

                            lblContactNumber.Text =
                                Convert.ToString(reader["ContactNumber"]);

                            lblRole.Text =
                                Convert.ToString(reader["Role"]);

                            lblAccountStatus.Text =
                                Convert.ToString(reader["AccountStatus"]);

                            if (reader["CreatedDate"] != DBNull.Value)
                            {
                                lblCreatedDate.Text =
                                    Convert.ToDateTime(reader["CreatedDate"])
                                    .ToString("dd MMMM yyyy");
                            }
                            else
                            {
                                lblCreatedDate.Text = "Not available";
                            }

                            lblMessage.Text = "";
                        }
                        else
                        {
                            lblMessage.Text =
                                "Admin profile was not found in the database.";
                        }
                    }
                }
            }
            catch (Exception)
            {
                lblMessage.Text =
                    "Unable to load the admin profile. Please check the database connection and table columns.";
            }
        }
    }
}


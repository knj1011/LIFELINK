using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Lifelink.Admin
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["AdminID"] != null)
            {
                Response.Redirect("Dashboard.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Page.Validate("AdminLogin");

            if (!Page.IsValid)
            {
                return;
            }

            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            string connectionString =
                ConfigurationManager.ConnectionStrings[
                    "LifeLinkDBConnection"].ConnectionString;

            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query = @"
                        SELECT AdminID, FullName, Email,
                               PasswordHash, Role, AccountStatus
                        FROM dbo.Admins
                        WHERE Email = @Email";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);

                        con.Open();

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                string passwordHash =
                                    reader["PasswordHash"].ToString();

                                string accountStatus =
                                    reader["AccountStatus"].ToString();

                                bool passwordMatches =
                                    PasswordHelper.VerifyPassword(
                                        password, passwordHash);

                                if (passwordMatches &&
                                    accountStatus.Equals(
                                        "Active",
                                        StringComparison.OrdinalIgnoreCase))
                                {
                                    Session["AdminID"] =
                                        reader["AdminID"];

                                    Session["AdminName"] =
                                        reader["FullName"].ToString();

                                    Session["AdminEmail"] =
                                        reader["Email"].ToString();

                                    Session["AdminRole"] =
                                        reader["Role"].ToString();

                                    Response.Redirect(
                                        "Dashboard.aspx", false);

                                    Context.ApplicationInstance
                                        .CompleteRequest();

                                    return;
                                }
                            }
                        }
                    }
                }

                lblMessage.Text =
                    "Invalid email, password, or inactive admin account.";
            }
            catch (Exception)
            {
                lblMessage.Text =
                    "Unable to log in. Please check the database connection and admin table.";
            }
        }
    }
}


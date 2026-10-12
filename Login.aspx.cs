using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Lifelink
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            using (SqlConnection con = DB.GetConnection())
            {
                string query = @"
                    SELECT UserID, FullName, PasswordHash, Role, AccountStatus
                    FROM Users
                    WHERE Email = @Email";

                using (SqlCommand cmd = new SqlCommand(query, con))
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

                            if (accountStatus.Equals(
                                "Active",
                                StringComparison.OrdinalIgnoreCase))
                            {
                                if (PasswordHelper.VerifyPassword(
                                    password,
                                    passwordHash))
                                {
                                    Session["UserID"] = reader["UserID"];
                                    Session["FullName"] =
                                        reader["FullName"].ToString();
                                    Session["Email"] = email;
                                    Session["Role"] =
                                        reader["Role"].ToString();

                                    // Redirect to Home after successful login
                                    Response.Redirect("~/Home.aspx", false);
                                    Context.ApplicationInstance.CompleteRequest();
                                    return;
                                }
                                else
                                {
                                    lblMessage.Text =
                                        "Invalid email or password.";
                                }
                            }
                            else
                            {
                                lblMessage.Text =
                                    "Your account is not active.";
                            }
                        }
                        else
                        {
                            lblMessage.Text =
                                "Invalid email or password.";
                        }
                    }
                }
            }
        }
    }
}
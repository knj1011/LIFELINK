using System;
using System.Data.SqlClient;

namespace Lifelink
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            if (Session["ResetEmail"] == null)
            {
                lblMessage.Text =
                    "Your password reset session has expired. Please start again.";

                return;
            }

            string email = Session["ResetEmail"].ToString();
            string newPassword = txtPassword.Text;

            try
            {
                string passwordHash =
                    PasswordHelper.HashPassword(newPassword);

                using (SqlConnection con = DB.GetConnection())
                {
                    string query = @"
                        UPDATE Users
                        SET PasswordHash = @PasswordHash
                        WHERE Email = @Email";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@PasswordHash", passwordHash);

                        cmd.Parameters.AddWithValue(
                            "@Email", email);

                        con.Open();

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            Session.Remove("ResetEmail");

                            Response.Redirect("Login.aspx");
                        }
                        else
                        {
                            lblMessage.Text =
                                "Unable to reset the password.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Something went wrong: " + ex.Message;
            }
        }
    }
}
using System;
using System.Data.SqlClient;

namespace Lifelink
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string email = txtEmail.Text.Trim();

            try
            {
                using (SqlConnection con = DB.GetConnection())
                {
                    string query = @"
                        SELECT COUNT(*)
                        FROM Users
                        WHERE Email = @Email";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);

                        con.Open();

                        int count =
                            Convert.ToInt32(cmd.ExecuteScalar());

                        if (count > 0)
                        {
                            Session["ResetEmail"] = email;

                            Response.Redirect("ResetPassword.aspx");
                        }
                        else
                        {
                            lblMessage.Text =
                                "No account was found with this email address.";
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
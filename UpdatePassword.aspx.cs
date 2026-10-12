using System;
using System.Data.SqlClient;

namespace Lifelink
{
    public partial class UpdatePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            if (Session["UserID"] == null)
            {
                lblMessage.Text =
                    "Please log in before updating your password.";

                return;
            }

            int userId = Convert.ToInt32(Session["UserID"]);

            string currentPassword = txtCurrentPassword.Text;
            string newPassword = txtNewPassword.Text;

            try
            {
                using (SqlConnection con = DB.GetConnection())
                {
                    string query = @"
                        SELECT PasswordHash
                        FROM Users
                        WHERE UserID = @UserID";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@UserID", userId);

                        con.Open();

                        object result = cmd.ExecuteScalar();

                        if (result == null)
                        {
                            lblMessage.Text =
                                "User account could not be found.";

                            return;
                        }

                        string currentPasswordHash =
                            result.ToString();

                        if (!PasswordHelper.VerifyPassword(
                            currentPassword,
                            currentPasswordHash))
                        {
                            lblMessage.Text =
                                "Current password is incorrect.";

                            return;
                        }
                    }

                    string newPasswordHash =
                        PasswordHelper.HashPassword(newPassword);

                    string updateQuery = @"
                        UPDATE Users
                        SET PasswordHash = @PasswordHash
                        WHERE UserID = @UserID";

                    using (SqlCommand updateCmd =
                        new SqlCommand(updateQuery, con))
                    {
                        updateCmd.Parameters.AddWithValue(
                            "@PasswordHash", newPasswordHash);

                        updateCmd.Parameters.AddWithValue(
                            "@UserID", userId);

                        int rowsAffected =
                            updateCmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            lblMessage.Text =
                                "Password updated successfully.";
                        }
                        else
                        {
                            lblMessage.Text =
                                "Unable to update your password.";
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
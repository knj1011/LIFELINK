using System;
using System.Data.SqlClient;

namespace Lifelink
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string contactNumber = txtContactNumber.Text.Trim();
            string gender = rblGender.SelectedValue;
            string address = txtAddress.Text.Trim();
            string password = txtPassword.Text;

            string passwordHash = PasswordHelper.HashPassword(password);

            using (SqlConnection con = DB.GetConnection())
            {
                con.Open();

                // Check whether email already exists
                string checkQuery = @"
                    SELECT COUNT(*)
                    FROM Users
                    WHERE Email = @Email";

                using (SqlCommand checkCmd =
                    new SqlCommand(checkQuery, con))
                {
                    checkCmd.Parameters.AddWithValue("@Email", email);

                    int count = Convert.ToInt32(checkCmd.ExecuteScalar());

                    if (count > 0)
                    {
                        lblMessage.Text =
                            "An account with this email already exists.";

                        return;
                    }
                }

                // Insert new user
                string insertQuery = @"
                    INSERT INTO Users
                    (
                        FullName,
                        Email,
                        ContactNumber,
                        Gender,
                        Address,
                        PasswordHash,
                        Role,
                        AccountStatus,
                        CreatedDate
                    )
                    VALUES
                    (
                        @FullName,
                        @Email,
                        @ContactNumber,
                        @Gender,
                        @Address,
                        @PasswordHash,
                        @Role,
                        @AccountStatus,
                        @CreatedDate
                    )";

                using (SqlCommand cmd =
                    new SqlCommand(insertQuery, con))
                {
                    cmd.Parameters.AddWithValue("@FullName", fullName);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@ContactNumber", contactNumber);
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@PasswordHash", passwordHash);
                    cmd.Parameters.AddWithValue("@Role", "User");
                    cmd.Parameters.AddWithValue("@AccountStatus", "Active");
                    cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now);

                    cmd.ExecuteNonQuery();
                }
            }

            Response.Redirect("Login.aspx");
        }
    }
}
using System;
using System.Data.SqlClient;

namespace Lifelink
{
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfile();
            }
        }

        private void LoadProfile()
        {
            if (Session["UserID"] == null)
            {
                lblMessage.Text =
                    "Please log in to edit your profile.";

                return;
            }

            int userId = Convert.ToInt32(Session["UserID"]);

            try
            {
                using (SqlConnection con = DB.GetConnection())
                {
                    string query = @"
                        SELECT
                            FullName,
                            Email,
                            ContactNumber,
                            Gender,
                            Address
                        FROM Users
                        WHERE UserID = @UserID";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@UserID", userId);

                        con.Open();

                        using (SqlDataReader reader =
                            cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                txtFullName.Text =
                                    reader["FullName"].ToString();

                                txtEmail.Text =
                                    reader["Email"].ToString();

                                txtContactNumber.Text =
                                    reader["ContactNumber"].ToString();

                                rblGender.SelectedValue =
                                    reader["Gender"].ToString();

                                txtAddress.Text =
                                    reader["Address"].ToString();
                            }
                            else
                            {
                                lblMessage.Text =
                                    "User profile could not be found.";
                            }
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            if (Session["UserID"] == null)
            {
                lblMessage.Text =
                    "Please log in to update your profile.";

                return;
            }

            int userId = Convert.ToInt32(Session["UserID"]);

            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string contactNumber = txtContactNumber.Text.Trim();
            string gender = rblGender.SelectedValue;
            string address = txtAddress.Text.Trim();

            try
            {
                using (SqlConnection con = DB.GetConnection())
                {
                    con.Open();

                    string checkEmailQuery = @"
                        SELECT COUNT(*)
                        FROM Users
                        WHERE Email = @Email
                        AND UserID <> @UserID";

                    using (SqlCommand checkCmd =
                        new SqlCommand(checkEmailQuery, con))
                    {
                        checkCmd.Parameters.AddWithValue(
                            "@Email", email);

                        checkCmd.Parameters.AddWithValue(
                            "@UserID", userId);

                        int emailCount =
                            Convert.ToInt32(
                                checkCmd.ExecuteScalar());

                        if (emailCount > 0)
                        {
                            lblMessage.Text =
                                "This email address is already registered.";

                            return;
                        }
                    }

                    string updateQuery = @"
                        UPDATE Users
                        SET
                            FullName = @FullName,
                            Email = @Email,
                            ContactNumber = @ContactNumber,
                            Gender = @Gender,
                            Address = @Address
                        WHERE UserID = @UserID";

                    using (SqlCommand cmd =
                        new SqlCommand(updateQuery, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@FullName", fullName);

                        cmd.Parameters.AddWithValue(
                            "@Email", email);

                        cmd.Parameters.AddWithValue(
                            "@ContactNumber", contactNumber);

                        cmd.Parameters.AddWithValue(
                            "@Gender", gender);

                        cmd.Parameters.AddWithValue(
                            "@Address", address);

                        cmd.Parameters.AddWithValue(
                            "@UserID", userId);

                        int rowsAffected =
                            cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            Session["FullName"] = fullName;
                            Session["Email"] = email;

                            lblMessage.Text =
                                "Profile updated successfully.";
                        }
                        else
                        {
                            lblMessage.Text =
                                "Unable to update your profile.";
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
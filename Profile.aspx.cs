
using System;
using System.Data.SqlClient;

namespace Lifelink
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check whether the user is logged in
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadProfile();
            }
        }

        private void LoadProfile()
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
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
                            Address,
                            Role,
                            AccountStatus
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
                                lblFullName.Text =
                                    reader["FullName"].ToString();

                                lblEmail.Text =
                                    reader["Email"].ToString();

                                lblContactNumber.Text =
                                    reader["ContactNumber"].ToString();

                                lblGender.Text =
                                    reader["Gender"].ToString();

                                lblAddress.Text =
                                    reader["Address"].ToString();

                                lblRole.Text =
                                    reader["Role"].ToString();

                                lblAccountStatus.Text =
                                    reader["AccountStatus"].ToString();
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
    }
}
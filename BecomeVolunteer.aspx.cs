using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Lifelink
{
    public partial class BecomeVolunteer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            lblMessage.ForeColor =
                System.Drawing.Color.FromArgb(198, 40, 40);

            Page.Validate("VolunteerForm");

            if (!Page.IsValid)
                return;

            int userId;

            if (!int.TryParse(
                Convert.ToString(Session["UserID"]), out userId))
            {
                lblMessage.Text =
                    "Your login session is invalid. Please log in again.";
                return;
            }

            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string contactNumber = txtContactNumber.Text.Trim();
            string activity = ddlActivity.SelectedValue;
            string availability = ddlAvailability.SelectedValue;
            string additionalInformation = txtSkills.Text.Trim();

            if (fullName.Length > 100 ||
                email.Length > 150 ||
                contactNumber.Length != 10 ||
                activity.Length > 100 ||
                availability.Length > 50 ||
                additionalInformation.Length > 500)
            {
                lblMessage.Text =
                    "Please check your entries and try again.";
                return;
            }

            string connectionString =
                ConfigurationManager
                    .ConnectionStrings["LifeLinkDBConnection"]
                    .ConnectionString;

            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query = @"
                        INSERT INTO VolunteerRegistrations
                        (
                            UserID,
                            FullName,
                            Email,
                            ContactNumber,
                            VolunteerActivity,
                            Availability,
                            AdditionalInformation
                        )
                        VALUES
                        (
                            @UserID,
                            @FullName,
                            @Email,
                            @ContactNumber,
                            @VolunteerActivity,
                            @Availability,
                            @AdditionalInformation
                        );";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add(
                            "@UserID", SqlDbType.Int).Value = userId;

                        cmd.Parameters.Add(
                            "@FullName", SqlDbType.NVarChar, 100)
                            .Value = fullName;

                        cmd.Parameters.Add(
                            "@Email", SqlDbType.NVarChar, 150)
                            .Value = email;

                        cmd.Parameters.Add(
                            "@ContactNumber", SqlDbType.NVarChar, 10)
                            .Value = contactNumber;

                        cmd.Parameters.Add(
                            "@VolunteerActivity", SqlDbType.NVarChar, 100)
                            .Value = activity;

                        cmd.Parameters.Add(
                            "@Availability", SqlDbType.NVarChar, 50)
                            .Value = availability;

                        cmd.Parameters.Add(
                            "@AdditionalInformation", SqlDbType.NVarChar, 500)
                            .Value = string.IsNullOrWhiteSpace(additionalInformation)
                                ? (object)DBNull.Value
                                : additionalInformation;

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                lblMessage.ForeColor =
                    System.Drawing.Color.FromArgb(25, 135, 84);

                lblMessage.Text =
                    "Your volunteer registration was submitted successfully!";

                txtFullName.Text = "";
                txtEmail.Text = "";
                txtContactNumber.Text = "";
                ddlActivity.SelectedIndex = 0;
                ddlAvailability.SelectedIndex = 0;
                txtSkills.Text = "";
            }
            catch (Exception)
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.FromArgb(198, 40, 40);

                lblMessage.Text =
                    "We could not save your registration. Please try again or contact the administrator.";
            }
        }
    }
}


using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Lifelink
{
    public partial class EmergencyHelp : System.Web.UI.Page
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

            Page.Validate("EmergencyForm");

            if (!Page.IsValid)
            {
                return;
            }

            int userId;

            if (!int.TryParse(
                Convert.ToString(Session["UserID"]), out userId))
            {
                lblMessage.Text =
                    "Your session is invalid. Please log in again.";
                return;
            }

            string requesterName = txtRequesterName.Text.Trim();
            string contactNumber = txtContactNumber.Text.Trim();
            string emergencyType = ddlEmergencyType.SelectedValue;
            string location = txtLocation.Text.Trim();
            string emergencyDetails = txtEmergencyDetails.Text.Trim();

            if (requesterName.Length > 100 ||
                contactNumber.Length != 10 ||
                location.Length > 250 ||
                emergencyDetails.Length > 2000 ||
                string.IsNullOrWhiteSpace(emergencyType))
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
                        INSERT INTO EmergencyRequests
                        (
                            UserID,
                            RequesterName,
                            ContactNumber,
                            EmergencyType,
                            Location,
                            EmergencyDetails,
                            RequestStatus,
                            SubmittedDate
                        )
                        VALUES
                        (
                            @UserID,
                            @RequesterName,
                            @ContactNumber,
                            @EmergencyType,
                            @Location,
                            @EmergencyDetails,
                            @RequestStatus,
                            @SubmittedDate
                        );";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add(
                            "@UserID", SqlDbType.Int).Value = userId;

                        cmd.Parameters.Add(
                            "@RequesterName", SqlDbType.NVarChar, 100)
                            .Value = requesterName;

                        cmd.Parameters.Add(
                            "@ContactNumber", SqlDbType.NVarChar, 10)
                            .Value = contactNumber;

                        cmd.Parameters.Add(
                            "@EmergencyType", SqlDbType.NVarChar, 100)
                            .Value = emergencyType;

                        cmd.Parameters.Add(
                            "@Location", SqlDbType.NVarChar, 250)
                            .Value = location;

                        cmd.Parameters.Add(
                            "@EmergencyDetails", SqlDbType.NVarChar, -1)
                            .Value = emergencyDetails;

                        cmd.Parameters.Add(
                            "@RequestStatus", SqlDbType.NVarChar, 30)
                            .Value = "Pending";

                        cmd.Parameters.Add(
                            "@SubmittedDate", SqlDbType.DateTime)
                            .Value = DateTime.Now;

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                lblMessage.ForeColor =
                    System.Drawing.Color.FromArgb(25, 135, 84);

                lblMessage.Text =
                    "Your emergency request has been submitted successfully!";

                txtRequesterName.Text = "";
                txtContactNumber.Text = "";
                ddlEmergencyType.SelectedIndex = 0;
                txtLocation.Text = "";
                txtEmergencyDetails.Text = "";
            }
            catch (Exception)
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.FromArgb(198, 40, 40);

                lblMessage.Text =
                    "We could not submit your request. Please try again or contact the administrator.";
            }
        }
    }
}



using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Lifelink
{
    public partial class BloodRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Only logged-in users can submit blood requests.
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                txtRequiredDate.Attributes["min"] =
                    DateTime.Today.ToString("yyyy-MM-dd");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            lblMessage.ForeColor =
                System.Drawing.Color.FromArgb(198, 40, 40);

            // Check ASP.NET validation.
            Page.Validate("BloodForm");

            if (!Page.IsValid)
            {
                return;
            }

            // Validate the required date on the server as well.
            DateTime requiredDate;

            if (!DateTime.TryParse(
                    txtRequiredDate.Text,
                    out requiredDate) ||
                requiredDate.Date < DateTime.Today)
            {
                lblMessage.Text =
                    "Please select today or a future date.";
                return;
            }

            int userId;
            int requiredUnits;

            if (!int.TryParse(
                    Convert.ToString(Session["UserID"]),
                    out userId) ||
                !int.TryParse(txtRequiredUnits.Text, out requiredUnits) ||
                requiredUnits < 1 ||
                requiredUnits > 100)
            {
                lblMessage.Text =
                    "Your session or the required units are invalid. Please check and try again.";
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
                        INSERT INTO BloodRequests
                        (
                            UserID,
                            PatientName,
                            BloodGroup,
                            ContactNumber,
                            HospitalName,
                            RequiredUnits,
                            RequiredDate,
                            AdditionalDetails,
                            RequestStatus,
                            SubmittedDate
                        )
                        VALUES
                        (
                            @UserID,
                            @PatientName,
                            @BloodGroup,
                            @ContactNumber,
                            @HospitalName,
                            @RequiredUnits,
                            @RequiredDate,
                            @AdditionalDetails,
                            @RequestStatus,
                            @SubmittedDate
                        );";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add(
                            "@UserID", SqlDbType.Int).Value = userId;

                        cmd.Parameters.Add(
                            "@PatientName", SqlDbType.NVarChar, 100)
                            .Value = txtPatientName.Text.Trim();

                        cmd.Parameters.Add(
                            "@BloodGroup", SqlDbType.NVarChar, 10)
                            .Value = ddlBloodGroup.SelectedValue;

                        cmd.Parameters.Add(
                            "@ContactNumber", SqlDbType.NVarChar, 10)
                            .Value = txtContactNumber.Text.Trim();

                        cmd.Parameters.Add(
                            "@HospitalName", SqlDbType.NVarChar, 150)
                            .Value = txtHospitalName.Text.Trim();

                        cmd.Parameters.Add(
                            "@RequiredUnits", SqlDbType.Int)
                            .Value = requiredUnits;

                        cmd.Parameters.Add(
                            "@RequiredDate", SqlDbType.DateTime)
                            .Value = requiredDate.Date;

                        cmd.Parameters.Add(
                            "@AdditionalDetails", SqlDbType.NVarChar, -1)
                            .Value = string.IsNullOrWhiteSpace(
                                txtAdditionalDetails.Text)
                                ? (object)DBNull.Value
                                : txtAdditionalDetails.Text.Trim();

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
                    "Your blood request has been submitted successfully!";

                // Clear the form after a successful submission.
                txtPatientName.Text = "";
                ddlBloodGroup.SelectedIndex = 0;
                txtContactNumber.Text = "";
                txtHospitalName.Text = "";
                txtRequiredUnits.Text = "";
                txtRequiredDate.Text = "";
                txtAdditionalDetails.Text = "";
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


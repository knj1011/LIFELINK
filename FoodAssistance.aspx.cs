using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Lifelink
{
    public partial class FoodAssistance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Only logged-in users can submit requests.
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

            // Validate all controls in this form's validation group.
            Page.Validate("FoodForm");

            if (!Page.IsValid)
            {
                return;
            }

            int userId;

            if (!int.TryParse(
                    Convert.ToString(Session["UserID"]),
                    out userId))
            {
                lblMessage.Text =
                    "Your login session is invalid. Please log in again.";
                return;
            }

            string requesterName = txtRequesterName.Text.Trim();
            string contactNumber = txtContactNumber.Text.Trim();
            string foodRequirements = txtFoodRequirements.Text.Trim();
            string address = txtAddress.Text.Trim();

            // Check input lengths on the server too.
            if (requesterName.Length > 100 ||
                contactNumber.Length != 10 ||
                foodRequirements.Length > 1000 ||
                address.Length > 250)
            {
                lblMessage.Text =
                    "One or more fields contain invalid information. Please check your entries.";
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
                        INSERT INTO FoodAssistanceRequests
                        (
                            UserID,
                            RequesterName,
                            ContactNumber,
                            FoodRequirements,
                            Address,
                            RequestStatus,
                            SubmittedDate
                        )
                        VALUES
                        (
                            @UserID,
                            @RequesterName,
                            @ContactNumber,
                            @FoodRequirements,
                            @Address,
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
                            "@FoodRequirements", SqlDbType.NVarChar, -1)
                            .Value = foodRequirements;

                        cmd.Parameters.Add(
                            "@Address", SqlDbType.NVarChar, 250)
                            .Value = address;

                        cmd.Parameters.Add(
                            "@RequestStatus", SqlDbType.NVarChar, 20)
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
                    "Your food assistance request has been submitted successfully!";

                // Clear the form after a successful submission.
                txtRequesterName.Text = "";
                txtContactNumber.Text = "";
                txtFoodRequirements.Text = "";
                txtAddress.Text = "";
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


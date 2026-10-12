using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Lifelink
{
    public partial class FindBloodDonor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            gvDonors.DataSource = null;
            gvDonors.DataBind();

            Page.Validate("DonorSearch");

            if (!Page.IsValid)
                return;

            string bloodGroup = ddlBloodGroup.SelectedValue.Trim();
            string location = txtLocation.Text.Trim();

            if (location.Length > 150)
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.FromArgb(198, 40, 40);

                lblMessage.Text = "Please enter a shorter location.";
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
                        SELECT
                            DonorName,
                            BloodGroup,
                            ContactNumber,
                            Location AS City
                        FROM dbo.BloodDonors
                        WHERE BloodGroup = @BloodGroup
                          AND Location LIKE @Location
                          AND IsAvailable = 1
                          AND (AvailableFrom IS NULL
                               OR AvailableFrom <= @Today)
                        ORDER BY DonorName;";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add(
                            "@BloodGroup",
                            SqlDbType.NVarChar, 5).Value = bloodGroup;

                        cmd.Parameters.Add(
                            "@Location",
                            SqlDbType.NVarChar, 152).Value =
                            "%" + location + "%";

                        cmd.Parameters.Add(
                            "@Today", SqlDbType.Date).Value =
                            DateTime.Today;

                        using (SqlDataAdapter adapter =
                            new SqlDataAdapter(cmd))
                        {
                            DataTable donors = new DataTable();
                            adapter.Fill(donors);

                            gvDonors.DataSource = donors;
                            gvDonors.DataBind();

                            lblMessage.ForeColor =
                                System.Drawing.Color.FromArgb(32, 64, 119);

                            if (donors.Rows.Count == 0)
                            {
                                lblMessage.Text =
                                    "No available donors found for this blood group and location.";
                            }
                            else
                            {
                                lblMessage.Text =
                                    donors.Rows.Count +
                                    " available donor(s) found.";
                            }
                        }
                    }
                }
            }
            catch (Exception)
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.FromArgb(198, 40, 40);

                lblMessage.Text =
                    "Unable to search donors right now. Please try again.";
            }
        }
    }
}


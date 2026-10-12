using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lifelink.Admin
{
    public partial class Requests : System.Web.UI.Page
    {
        private string connectionString =
            ConfigurationManager.ConnectionStrings["LifeLinkDBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] == null)
            {
                Response.Redirect("~/Admin/AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadRequests("");
            }
        }

        private void LoadRequests(string search)
        {
            DataTable dt = new DataTable();

            string query = @"
                SELECT
                    BloodRequestID AS RequestID,
                    PatientName AS RequesterName,
                    'Blood' AS RequestType,
                    ContactNumber,
                    CAST(
                        'Blood Group: ' + ISNULL(BloodGroup, '')
                        + ', Hospital: ' + ISNULL(HospitalName, '')
                        AS NVARCHAR(500)
                    ) AS RequestDetails,
                    RequestStatus,
                    SubmittedDate
                FROM dbo.BloodRequests

                UNION ALL

                SELECT
                    EmergencyRequestID,
                    RequesterName,
                    'Emergency',
                    ContactNumber,
                    CAST(
                        'Type: ' + ISNULL(EmergencyType, '')
                        + ', Location: ' + ISNULL(Location, '')
                        AS NVARCHAR(500)
                    ),
                    RequestStatus,
                    SubmittedDate
                FROM dbo.EmergencyRequests

                UNION ALL

                SELECT
                    RequestID,
                    RequesterName,
                    'Food Assistance',
                    ContactNumber,
                    CAST(
                        'Requirements: ' + ISNULL(FoodRequirements, '')
                        + ', Address: ' + ISNULL(Address, '')
                        AS NVARCHAR(500)
                    ),
                    RequestStatus,
                    SubmittedDate
                FROM dbo.FoodAssistanceRequests

                UNION ALL

                SELECT
                    VolunteerRequestID,
                    RequesterName,
                    'Volunteer',
                    ContactNumber,
                    CAST(
                        'Activity: ' + ISNULL(VolunteerActivity, '')
                        + ', Location: ' + ISNULL(Location, '')
                        AS NVARCHAR(500)
                    ),
                    RequestStatus,
                    SubmittedDate
                FROM dbo.VolunteerRequests";

            // Search the combined list by requester, request type, or status.
            string finalQuery = @"
                SELECT *
                FROM (" + query + @") AS AllRequests
                WHERE
                    RequesterName LIKE @Search
                    OR RequestType LIKE @Search
                    OR RequestStatus LIKE @Search
                    OR ContactNumber LIKE @Search
                ORDER BY SubmittedDate DESC";

            if (string.IsNullOrWhiteSpace(search))
            {
                finalQuery = @"
                    SELECT *
                    FROM (" + query + @") AS AllRequests
                    ORDER BY SubmittedDate DESC";
            }

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                using (SqlCommand cmd = new SqlCommand(finalQuery, con))
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    if (!string.IsNullOrWhiteSpace(search))
                    {
                        cmd.Parameters.Add("@Search", SqlDbType.NVarChar, 200)
                            .Value = "%" + search.Trim() + "%";
                    }

                    da.Fill(dt);
                }

                gvRequests.DataSource = dt;
                gvRequests.DataBind();

                lblRequestCount.Text = "Total Requests: " + dt.Rows.Count;
                lblMessage.Text = "";
            }
            catch (Exception)
            {
                gvRequests.DataSource = null;
                gvRequests.DataBind();

                lblRequestCount.Text = "";
                lblMessage.Text =
                    "Unable to load requests. Please check the request table names and columns in the database.";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            gvRequests.PageIndex = 0;
            LoadRequests(txtSearch.Text.Trim());
        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            gvRequests.PageIndex = 0;
            LoadRequests("");
        }

        protected void gvRequests_PageIndexChanging(
            object sender, GridViewPageEventArgs e)
        {
            gvRequests.PageIndex = e.NewPageIndex;
            LoadRequests(txtSearch.Text.Trim());
        }
    }
}


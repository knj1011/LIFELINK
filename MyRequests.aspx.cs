
using System;
using System.Data;
using System.Data.SqlClient;

namespace Lifelink
{
    public partial class MyRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadMyRequests();
            }
        }

        private void LoadMyRequests()
        {
            int userId = Convert.ToInt32(Session["UserID"]);

            DataTable requests = new DataTable();

            requests.Columns.Add("RequestType");
            requests.Columns.Add("RequestID");
            requests.Columns.Add("Description");
            requests.Columns.Add("RequestStatus");
            requests.Columns.Add("SubmittedDate");

            try
            {
                using (SqlConnection con = DB.GetConnection())
                {
                    con.Open();

                    AddRequests(
                        con, requests, userId,
                        @"SELECT BloodRequestID AS RequestID,
                                 'Blood Request' AS RequestType,
                                 BloodGroup AS Description,
                                 RequestStatus, SubmittedDate
                          FROM BloodRequests
                          WHERE UserID = @UserID");

                    AddRequests(
                        con, requests, userId,
                        @"SELECT EmergencyRequestID AS RequestID,
                                 'Emergency Help' AS RequestType,
                                 EmergencyType AS Description,
                                 RequestStatus, SubmittedDate
                          FROM EmergencyRequests
                          WHERE UserID = @UserID");

                    AddRequests(
                        con, requests, userId,
                        @"SELECT RequestID,
                                 'Food Assistance' AS RequestType,
                                 FoodRequirements AS Description,
                                 RequestStatus, SubmittedDate
                          FROM FoodAssistanceRequests
                          WHERE UserID = @UserID");

                    AddRequests(
                        con, requests, userId,
                        @"SELECT VolunteerRequestID AS RequestID,
                                 'Volunteer Request' AS RequestType,
                                 VolunteerActivity AS Description,
                                 RequestStatus, SubmittedDate
                          FROM VolunteerRequests
                          WHERE UserID = @UserID");
                }

                gvMyRequests.DataSource = requests;
                gvMyRequests.DataBind();

                lblMessage.Text = requests.Rows.Count == 0
                    ? "You have not submitted any requests yet."
                    : "";
            }
            catch (Exception)
            {
                lblMessage.Text =
                    "Unable to load your requests. Please check the database table and column names.";
            }
        }

        private void AddRequests(
            SqlConnection con,
            DataTable requests,
            int userId,
            string query)
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = userId;

                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                {
                    DataTable results = new DataTable();
                    adapter.Fill(results);

                    foreach (DataRow row in results.Rows)
                    {
                        DataRow newRow = requests.NewRow();

                        newRow["RequestType"] = row["RequestType"];
                        newRow["RequestID"] = row["RequestID"];
                        newRow["Description"] = row["Description"];
                        newRow["RequestStatus"] = row["RequestStatus"];
                        newRow["SubmittedDate"] =
                            Convert.ToDateTime(row["SubmittedDate"])
                                .ToString("dd MMM yyyy");

                        requests.Rows.Add(newRow);
                    }
                }
            }
        }
    }
}
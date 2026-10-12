using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Lifelink.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        private string connectionString =
            ConfigurationManager.ConnectionStrings[
                "LifeLinkDBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadDashboardStats();
            }
        }

        private void LoadDashboardStats()
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    con.Open();

                    lblTotalUsers.Text =
                        GetCount(con,
                            "SELECT COUNT(*) FROM dbo.Users");

                    lblBloodRequests.Text =
                        GetCount(con,
                            "SELECT COUNT(*) FROM dbo.BloodRequests");

                    int emergencyRequests = Convert.ToInt32(
                        GetCount(con,
                            "SELECT COUNT(*) FROM dbo.EmergencyRequests"));

                    int foodRequests = Convert.ToInt32(
                        GetCount(con,
                            "SELECT COUNT(*) FROM dbo.FoodAssistanceRequests"));

                    int volunteerRequests = Convert.ToInt32(
                        GetCount(con,
                            "SELECT COUNT(*) FROM dbo.VolunteerRequests"));

                    lblTotalRequests.Text =
                        (Convert.ToInt32(lblBloodRequests.Text)
                        + emergencyRequests
                        + foodRequests
                        + volunteerRequests).ToString();

                    lblVolunteers.Text =
                        GetCount(con,
                            "SELECT COUNT(*) FROM dbo.VolunteerRegistrations");
                }
            }
            catch (Exception)
            {
                lblMessage.Text =
                    "Unable to load dashboard statistics. Please check the database connection and table names.";
            }
        }

        private string GetCount(SqlConnection con, string query)
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                return Convert.ToInt32(cmd.ExecuteScalar()).ToString();
            }
        }
    }
}


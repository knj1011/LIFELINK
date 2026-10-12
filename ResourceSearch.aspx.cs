using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Lifelink
{
    public partial class ResourceSearch : System.Web.UI.Page
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
            gvResources.DataSource = null;
            gvResources.DataBind();

            string keyword = txtKeyword.Text.Trim();
            string category = ddlCategory.SelectedValue;
            string location = txtLocation.Text.Trim();

            if (keyword.Length > 100 || location.Length > 100)
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.FromArgb(198, 40, 40);

                lblMessage.Text =
                    "Please enter no more than 100 characters in each search field.";
                return;
            }

            // This table contains food assistance requests only.
            // Other selected categories are not supported by this query.
            if (category != "" && category != "Food Assistance")
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.FromArgb(198, 40, 40);

                lblMessage.Text =
                    "Currently, this search supports Food Assistance requests only.";
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
                            RequesterName AS ResourceName,
                            N'Food Assistance' AS Category,
                            FoodRequirements AS Description,
                            Address AS Location,
                            ContactNumber
                        FROM dbo.FoodAssistanceRequests
                        WHERE RequestStatus = @RequestStatus
                          AND (@Keyword = ''
                               OR FoodRequirements LIKE @KeywordPattern
                               OR RequesterName LIKE @KeywordPattern)
                          AND (@Location = ''
                               OR Address LIKE @LocationPattern)
                        ORDER BY SubmittedDate DESC;";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add(
                            "@RequestStatus", SqlDbType.NVarChar, 30)
                            .Value = "Pending";

                        cmd.Parameters.Add(
                            "@Keyword", SqlDbType.NVarChar, 100)
                            .Value = keyword;

                        cmd.Parameters.Add(
                            "@KeywordPattern", SqlDbType.NVarChar, 202)
                            .Value = "%" + keyword + "%";

                        cmd.Parameters.Add(
                            "@Location", SqlDbType.NVarChar, 100)
                            .Value = location;

                        cmd.Parameters.Add(
                            "@LocationPattern", SqlDbType.NVarChar, 202)
                            .Value = "%" + location + "%";

                        using (SqlDataAdapter adapter =
                            new SqlDataAdapter(cmd))
                        {
                            DataTable results = new DataTable();
                            adapter.Fill(results);

                            gvResources.DataSource = results;
                            gvResources.DataBind();

                            lblMessage.ForeColor =
                                System.Drawing.Color.FromArgb(32, 64, 119);

                            lblMessage.Text = results.Rows.Count +
                                " food assistance request(s) found.";
                        }
                    }
                }
            }
            catch (Exception)
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.FromArgb(198, 40, 40);

                lblMessage.Text =
                    "Unable to search requests right now. Please try again.";
            }
        }
    }
}


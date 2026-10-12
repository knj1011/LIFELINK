using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Lifelink
{
    public partial class Feedback : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Page.Validate();

            if (!Page.IsValid)
                return;

            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            string subject = string.IsNullOrWhiteSpace(txtSubject.Text)
                ? ddlCategory.SelectedValue
                : txtSubject.Text.Trim();

            string message = txtComments.Text.Trim();

            try
            {
                using (SqlConnection con = DB.GetConnection())
                {
                    string query = @"
                        INSERT INTO Feedback
                            (UserID, Subject, FeedbackMessage, SubmittedDate)
                        VALUES
                            (@UserID, @Subject, @FeedbackMessage, @SubmittedDate)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@UserID", Convert.ToInt32(Session["UserID"]));

                        cmd.Parameters.AddWithValue("@Subject", subject);
                        cmd.Parameters.AddWithValue("@FeedbackMessage", message);
                        cmd.Parameters.AddWithValue("@SubmittedDate", DateTime.Now);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                lblMessage.Text = "Thank you! Your feedback has been saved.";
                lblMessage.ForeColor = System.Drawing.Color.Green;

                txtSubject.Text = "";
                txtComments.Text = "";
                rblRating.ClearSelection();
                ddlCategory.SelectedIndex = 0;
            }
            catch (Exception)
            {
                lblMessage.Text = "Unable to save feedback. Please try again.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
using System;

namespace Lifelink
{
    public partial class CreateNewRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            Page.Validate("RequestForm");

            if (!Page.IsValid)
            {
                return;
            }

            switch (ddlRequestType.SelectedValue)
            {
                case "Blood":
                    Response.Redirect("BloodRequest.aspx");
                    break;

                case "Food":
                    Response.Redirect("FoodAssistance.aspx");
                    break;

                case "Emergency":
                    Response.Redirect("EmergencyHelp.aspx");
                    break;

                case "Volunteer":
                    Response.Redirect("VolunteerRequest.aspx");
                    break;

                default:
                    lblMessage.Text =
                        "Please select a valid request type.";
                    break;
            }
        }
    }
}


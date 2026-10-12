
using System;
using System.Web.UI;

namespace Lifelink
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool isLoggedIn = Session["UserID"] != null;

            // Show Login before user login.
            pnlGuest.Visible = !isLoggedIn;

            // Show Logout and Profile after user login.
            pnlUser.Visible = isLoggedIn;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("~/Home.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}
using System;
using System.Web.UI;

namespace Lifelink.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear the current session.
            Session.Clear();
            Session.Abandon();

            // Redirect to the admin login page.
            Response.Redirect("~/Admin/AdminLogin.aspx", false);

            // Finish processing the current request.
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}


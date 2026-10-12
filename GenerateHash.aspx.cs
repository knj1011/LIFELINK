using System;

namespace Lifelink
{
    public partial class GenerateHash : System.Web.UI.Page
    {
        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            string password = txtPassword.Text;

            if (string.IsNullOrWhiteSpace(password))
            {
                lblHash.Text = "Please enter a password.";
                return;
            }

            lblHash.Text = PasswordHelper.HashPassword(password);
        }
    }
}


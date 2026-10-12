using System;
using System.Web.UI;

namespace EstateX
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlSuccess.Visible = false;
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Pure server-side validation check
            if (Page.IsValid)
            {
                string fullName = txtFullName.Text.Trim();
                string email = txtEmail.Text.Trim();
                string phone = txtPhone.Text.Trim();
                string password = txtPassword.Text;

                pnlSuccess.Visible = true;

                // Clear fields
                txtFullName.Text = string.Empty;
                txtEmail.Text = string.Empty;
                txtPhone.Text = string.Empty;
                txtPassword.Text = string.Empty;
                txtConfirmPassword.Text = string.Empty;
            }
        }
    }
}
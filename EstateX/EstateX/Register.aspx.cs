using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EstateX
{
    public partial class Register : Page
    {
        private const int PasswordMinLength = 6;

        private static readonly Regex FullNamePattern = new Regex(
            @"^[A-Za-z][A-Za-z .'-]{1,99}$",
            RegexOptions.Compiled);

        private static readonly Regex EmailPattern = new Regex(
            @"^[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\.)+[A-Za-z]{2,}$",
            RegexOptions.Compiled);

        // Indian mobile numbers are ten digits and start with 6, 7, 8 or 9.
        private static readonly Regex PhonePattern = new Regex(
            @"^[6-9][0-9]{9}$",
            RegexOptions.Compiled);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            pnlRegisterResult.Visible = false;

            // Re-run the group server-side; never trust the client-side pass.
            Page.Validate("RegisterValidation");

            if (!Page.IsValid)
            {
                return;
            }

            string fullName = (txtFullName.Text ?? string.Empty).Trim();
            string email = (txtEmail.Text ?? string.Empty).Trim();
            string password = txtPassword.Text ?? string.Empty;
            string confirmPassword = txtConfirmPassword.Text ?? string.Empty;
            string phone = (txtPhone.Text ?? string.Empty).Trim();

            // Defence in depth: repeat the rules the validators enforce, so a
            // forged post that skips them still cannot get through.
            if (!FullNamePattern.IsMatch(fullName)
                || !EmailPattern.IsMatch(email)
                || password.Length < PasswordMinLength
                || !string.Equals(password, confirmPassword, StringComparison.Ordinal)
                || !PhonePattern.IsMatch(phone))
            {
                return;
            }

            // No data store is wired up yet, so confirm the details instead of
            // claiming an account was created.
            litRegisterResult.Text = "<strong>Registration details validated.</strong><br />"
                + "Thanks, " + Server.HtmlEncode(fullName)
                + ". We will use " + Server.HtmlEncode(email)
                + " once account storage is connected.";

            pnlRegisterResult.Visible = true;

            ClearForm();
        }

        private void ClearForm()
        {
            txtFullName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtConfirmPassword.Text = string.Empty;
            txtPhone.Text = string.Empty;
        }
    }
}

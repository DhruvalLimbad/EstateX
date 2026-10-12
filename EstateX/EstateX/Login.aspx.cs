using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EstateX
{
    public partial class Login : Page
    {
        private const int PasswordMinLength = 6;

        private static readonly Regex EmailPattern = new Regex(
            @"^[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\.)+[A-Za-z]{2,}$",
            RegexOptions.Compiled);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            pnlLoginResult.Visible = false;

            // Re-run the group server-side; never trust the client-side pass.
            Page.Validate("LoginValidation");

            if (!Page.IsValid)
            {
                return;
            }

            string email = (txtEmail.Text ?? string.Empty).Trim();
            string password = txtPassword.Text ?? string.Empty;

            // Defence in depth: repeat the rules the validators enforce, so a
            // forged post that skips them still cannot get through.
            if (!EmailPattern.IsMatch(email) || password.Length < PasswordMinLength)
            {
                return;
            }

            // No membership store is wired up yet, so confirm the input instead
            // of asserting that the credentials are correct.
            litLoginResult.Text = "<strong>Login details validated.</strong><br />"
                + "Signing in as " + Server.HtmlEncode(email)
                + ". Authentication is not connected yet.";

            pnlLoginResult.Visible = true;
        }
    }
}

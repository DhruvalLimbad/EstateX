using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EstateX
{
    public partial class Contact : Page
    {
        private const int SubjectMinLength = 2;
        private const int SubjectMaxLength = 150;
        private const int MessageMinLength = 10;
        private const int MessageMaxLength = 2000;

        private static readonly Regex FullNamePattern = new Regex(
            @"^[A-Za-z][A-Za-z .'-]{1,99}$",
            RegexOptions.Compiled);

        private static readonly Regex EmailPattern = new Regex(
            @"^[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\.)+[A-Za-z]{2,}$",
            RegexOptions.Compiled);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            pnlContactResult.Visible = false;

            // Re-run the group server-side; never trust the client-side pass.
            Page.Validate("ContactValidation");

            if (!Page.IsValid)
            {
                return;
            }

            string fullName = (txtFullName.Text ?? string.Empty).Trim();
            string email = (txtEmail.Text ?? string.Empty).Trim();
            string subject = (txtSubject.Text ?? string.Empty).Trim();
            string message = (txtMessage.Text ?? string.Empty).Trim();

            // Defence in depth: repeat the rules the validators enforce, so a
            // forged post that skips them still cannot get through.
            if (!FullNamePattern.IsMatch(fullName)
                || !EmailPattern.IsMatch(email)
                || subject.Length < SubjectMinLength || subject.Length > SubjectMaxLength
                || message.Length < MessageMinLength || message.Length > MessageMaxLength)
            {
                return;
            }

            // Nothing sends mail yet, so acknowledge the message rather than
            // claiming it reached anybody.
            litContactResult.Text = "<strong>Thanks, " + Server.HtmlEncode(fullName) + ".</strong><br />"
                + "We have your message about &ldquo;" + Server.HtmlEncode(subject) + "&rdquo; and will reply to "
                + Server.HtmlEncode(email) + " once mail delivery is connected.";

            pnlContactResult.Visible = true;

            ClearForm();
        }

        private void ClearForm()
        {
            txtFullName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtSubject.Text = string.Empty;
            txtMessage.Text = string.Empty;
        }
    }
}

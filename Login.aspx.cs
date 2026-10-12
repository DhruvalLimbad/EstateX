using System;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EstateX
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void cvEmail_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string email = (args.Value ?? string.Empty).Trim();

            if (string.Equals(email, "admin@123", StringComparison.OrdinalIgnoreCase))
            {
                args.IsValid = true;
                return;
            }

            args.IsValid = Regex.IsMatch(email, @"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$");
        }

        protected void cvPassword_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string email = (txtEmail.Text ?? string.Empty).Trim();
            string password = args.Value ?? string.Empty;

            if (string.Equals(email, "admin@123", StringComparison.OrdinalIgnoreCase))
            {
                if (password == "admin@123")
                {
                    args.IsValid = true;
                }
                else
                {
                    cvPassword.ErrorMessage = "Invalid admin password.";
                    args.IsValid = false;
                }
                return;
            }

            bool hasDigit = Regex.IsMatch(password, @"[0-9]");
            bool hasSpecial = Regex.IsMatch(password, @"[!@#$%^&*()_+\-=\[\]{};':""\\|,.<>\/?]");
            bool hasLength = password.Length >= 8;

            cvPassword.ErrorMessage = "Password must be at least 8 characters and contain at least 1 number and 1 special symbol.";
            args.IsValid = hasDigit && hasSpecial && hasLength;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string email = txtEmail.Text.Trim();

                if (string.Equals(email, "admin@123", StringComparison.OrdinalIgnoreCase))
                {
                    Session["UserRole"] = "Admin";
                    Session["UserEmail"] = email;
                    Session["UserName"] = "Bhargav Admin";
                    Response.Redirect("~/AdminDashboard.aspx");
                }
                else
                {
                    // User login: explicit session assignment
                    Session["UserRole"] = "User";
                    Session["UserEmail"] = email;
                    Session["UserName"] = "Dhruval";

                    Response.Redirect("~/Default.aspx");
                }
            }
        }
    }
}
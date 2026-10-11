using System;
using System.Web.UI;

namespace EstateX
{
    public partial class UserProfile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Disable UnobtrusiveValidationMode for this page to prevent validator crashes
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (Session["UserRole"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                string name = Session["UserName"] != null ? Session["UserName"].ToString() : "Dhruval";
                string phone = Session["UserPhone"] != null ? Session["UserPhone"].ToString() : "+91 9106536420";
                string address = Session["UserAddress"] != null ? Session["UserAddress"].ToString() : "Bandra West, Mumbai";
                string email = Session["UserEmail"] != null ? Session["UserEmail"].ToString() : "dhruval@estatex.in";

                litUserName.Text = name;
                litUserPhone.Text = phone;
                litUserAddress.Text = address;
                litUserEmail.Text = email;

                txtEditName.Text = name;
                txtEditPhone.Text = phone;
                txtEditAddress.Text = address;
            }
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            Page.Validate("vgProfile");

            if (Page.IsValid)
            {
                // Update Session values
                Session["UserName"] = txtEditName.Text.Trim();
                Session["UserPhone"] = txtEditPhone.Text.Trim();
                Session["UserAddress"] = txtEditAddress.Text.Trim();

                // Reflect updated details on the page
                litUserName.Text = Session["UserName"].ToString();
                litUserPhone.Text = Session["UserPhone"].ToString();
                litUserAddress.Text = Session["UserAddress"].ToString();

                pnlSuccess.Visible = true;

                // Close modal
                ScriptManager.RegisterStartupScript(this, GetType(), "CloseModal", "closeProfileModal();", true);
            }
            else
            {
                // Reopen modal to show validation error messages
                pnlSuccess.Visible = false;
                ScriptManager.RegisterStartupScript(this, GetType(), "ReopenModal", "openProfileModal();", true);
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Default.aspx");
        }
    }
}
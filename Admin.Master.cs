using System;
using System.Web.UI;

namespace EstateX
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Security check: Verify admin role
            if (Session["UserRole"] == null || !string.Equals(Session["UserRole"].ToString(), "Admin", StringComparison.OrdinalIgnoreCase))
            {
                // Optional development bypass: uncomment during development if login is not wired yet
                // Session["UserRole"] = "Admin";

                Response.Redirect("~/Login.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }
        }

        // Handles logout from the Admin Header
        protected void btnAdminLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Login.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }

        // Secondary handler in case your button in Admin.Master is named OnClick="btnLogout_Click"
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            btnAdminLogout_Click(sender, e);
        }
    }
}
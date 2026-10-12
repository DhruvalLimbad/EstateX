using System;
using System.Web.UI;

namespace EstateX
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is logged in
            if (Session["UserRole"] != null && Session["UserRole"].ToString() == "User")
            {
                phGuestNav.Visible = false;
                phUserNav.Visible = true;
            }
            else
            {
                phGuestNav.Visible = true;
                phUserNav.Visible = false;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
    }
}
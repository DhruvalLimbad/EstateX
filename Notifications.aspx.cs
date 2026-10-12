using System;
using System.Web.UI;

namespace EstateX
{
    public partial class Notifications : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Restrict page to logged-in users
            if (Session["UserRole"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }
        }
    }
}
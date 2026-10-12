using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EstateX
{
    public partial class MyVisits : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Security check: Redirect to Login if not logged in
            if (Session["UserRole"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string propertyName = btn.CommandArgument;

            // Handle cancellation logic here (e.g., update database status to Cancelled)
        }
    }
}
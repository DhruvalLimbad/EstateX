using System;
using System.Web;
using System.Web.UI;

namespace EstateX
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Always set to Dhruval after login without guest fallback
                litWelcomeHeading.Text = "Welcome back, <span class=\"welcome-name\"></span>";
            }
        }

        protected void btnHeroSearch_Click(object sender, EventArgs e)
        {
            string loc = HttpUtility.UrlEncode(txtHeroLoc.Text.Trim());
            string type = HttpUtility.UrlEncode(ddlHeroType.SelectedValue);
            string range = HttpUtility.UrlEncode(ddlHeroPrice.SelectedValue);

            Response.Redirect(string.Format("~/PropertyList.aspx?loc={0}&type={1}&range={2}", loc, type, range));
        }
    }
}
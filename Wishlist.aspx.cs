using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EstateX
{
    public partial class Wishlist : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Restrict page to logged-in users only
            if (Session["UserRole"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string id = btn.CommandArgument;

            if (id == "1") pnlCard1.Visible = false;
            else if (id == "2") pnlCard2.Visible = false;
            else if (id == "3") pnlCard3.Visible = false;

            // Recalculate remaining count
            int count = (pnlCard1.Visible ? 1 : 0) + (pnlCard2.Visible ? 1 : 0) + (pnlCard3.Visible ? 1 : 0);
            litCount.Text = "You have saved " + count + " " + (count == 1 ? "property" : "properties") + ".";
        }
    }
}
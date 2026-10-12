using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EstateX
{
    public partial class PropertyList : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Read query string parameters forwarded from Home (Default.aspx)
                if (!string.IsNullOrEmpty(Request.QueryString["loc"]))
                {
                    txtLocation.Text = HttpUtility.UrlDecode(Request.QueryString["loc"]);
                }

                if (!string.IsNullOrEmpty(Request.QueryString["type"]))
                {
                    string selectedType = HttpUtility.UrlDecode(Request.QueryString["type"]);
                    ListItem item = ddlType.Items.FindByValue(selectedType);
                    if (item != null)
                    {
                        ddlType.ClearSelection();
                        item.Selected = true;
                    }
                }

                if (!string.IsNullOrEmpty(Request.QueryString["range"]))
                {
                    string selectedRange = HttpUtility.UrlDecode(Request.QueryString["range"]);
                    ListItem item = ddlPrice.Items.FindByValue(selectedRange);
                    if (item != null)
                    {
                        ddlPrice.ClearSelection();
                        item.Selected = true;
                    }
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // Reload the page with the updated query parameters
            string loc = HttpUtility.UrlEncode(txtLocation.Text.Trim());
            string type = HttpUtility.UrlEncode(ddlType.SelectedValue);
            string range = HttpUtility.UrlEncode(ddlPrice.SelectedValue);

            Response.Redirect(string.Format("~/PropertyList.aspx?loc={0}&type={1}&range={2}", loc, type, range));
        }
    }
}
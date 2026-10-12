using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EstateX
{
    public partial class PropertyDetail : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // This page has no navigation entry of its own, so it lights up the
            // listing it was reached from.
            SiteMaster master = Master as SiteMaster;

            if (master != null)
            {
                master.ActiveNavItem = "Properties";
            }
        }
    }
}

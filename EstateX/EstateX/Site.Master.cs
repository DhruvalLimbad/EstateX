using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EstateX
{
    public partial class SiteMaster : MasterPage
    {
        /// <summary>
        /// Lets a page that is not itself a navigation entry - a property detail
        /// page, say - light up the entry it sits under. Pages set this from their
        /// own Page_Load, which runs before the navigation is rendered.
        /// </summary>
        public string ActiveNavItem { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Renders the class (and aria-current) attributes for a top navigation link,
        /// highlighting the entry that matches the page currently being served.
        /// </summary>
        /// <param name="pageName">File name of the page, without its extension.</param>
        protected string NavAttributes(string pageName)
        {
            return IsCurrentPage(pageName)
                ? "class=\"ef-nav-link is-active\" aria-current=\"page\""
                : "class=\"ef-nav-link\"";
        }

        /// <summary>
        /// Marks the header's Login link while the login page itself is being
        /// served. Register needs no equivalent - it is a filled button already.
        /// </summary>
        protected string LoginNavClass()
        {
            return IsCurrentPage("Login")
                ? "ef-nav-login is-active"
                : "ef-nav-login";
        }

        /// <summary>
        /// The same idea as <see cref="NavAttributes"/> for the footer link row,
        /// which needs only the marker - its links carry their own styling.
        /// </summary>
        protected string FooterNavAttributes(string pageName)
        {
            return IsCurrentPage(pageName)
                ? "class=\"is-active\" aria-current=\"page\""
                : string.Empty;
        }

        private bool IsCurrentPage(string pageName)
        {
            // A page may nominate the entry it belongs under; only when it does
            // not do we fall back to matching the file being served.
            if (!string.IsNullOrEmpty(ActiveNavItem))
            {
                return string.Equals(ActiveNavItem, pageName, StringComparison.OrdinalIgnoreCase);
            }

            string path = Request.AppRelativeCurrentExecutionFilePath;

            if (string.IsNullOrEmpty(path))
            {
                return false;
            }

            string current = Path.GetFileNameWithoutExtension(path);

            return string.Equals(current, pageName, StringComparison.OrdinalIgnoreCase);
        }
    }
}

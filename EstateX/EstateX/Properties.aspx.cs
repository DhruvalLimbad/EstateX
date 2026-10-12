using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EstateX
{
    public partial class Properties : Page
    {
        private const int LocationMinLength = 2;
        private const int LocationMaxLength = 100;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Server-side half of the location rule. The filter is optional, so an
        /// empty box passes; anything typed must be between two and one hundred
        /// non-whitespace-padded characters. Mirrors validateFilterLocation().
        /// </summary>
        protected void cvLocation_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string value = (args.Value ?? string.Empty).Trim();

            args.IsValid = value.Length == 0
                        || (value.Length >= LocationMinLength && value.Length <= LocationMaxLength);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            pnlSearchResult.Visible = false;

            // Re-run the group server-side; never trust the client-side pass.
            Page.Validate("FilterValidation");

            if (!Page.IsValid)
            {
                return;
            }

            string location = (txtLocation.Text ?? string.Empty).Trim();
            string propertyType = ddlPropertyType.SelectedValue;
            string priceRange = ddlPriceRange.SelectedValue;

            // Defence in depth: repeat the rules the validators enforce, so a
            // forged post that skips them still cannot get through.
            if (location.Length > 0
                && (location.Length < LocationMinLength || location.Length > LocationMaxLength))
            {
                return;
            }

            if (!IsKnownPropertyType(propertyType) || !IsKnownPriceRange(priceRange))
            {
                return;
            }

            // Echo the readable labels rather than the posted keys.
            string locationLabel = location.Length == 0 ? "Anywhere" : location;
            string propertyTypeLabel = ddlPropertyType.SelectedItem.Text;
            string priceRangeLabel = ddlPriceRange.SelectedItem.Text;

            // No data store is wired up yet, so confirm the criteria instead.
            litSearchResult.Text = "<strong>Searching properties&hellip;</strong><br />"
                + "Location: " + Server.HtmlEncode(locationLabel)
                + " &nbsp;|&nbsp; Property Type: " + Server.HtmlEncode(propertyTypeLabel)
                + " &nbsp;|&nbsp; Price Range: " + Server.HtmlEncode(priceRangeLabel);

            pnlSearchResult.Visible = true;
        }

        /// <summary>
        /// Confirms the posted value is one the drop-down actually offers. The
        /// empty value is legitimate here - it is the "All Types" entry.
        /// </summary>
        private bool IsKnownPropertyType(string value)
        {
            return ddlPropertyType.Items.FindByValue(value ?? string.Empty) != null;
        }

        private bool IsKnownPriceRange(string value)
        {
            return ddlPriceRange.Items.FindByValue(value ?? string.Empty) != null;
        }
    }
}

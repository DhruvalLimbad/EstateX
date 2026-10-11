using System;
using System.Web.UI;

namespace EstateX
{
    public partial class PropertyDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Load property data only on the first visit
            if (!IsPostBack)
            {
                string propertyId = Request.QueryString["id"];
                PopulatePropertyData(propertyId);
            }
        }

        /// <summary>
        /// Sets label values and images based on the property ID.
        /// </summary>
        private void PopulatePropertyData(string id)
        {
            switch (id)
            {
                case "2":
                    lblBreadcrumbTitle.Text = "Oakwood Terrace";
                    lblTitle.Text = "Oakwood Terrace";
                    lblPrice.Text = "₹ 12,00,000";
                    lblLocation.Text = "📍 Ahmedabad";
                    lblType.Text = "Townhouse";
                    lblArea.Text = "1,850 sqft";
                    lblBeds.Text = "3 Beds";
                    lblBaths.Text = "2.5 Baths";
                    imgMainPhoto.ImageUrl = "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=1200";
                    break;

                case "3":
                    lblBreadcrumbTitle.Text = "Maple Grove Estate";
                    lblTitle.Text = "Maple Grove Estate";
                    lblPrice.Text = "₹ 24,00,000";
                    lblLocation.Text = "📍 Noida";
                    lblType.Text = "House";
                    lblArea.Text = "3,200 sqft";
                    lblBeds.Text = "5 Beds";
                    lblBaths.Text = "4 Baths";
                    imgMainPhoto.ImageUrl = "https://images.unsplash.com/photo-1600566753376-12c8ab7fb75b?w=1200";
                    break;

                case "4":
                    lblBreadcrumbTitle.Text = "Innovation Hub";
                    lblTitle.Text = "Innovation Hub";
                    lblPrice.Text = "₹ 4,500";
                    lblLocation.Text = "📍 Rajkot District";
                    lblType.Text = "Commercial";
                    lblArea.Text = "500 sqft";
                    lblBeds.Text = "Open Floor";
                    lblBaths.Text = "1 Bath";
                    imgMainPhoto.ImageUrl = "https://images.unsplash.com/photo-1497366216548-37526070297c?w=1200";
                    break;

                case "1":
                default:
                    // Default fallback: Modern Penthouse Suite
                    lblBreadcrumbTitle.Text = "Modern Penthouse Suite";
                    lblTitle.Text = "Modern Penthouse Suite";
                    lblPrice.Text = "₹ 3,450,000";
                    lblLocation.Text = "📍 Mumbai District";
                    lblType.Text = "Condominium";
                    lblArea.Text = "2,450 sqft";
                    lblBeds.Text = "3 Beds";
                    lblBaths.Text = "3.5 Baths";
                    imgMainPhoto.ImageUrl = "https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=1200";
                    break;
            }
        }
        protected void btnAddToWishlist_Click(object sender, EventArgs e)
        {
            // Ensure the user is logged in before redirecting to the wishlist
            if (Session["UserRole"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            // Redirect to the wishlist page
            Response.Redirect("~/Wishlist.aspx");
        }
    }
}
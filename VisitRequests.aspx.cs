using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EstateX
{
    [Serializable]
    public class VisitBookingItem
    {
        public int Id { get; set; }
        public string Customer { get; set; }
        public string Property { get; set; }
        public string VisitDate { get; set; }
        public string Status { get; set; }
        public string AssignedAgent { get; set; }
        public string Notes { get; set; }
    }

    public partial class VisitRequests : Page
    {
        private List<VisitBookingItem> Bookings
        {
            get
            {
                if (ViewState["VisitBookings"] == null)
                {
                    // Preloaded data matching your screenshot
                    var items = new List<VisitBookingItem>
                    {
                        new VisitBookingItem { Id = 1, Customer = "Rohan Mehta", Property = "Green Valley Apartment", VisitDate = "08 Aug 2026, 11:00 AM", Status = "Pending" },
                        new VisitBookingItem { Id = 2, Customer = "Neha Joshi", Property = "City Center Office", VisitDate = "07 Aug 2026, 3:30 PM", Status = "Approved" },
                        new VisitBookingItem { Id = 3, Customer = "Ayesha Khan", Property = "Sunrise Villa", VisitDate = "06 Aug 2026, 10:00 AM", Status = "Rejected" },
                        new VisitBookingItem { Id = 4, Customer = "Vikram Shah", Property = "Lakeview Bungalow", VisitDate = "09 Aug 2026, 4:00 PM", Status = "Pending" }
                    };
                    ViewState["VisitBookings"] = items;
                }
                return (List<VisitBookingItem>)ViewState["VisitBookings"];
            }
            set
            {
                ViewState["VisitBookings"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                BindVisits();
            }
        }

        private void BindVisits()
        {
            var data = Bookings.AsEnumerable();

            // Status filter
            string status = ddlStatusFilter.SelectedValue;
            if (status != "All")
            {
                data = data.Where(v => v.Status.Equals(status, StringComparison.OrdinalIgnoreCase));
            }

            // Search filter
            string query = txtSearchVisits.Text.Trim().ToLower();
            if (!string.IsNullOrEmpty(query))
            {
                data = data.Where(v => v.Customer.ToLower().Contains(query) || v.Property.ToLower().Contains(query));
            }

            rptVisits.DataSource = data.ToList();
            rptVisits.DataBind();
        }

        protected void FilterVisits(object sender, EventArgs e)
        {
            BindVisits();
        }

        protected void rptVisits_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int bookingId = Convert.ToInt32(e.CommandArgument);
            var list = Bookings;
            var item = list.FirstOrDefault(x => x.Id == bookingId);

            if (item == null) return;

            if (e.CommandName == "OpenConfirmModal")
            {
                // Populate popup and open modal
                hfSelectedVisitId.Value = item.Id.ToString();
                txtConfirmCustomer.Text = item.Customer;
                txtConfirmProperty.Text = item.Property;
                txtConfirmedDate.Text = item.VisitDate;
                txtAssignedAgent.Text = item.AssignedAgent ?? "";
                txtVisitNotes.Text = item.Notes ?? "";

                ScriptManager.RegisterStartupScript(this, GetType(), "OpenModal", "openConfirmModal();", true);
            }
            else if (e.CommandName == "RejectVisit")
            {
                item.Status = "Rejected";
                Bookings = list;
                ShowAlert("Visit for '" + item.Customer + "' has been rejected.");
                BindVisits();
            }
            else if (e.CommandName == "ViewVisit")
            {
                ShowAlert("Viewing visit request for " + item.Customer + " on " + item.Property + " (" + item.VisitDate + ").");
            }
        }

        protected void btnSubmitConfirm_Click(object sender, EventArgs e)
        {
            Page.Validate("vgConfirmVisit");
            if (Page.IsValid)
            {
                int bookingId = Convert.ToInt32(hfSelectedVisitId.Value);
                var list = Bookings;
                var item = list.FirstOrDefault(x => x.Id == bookingId);

                if (item != null)
                {
                    item.Status = "Approved";
                    item.VisitDate = txtConfirmedDate.Text.Trim();
                    item.AssignedAgent = txtAssignedAgent.Text.Trim();
                    item.Notes = txtVisitNotes.Text.Trim();

                    Bookings = list;
                    BindVisits();

                    ShowAlert("Visit successfully confirmed and scheduled with " + item.AssignedAgent + "!");
                    ScriptManager.RegisterStartupScript(this, GetType(), "CloseModal", "closeConfirmModal();", true);
                }
            }
            else
            {
                // Keep modal open if validation failed
                ScriptManager.RegisterStartupScript(this, GetType(), "KeepModalOpen", "openConfirmModal();", true);
            }
        }

        private void ShowAlert(string msg)
        {
            pnlAlert.Visible = true;
            litAlertMsg.Text = msg;
        }
    }
}
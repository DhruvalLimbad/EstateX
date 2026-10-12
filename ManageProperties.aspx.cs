using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EstateX
{
    [Serializable]
    public class PropertyItem
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Location { get; set; }
        public string Category { get; set; }
        public long RawPrice { get; set; }
        public string FormattedPrice { get; set; }
        public string Status { get; set; }
    }

    public partial class ManageProperties : Page
    {
        private static readonly CultureInfo IndianCulture = new CultureInfo("en-IN");

        private List<PropertyItem> PropertiesList
        {
            get
            {
                if (ViewState["PropertiesList"] == null)
                {
                    var list = new List<PropertyItem>
                    {
                        new PropertyItem { Id = 1, Name = "Green Valley Apartment", Location = "Sector 12, Rajkot", Category = "Apartment", RawPrice = 4250000, FormattedPrice = "₹ 42,50,000", Status = "Published" },
                        new PropertyItem { Id = 2, Name = "Sunrise Villa", Location = "Kalawad Road, Rajkot", Category = "Villa", RawPrice = 12000000, FormattedPrice = "₹ 1,20,00,000", Status = "Draft" },
                        new PropertyItem { Id = 3, Name = "City Center Office", Location = "Race Course Road, Rajkot", Category = "Office", RawPrice = 7800000, FormattedPrice = "₹ 78,00,000", Status = "Published" },
                        new PropertyItem { Id = 4, Name = "Lakeview Bungalow", Location = "Nana Mava, Rajkot", Category = "Villa", RawPrice = 9500000, FormattedPrice = "₹ 95,00,000", Status = "Sold" },
                        new PropertyItem { Id = 5, Name = "Riverside Plot A-14", Location = "150 Feet Ring Road, Rajkot", Category = "Plot", RawPrice = 3000000, FormattedPrice = "₹ 30,00,000", Status = "Published" }
                    };
                    ViewState["PropertiesList"] = list;
                }
                return (List<PropertyItem>)ViewState["PropertiesList"];
            }
            set
            {
                ViewState["PropertiesList"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            var data = PropertiesList.AsEnumerable();

            string search = txtSearch.Text.Trim().ToLower();
            if (!string.IsNullOrEmpty(search))
            {
                data = data.Where(p => p.Name.ToLower().Contains(search) || p.Location.ToLower().Contains(search));
            }

            if (!string.IsNullOrEmpty(ddlFilterCategory.SelectedValue))
            {
                data = data.Where(p => p.Category.Equals(ddlFilterCategory.SelectedValue, StringComparison.OrdinalIgnoreCase));
            }

            if (!string.IsNullOrEmpty(ddlFilterStatus.SelectedValue))
            {
                data = data.Where(p => p.Status.Equals(ddlFilterStatus.SelectedValue, StringComparison.OrdinalIgnoreCase));
            }

            rptProperties.DataSource = data.ToList();
            rptProperties.DataBind();
        }

        protected void FilterChanged(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void rptProperties_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int propId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "DeleteProp")
            {
                var list = PropertiesList;
                var item = list.FirstOrDefault(p => p.Id == propId);
                if (item != null)
                {
                    list.Remove(item);
                    PropertiesList = list;
                    ShowAlert("Property '" + item.Name + "' deleted successfully.");
                }
                BindGrid();
            }
            else if (e.CommandName == "EditProp")
            {
                var item = PropertiesList.FirstOrDefault(p => p.Id == propId);
                if (item != null)
                {
                    string script = string.Format("openPropModal({0}, '{1}', '{2}', '{3}', '{4}', '{5}');",
                        item.Id,
                        item.Name.Replace("'", "\\'"),
                        item.Location.Replace("'", "\\'"),
                        item.Category,
                        item.RawPrice,
                        item.Status);

                    ScriptManager.RegisterStartupScript(this, GetType(), "OpenEditPropModal", script, true);
                }
            }
        }

        protected void btnSaveProperty_Click(object sender, EventArgs e)
        {
            Page.Validate("vgProp");
            if (Page.IsValid)
            {
                int propId = Convert.ToInt32(hfPropId.Value);
                long priceVal = Convert.ToInt64(txtPropPrice.Text.Trim());
                string formattedPrice = "₹ " + priceVal.ToString("N0", IndianCulture);

                var list = PropertiesList;

                if (propId == 0)
                {
                    int nextId = list.Count > 0 ? list.Max(p => p.Id) + 1 : 1;
                    list.Add(new PropertyItem
                    {
                        Id = nextId,
                        Name = txtPropName.Text.Trim(),
                        Location = txtPropLocation.Text.Trim(),
                        Category = ddlModalCategory.SelectedValue,
                        RawPrice = priceVal,
                        FormattedPrice = formattedPrice,
                        Status = ddlModalStatus.SelectedValue
                    });

                    ShowAlert("Property added successfully!");
                }
                else
                {
                    var existing = list.FirstOrDefault(p => p.Id == propId);
                    if (existing != null)
                    {
                        existing.Name = txtPropName.Text.Trim();
                        existing.Location = txtPropLocation.Text.Trim();
                        existing.Category = ddlModalCategory.SelectedValue;
                        existing.RawPrice = priceVal;
                        existing.FormattedPrice = formattedPrice;
                        existing.Status = ddlModalStatus.SelectedValue;

                        ShowAlert("Property updated successfully!");
                    }
                }

                PropertiesList = list;
                BindGrid();

                ScriptManager.RegisterStartupScript(this, GetType(), "ClosePropModal", "closePropModal();", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "KeepPropModalOpen", "var m = document.getElementById('propModal'); if(m) m.classList.add('active');", true);
            }
        }

        private void ShowAlert(string text)
        {
            pnlMsg.Visible = true;
            litMsg.Text = text;
        }
    }
}
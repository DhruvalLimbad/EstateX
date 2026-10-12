using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EstateX
{
    [Serializable]
    public class PropertyCategory
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
    }

    public partial class Categories : Page
    {
        private List<PropertyCategory> CategoryList
        {
            get
            {
                if (ViewState["CategoryList"] == null)
                {
                    // Prepopulated with data matching the reference image exactly
                    var items = new List<PropertyCategory>
                    {
                        new PropertyCategory { Id = 1, Name = "Apartment", Description = "Residential flats within multi-storey buildings." },
                        new PropertyCategory { Id = 2, Name = "Villa", Description = "Independent standalone houses with private land." },
                        new PropertyCategory { Id = 3, Name = "Office", Description = "Commercial spaces for business use." },
                        new PropertyCategory { Id = 4, Name = "Plot", Description = "Vacant land available for construction." }
                    };
                    ViewState["CategoryList"] = items;
                }
                return (List<PropertyCategory>)ViewState["CategoryList"];
            }
            set
            {
                ViewState["CategoryList"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                BindCategories();
            }
        }

        private void BindCategories()
        {
            rptCategories.DataSource = CategoryList;
            rptCategories.DataBind();
        }

        // Open modal in Add mode
        protected void btnOpenAddCategory_Click(object sender, EventArgs e)
        {
            hfCategoryId.Value = "0";
            litModalTitle.Text = "Add New Category";
            txtCategoryName.Text = string.Empty;
            txtCategoryDesc.Text = string.Empty;

            ScriptManager.RegisterStartupScript(this, GetType(), "OpenModal", "openCategoryModal();", true);
        }

        // Handles Edit & Delete commands from the repeater
        protected void rptCategories_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int catId = Convert.ToInt32(e.CommandArgument);
            var list = CategoryList;
            var target = list.FirstOrDefault(c => c.Id == catId);

            if (target == null) return;

            if (e.CommandName == "EditCategory")
            {
                hfCategoryId.Value = target.Id.ToString();
                litModalTitle.Text = "Edit Category";
                txtCategoryName.Text = target.Name;
                txtCategoryDesc.Text = target.Description;

                ScriptManager.RegisterStartupScript(this, GetType(), "OpenEditModal", "openCategoryModal();", true);
            }
            else if (e.CommandName == "DeleteCategory")
            {
                list.Remove(target);
                CategoryList = list;
                ShowAlert("Category '" + target.Name + "' was deleted successfully.");
                BindCategories();
            }
        }

        // .NET Custom Validator to prevent duplicate category names
        protected void cvCategoryNameUnique_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int currentId = 0;
            int.TryParse(hfCategoryId.Value, out currentId);

            string nameToCheck = args.Value.Trim();
            bool exists = CategoryList.Any(c => c.Name.Equals(nameToCheck, StringComparison.OrdinalIgnoreCase) && c.Id != currentId);

            args.IsValid = !exists;
        }

        // Save Category (Insert or Update)
        protected void btnSaveCategory_Click(object sender, EventArgs e)
        {
            Page.Validate("vgCategory");
            if (Page.IsValid)
            {
                int catId = Convert.ToInt32(hfCategoryId.Value);
                var list = CategoryList;

                if (catId == 0)
                {
                    // Insert
                    int nextId = list.Count > 0 ? list.Max(c => c.Id) + 1 : 1;
                    list.Add(new PropertyCategory
                    {
                        Id = nextId,
                        Name = txtCategoryName.Text.Trim(),
                        Description = txtCategoryDesc.Text.Trim()
                    });
                    ShowAlert("Category created successfully!");
                }
                else
                {
                    // Update
                    var target = list.FirstOrDefault(c => c.Id == catId);
                    if (target != null)
                    {
                        target.Name = txtCategoryName.Text.Trim();
                        target.Description = txtCategoryDesc.Text.Trim();
                        ShowAlert("Category updated successfully!");
                    }
                }

                CategoryList = list;
                BindCategories();
                ScriptManager.RegisterStartupScript(this, GetType(), "CloseModal", "closeCategoryModal();", true);
            }
            else
            {
                // Keep modal open if .NET validation fails
                ScriptManager.RegisterStartupScript(this, GetType(), "KeepModalOpen", "openCategoryModal();", true);
            }
        }

        private void ShowAlert(string msg)
        {
            pnlCategoryAlert.Visible = true;
            litCategoryMsg.Text = msg;
        }
    }
}
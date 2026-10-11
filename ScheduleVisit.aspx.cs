using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EstateX
{
    public partial class ScheduleVisit : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Ensure logged in
            if (Session["UserRole"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                // Auto-fill logged-in user's name
                txtName.Text = Session["UserName"] != null ? Session["UserName"].ToString() : "Dhruval";

                // If coming from Property Details with ?property=Name
                if (Request.QueryString["property"] != null)
                {
                    string propName = Request.QueryString["property"].Trim();
                    ListItem item = ddlProperty.Items.FindByValue(propName);
                    if (item != null)
                    {
                        ddlProperty.SelectedValue = propName;
                    }
                }
            }
        }

        protected void btnBookVisit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Here you can insert into your database/table using ADO.NET
                pnlSuccess.Visible = true;

                // Reset fields
                txtDate.Text = string.Empty;
                txtTime.Text = string.Empty;
                txtPhone.Text = string.Empty;
                ddlProperty.SelectedIndex = 0;
            }
        }
    }
}
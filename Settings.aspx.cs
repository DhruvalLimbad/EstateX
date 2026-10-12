using System;
using System.Web.UI;

namespace EstateX
{
    public partial class Settings : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                LoadGeneralSettings();
            }
        }

        private void LoadGeneralSettings()
        {
            // Initial field values matching your screenshot
            txtAppName.Text = "EstateX";
            txtSupportEmail.Text = "support@estatex.com";
            txtContactNumber.Text = "+91 9106536420";
        }

        protected void btnSaveSettings_Click(object sender, EventArgs e)
        {
            Page.Validate("vgSettings");
            if (Page.IsValid)
            {
                string appName = txtAppName.Text.Trim();
                string email = txtSupportEmail.Text.Trim();
                string phone = txtContactNumber.Text.Trim();

                pnlAlert.Visible = true;
                litAlertMsg.Text = "General settings saved successfully!";
            }
        }
    }
}
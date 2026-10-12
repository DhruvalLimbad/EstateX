using System;
using System.IO;
using System.Web.UI;

namespace EstateX
{
    public partial class AdminProfile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                LoadProfileData();
            }
        }

        private void LoadProfileData()
        {
            // Populate fields with initial data matching your screenshot
            txtFullName.Text = "BhargavAdmin";
            txtEmail.Text = "bhargav.admin@estatex.com";
            txtPhone.Text = "+91 9106536420";
            txtRole.Text = "Super Administrator";

            litCardName.Text = "Bhargav Admin";
            litCardRole.Text = "Super Administrator";
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            Page.Validate("vgProfile");
            if (Page.IsValid)
            {
                // Update display label in card
                litCardName.Text = txtFullName.Text.Trim();

                ShowAlert("Profile details updated successfully!", true);
            }
        }

        protected void btnCancelProfile_Click(object sender, EventArgs e)
        {
            LoadProfileData();
            pnlAlert.Visible = false;
        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            Page.Validate("vgPassword");
            if (Page.IsValid)
            {
                // In production, verify txtCurrentPassword against your database hash here
                string newPwd = txtNewPassword.Text.Trim();

                txtCurrentPassword.Text = string.Empty;
                txtNewPassword.Text = string.Empty;
                txtConfirmPassword.Text = string.Empty;

                ShowAlert("Password updated successfully!", true);
            }
        }

        protected void btnUploadPhotoHidden_Click(object sender, EventArgs e)
        {
            if (fuAdminPhoto.HasFile)
            {
                string ext = Path.GetExtension(fuAdminPhoto.FileName).ToLower();
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".png")
                {
                    string folder = Server.MapPath("~/Images/");
                    if (!Directory.Exists(folder))
                    {
                        Directory.CreateDirectory(folder);
                    }

                    string filePath = Path.Combine(folder, "admin-avatar" + ext);
                    fuAdminPhoto.SaveAs(filePath);

                    imgAdminAvatar.ImageUrl = "~/Images/admin-avatar" + ext + "?t=" + DateTime.Now.Ticks;
                    ShowAlert("Profile photo updated successfully!", true);
                }
                else
                {
                    ShowAlert("Please upload an image file (.jpg, .jpeg, or .png).", false);
                }
            }
        }

        protected void btnLogoutProfile_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }

        private void ShowAlert(string msg, bool isSuccess)
        {
            pnlAlert.Visible = true;
            pnlAlert.CssClass = isSuccess ? "alert-box alert-box-success" : "alert-box alert-box-error";
            litAlertMsg.Text = msg;
        }
    }
}
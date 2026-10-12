using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EstateX
{
    [Serializable]
    public class UserAccount
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Status { get; set; }
    }

    public partial class ManageUsers : Page
    {
        private List<UserAccount> UsersList
        {
            get
            {
                if (ViewState["UsersList"] == null)
                {
                    // Prepopulated with data matching the reference screen
                    var list = new List<UserAccount>
                    {
                        new UserAccount { Id = 1, Name = "Rohan Mehta", Email = "rohan.mehta@example.com", Phone = "+91 98765 43210", Status = "Active" },
                        new UserAccount { Id = 2, Name = "Ayesha Khan", Email = "ayesha.khan@example.com", Phone = "+91 91234 56780", Status = "Active" },
                        new UserAccount { Id = 3, Name = "Vikram Shah", Email = "vikram.shah@example.com", Phone = "+91 99887 65432", Status = "Blocked" },
                        new UserAccount { Id = 4, Name = "Neha Joshi", Email = "neha.joshi@example.com", Phone = "+91 90909 80808", Status = "Active" }
                    };
                    ViewState["UsersList"] = list;
                }
                return (List<UserAccount>)ViewState["UsersList"];
            }
            set
            {
                ViewState["UsersList"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                BindUsers();
            }
        }

        private void BindUsers()
        {
            var data = UsersList.AsEnumerable();

            string query = txtSearchUser.Text.Trim().ToLower();
            if (!string.IsNullOrEmpty(query))
            {
                data = data.Where(u => u.Name.ToLower().Contains(query) ||
                                       u.Email.ToLower().Contains(query) ||
                                       u.Phone.Contains(query));
            }

            rptUsers.DataSource = data.ToList();
            rptUsers.DataBind();
        }

        protected void txtSearchUser_TextChanged(object sender, EventArgs e)
        {
            BindUsers();
        }

        protected void rptUsers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int userId = Convert.ToInt32(e.CommandArgument);
            var list = UsersList;
            var targetUser = list.FirstOrDefault(u => u.Id == userId);

            if (targetUser == null) return;

            if (e.CommandName == "DeleteUser")
            {
                list.Remove(targetUser);
                UsersList = list;
                ShowNotification("User '" + targetUser.Name + "' was deleted successfully.");
                BindUsers();
            }
            else if (e.CommandName == "ToggleStatus")
            {
                targetUser.Status = (targetUser.Status == "Active") ? "Blocked" : "Active";
                UsersList = list;
                ShowNotification("Status of user '" + targetUser.Name + "' changed to " + targetUser.Status + ".");
                BindUsers();
            }
            else if (e.CommandName == "ViewUser")
            {
                ShowNotification("Viewing user profile: " + targetUser.Name + " (" + targetUser.Email + ")");
            }
        }

        protected void btnSaveUser_Click(object sender, EventArgs e)
        {
            Page.Validate("vgAddUser");
            if (Page.IsValid)
            {
                string rawPhone = txtNewUserPhone.Text.Trim();
                string formattedPhone = "+91 " + rawPhone.Substring(0, 5) + " " + rawPhone.Substring(5, 5);

                var list = UsersList;
                int nextId = list.Count > 0 ? list.Max(u => u.Id) + 1 : 1;

                list.Add(new UserAccount
                {
                    Id = nextId,
                    Name = txtNewUserName.Text.Trim(),
                    Email = txtNewUserEmail.Text.Trim(),
                    Phone = formattedPhone,
                    Status = ddlNewUserStatus.SelectedValue
                });

                UsersList = list;
                BindUsers();

                // Clear input fields
                txtNewUserName.Text = string.Empty;
                txtNewUserEmail.Text = string.Empty;
                txtNewUserPhone.Text = string.Empty;
                ddlNewUserStatus.SelectedIndex = 0;

                ShowNotification("User created successfully!");
                ScriptManager.RegisterStartupScript(this, GetType(), "CloseUserModal", "closeUserModal();", true);
            }
            else
            {
                // Keep modal visible if server-side validation finds invalid fields
                ScriptManager.RegisterStartupScript(this, GetType(), "KeepUserModalOpen", "var m = document.getElementById('userModal'); if(m) m.classList.add('active');", true);
            }
        }

        private void ShowNotification(string message)
        {
            pnlUserAlert.Visible = true;
            litUserMsg.Text = message;
        }
    }
}
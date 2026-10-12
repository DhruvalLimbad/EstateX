using System;
using System.Web.UI;

namespace EstateX
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Auto-fill subject if navigated from a property card/inquiry
                string propertyTitle = Request.QueryString["title"];
                if (!string.IsNullOrEmpty(propertyTitle))
                {
                    txtSubject.Text = "Inquiry regarding " + propertyTitle;
                }
            }
        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            // Pure server-side validation check
            if (Page.IsValid)
            {
                // In Section 7, you will save this inquiry to the database using ADO.NET
                pnlSuccess.Visible = true;

                // Clear input fields
                txtName.Text = string.Empty;
                txtEmail.Text = string.Empty;
                txtSubject.Text = string.Empty;
                txtMessage.Text = string.Empty;
            }
        }
    }
}
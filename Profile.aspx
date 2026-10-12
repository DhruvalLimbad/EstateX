<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="EstateX.UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .profile-page-wrapper {
            max-width: 650px;
            margin: 40px auto 80px auto;
            padding: 0 16px;
        }

        .profile-header-card {
            text-align: center;
            margin-bottom: 32px;
        }

        .avatar-container {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background-color: #e5e7eb;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 16px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
            border: 3px solid #ffffff;
            overflow: hidden;
        }

        .avatar-container svg {
            width: 56px;
            height: 56px;
            fill: #9ca3af;
        }

        .profile-name {
            font-size: 24px;
            font-weight: 800;
            color: #111827;
            margin: 0 0 8px 0;
        }

        .profile-meta-row {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 20px;
            font-size: 13px;
            color: #4b5563;
            flex-wrap: wrap;
        }

        .profile-meta-item {
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .profile-meta-item svg {
            width: 15px;
            height: 15px;
            stroke: #6b7280;
        }

        /* Success Alert */
        .profile-alert-success {
            background-color: #ecfdf5;
            color: #065f46;
            border: 1px solid #a7f3d0;
            padding: 12px 16px;
            border-radius: 8px;
            font-size: 13.5px;
            margin-bottom: 20px;
            text-align: center;
        }

        /* Action Cards Stack */
        .profile-actions-stack {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .profile-card-link {
            background-color: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 10px;
            padding: 22px;
            display: flex;
            align-items: flex-start;
            gap: 16px;
            text-decoration: none;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.04);
            transition: transform 0.15s ease, box-shadow 0.15s ease, border-color 0.15s ease;
            cursor: pointer;
            width: 100%;
            text-align: left;
            box-sizing: border-box;
        }

        .profile-card-link:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.07);
            border-color: #d1d5db;
        }

        .profile-badge-icon {
            width: 44px;
            height: 44px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .badge-blue {
            background-color: #1d63ed;
            color: #ffffff;
        }

        .badge-red {
            background-color: #fee2e2;
            color: #dc2626;
        }

        .profile-card-content {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .profile-card-title {
            font-size: 15px;
            font-weight: 700;
            color: #111827;
            margin: 0;
        }

        .profile-card-title.red-text {
            color: #dc2626;
        }

        .profile-card-desc {
            font-size: 12.5px;
            color: #6b7280;
            margin: 0;
        }

        /* --- MODAL POPUP STYLING --- */
        .modal-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(17, 24, 39, 0.6);
            backdrop-filter: blur(2px);
            z-index: 9999;
            align-items: center;
            justify-content: center;
            padding: 16px;
            box-sizing: border-box;
        }

        .modal-overlay.active {
            display: flex;
        }

        .modal-card {
            background: #ffffff;
            width: 100%;
            max-width: 480px;
            border-radius: 12px;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            padding: 24px;
            position: relative;
        }

        .modal-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
            padding-bottom: 12px;
            border-bottom: 1px solid #f3f4f6;
        }

        .modal-title {
            font-size: 18px;
            font-weight: 700;
            color: #111827;
            margin: 0;
        }

        .modal-close-btn {
            background: none;
            border: none;
            font-size: 24px;
            color: #9ca3af;
            cursor: pointer;
            padding: 0 4px;
            line-height: 1;
            transition: color 0.15s ease;
        }

        .modal-close-btn:hover {
            color: #111827;
        }

        .modal-form-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
            margin-bottom: 16px;
        }

        .modal-label {
            font-size: 12.5px;
            font-weight: 600;
            color: #374151;
        }

        .modal-input {
            width: 100%;
            height: 40px;
            padding: 8px 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 13.5px;
            color: #1f2937;
            background-color: #ffffff;
            box-sizing: border-box;
            outline: none;
            transition: border-color 0.15s ease;
        }

        .modal-input:focus {
            border-color: #2563eb;
        }

        textarea.modal-input {
            height: 80px;
            resize: vertical;
            padding: 10px 12px;
            font-family: inherit;
        }

        .val-error-text {
            color: #dc2626;
            font-size: 11.5px;
            font-weight: 500;
            margin-top: 2px;
            display: block;
        }

        .modal-actions {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            margin-top: 22px;
            padding-top: 14px;
            border-top: 1px solid #f3f4f6;
        }

        .btn-modal-cancel {
            background: #ffffff;
            color: #4b5563;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            padding: 0 16px;
            height: 38px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.15s ease;
        }

        .btn-modal-cancel:hover {
            background-color: #f9fafb;
        }

        .btn-modal-update {
            background-color: #2563eb;
            color: #ffffff;
            border: none;
            border-radius: 6px;
            padding: 0 22px;
            height: 38px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.15s ease;
        }

        .btn-modal-update:hover {
            background-color: #1d4ed8;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="profile-page-wrapper">
        <!-- Success Alert -->
        <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="profile-alert-success">
            ✅ Profile details updated successfully!
        </asp:Panel>

        <!-- Profile Header -->
        <div class="profile-header-card">
            <div class="avatar-container" title="User Profile">
                <svg viewBox="0 0 24 24">
                    <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
                </svg>
            </div>
            
            <h2 class="profile-name">
                <asp:Literal ID="litUserName" runat="server">Dhruval</asp:Literal>
            </h2>

            <div class="profile-meta-row">
                <span class="profile-meta-item">
                    <svg viewBox="0 0 24 24" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                        <polyline points="22,6 12,13 2,6"></polyline>
                    </svg>
                    <asp:Literal ID="litUserEmail" runat="server">dhruval@estatex.in</asp:Literal>
                </span>

                <span class="profile-meta-item">
                    <svg viewBox="0 0 24 24" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path>
                    </svg>
                    <asp:Literal ID="litUserPhone" runat="server">+91 9106536420</asp:Literal>
                </span>

                <span class="profile-meta-item">
                    <svg viewBox="0 0 24 24" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                        <circle cx="12" cy="10" r="3"></circle>
                    </svg>
                    <asp:Literal ID="litUserAddress" runat="server">Bandra West, Mumbai</asp:Literal>
                </span>
            </div>
        </div>

        <!-- 2 Action Cards -->
        <div class="profile-actions-stack">
            <!-- 1. Account Settings Card (Opens Modal Popup) -->
            <button type="button" class="profile-card-link" onclick="openProfileModal();">
                <div class="profile-badge-icon badge-blue">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                        <circle cx="8.5" cy="7" r="4"></circle>
                        <line x1="20" y1="8" x2="20" y2="14"></line>
                        <line x1="23" y1="11" x2="17" y2="11"></line>
                    </svg>
                </div>
                <div class="profile-card-content">
                    <h3 class="profile-card-title">Account Settings</h3>
                    <p class="profile-card-desc">Update your personal information and contact details.</p>
                </div>
            </button>

            <!-- 2. Logout Action Card -->
            <asp:LinkButton ID="btnLogoutCard" runat="server" OnClick="btnLogout_Click" CssClass="profile-card-link" CausesValidation="false">
                <div class="profile-badge-icon badge-red">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                        <polyline points="16 17 21 12 16 7"></polyline>
                        <line x1="21" y1="12" x2="9" y2="12"></line>
                    </svg>
                </div>
                <div class="profile-card-content">
                    <h3 class="profile-card-title red-text">Logout</h3>
                    <p class="profile-card-desc">Sign out of your EstateX account.</p>
                </div>
            </asp:LinkButton>
        </div>
    </div>

    <%-- Edit Profile Modal Popup --%>
    <div id="profileModal" class="modal-overlay">
        <div class="modal-card">
            <div class="modal-header">
                <h3 class="modal-title">Edit Profile</h3>
                <button type="button" class="modal-close-btn" onclick="closeProfileModal();">&times;</button>
            </div>

            <!-- 1. Full Name -->
            <div class="modal-form-group">
                <label class="modal-label">Full Name <span style="color:#dc2626;">*</span></label>
                <asp:TextBox ID="txtEditName" runat="server" CssClass="modal-input" MaxLength="50" />
                <asp:RequiredFieldValidator ID="rfvEditName" runat="server"
                    ControlToValidate="txtEditName"
                    ErrorMessage="Full Name is required."
                    ValidationGroup="vgProfile"
                    EnableClientScript="false"
                    CssClass="val-error-text"
                    Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revEditName" runat="server"
                    ControlToValidate="txtEditName"
                    ValidationExpression="^[a-zA-Z\s]{3,50}$"
                    ErrorMessage="Full Name must have at least 3 letters (alphabets only)."
                    ValidationGroup="vgProfile"
                    EnableClientScript="false"
                    CssClass="val-error-text"
                    Display="Dynamic" />
            </div>

            <!-- 2. Phone Number -->
            <div class="modal-form-group">
                <label class="modal-label">Phone Number <span style="color:#dc2626;">*</span></label>
                <asp:TextBox ID="txtEditPhone" runat="server" CssClass="modal-input" MaxLength="15" Placeholder="+91 9876543210" />
                <asp:RequiredFieldValidator ID="rfvEditPhone" runat="server"
                    ControlToValidate="txtEditPhone"
                    ErrorMessage="Phone Number is required."
                    ValidationGroup="vgProfile"
                    EnableClientScript="false"
                    CssClass="val-error-text"
                    Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revEditPhone" runat="server"
                    ControlToValidate="txtEditPhone"
                    ValidationExpression="^(\+91[\-\s]?)?[6-9]\d{9}$"
                    ErrorMessage="Enter a valid 10-digit Indian phone number."
                    ValidationGroup="vgProfile"
                    EnableClientScript="false"
                    CssClass="val-error-text"
                    Display="Dynamic" />
            </div>

            <!-- 3. Address -->
            <div class="modal-form-group">
                <label class="modal-label">Address <span style="color:#dc2626;">*</span></label>
                <asp:TextBox ID="txtEditAddress" runat="server" TextMode="MultiLine" CssClass="modal-input" MaxLength="200" />
                <asp:RequiredFieldValidator ID="rfvEditAddress" runat="server"
                    ControlToValidate="txtEditAddress"
                    ErrorMessage="Address is required."
                    ValidationGroup="vgProfile"
                    EnableClientScript="false"
                    CssClass="val-error-text"
                    Display="Dynamic" />
            </div>

            <!-- Modal Actions -->
            <div class="modal-actions">
                <button type="button" class="btn-modal-cancel" onclick="closeProfileModal();">Cancel</button>
                <asp:Button ID="btnUpdateProfile" runat="server" Text="Update"
                    ValidationGroup="vgProfile"
                    CausesValidation="true"
                    CssClass="btn-modal-update"
                    OnClick="btnUpdateProfile_Click" />
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function openProfileModal() {
            var modal = document.getElementById("profileModal");
            if (modal) {
                modal.classList.add("active");
            }
        }

        function closeProfileModal() {
            var modal = document.getElementById("profileModal");
            if (modal) {
                modal.classList.remove("active");
            }
        }

        window.onclick = function (event) {
            var modal = document.getElementById("profileModal");
            if (event.target === modal) {
                closeProfileModal();
            }
        };
    </script>
</asp:Content>
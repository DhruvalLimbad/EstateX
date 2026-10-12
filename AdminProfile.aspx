<%@ Page Title="Admin Profile" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="AdminProfile.aspx.cs" Inherits="EstateX.AdminProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
    <style>
        .profile-container {
            max-width: 1180px;
            margin: 20px auto 60px auto;
            padding: 0 16px;
        }

        .profile-page-heading {
            font-size: 22px;
            font-weight: 800;
            color: #111827;
            margin: 0 0 24px 0;
        }

        /* Layout Grid */
        .profile-grid {
            display: grid;
            grid-template-columns: 280px 1fr;
            gap: 24px;
            align-items: start;
        }

        @media (max-width: 860px) {
            .profile-grid {
                grid-template-columns: 1fr;
            }
        }

        /* Cards */
        .profile-card {
            background: #ffffff;
            border: 1px solid #f3f4f6;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.03);
            margin-bottom: 24px;
        }

        /* Left Avatar Card */
        .avatar-box {
            text-align: center;
        }

        .avatar-img-wrap {
            width: 110px;
            height: 110px;
            margin: 0 auto 16px auto;
            border-radius: 12px;
            overflow: hidden;
            border: 1px solid #e5e7eb;
            background: #f9fafb;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .avatar-img-wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .admin-name {
            font-size: 17px;
            font-weight: 800;
            color: #111827;
            margin: 0 0 4px 0;
        }

        .admin-role-badge {
            font-size: 13px;
            color: #6b7280;
            margin: 0 0 20px 0;
        }

        .btn-change-photo {
            width: 100%;
            height: 38px;
            border: 1px solid #e5e7eb;
            background: #ffffff;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            color: #374151;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            transition: all 0.15s ease;
        }

        .btn-change-photo:hover {
            background-color: #f9fafb;
            border-color: #d1d5db;
        }

        /* Forms */
        .card-heading {
            font-size: 16px;
            font-weight: 700;
            color: #111827;
            margin: 0 0 20px 0;
        }

        .form-row-2col {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px;
            margin-bottom: 16px;
        }

        @media (max-width: 600px) {
            .form-row-2col {
                grid-template-columns: 1fr;
            }
        }

        .form-field {
            display: flex;
            flex-direction: column;
            gap: 6px;
            margin-bottom: 16px;
        }

        .form-field label {
            font-size: 12.5px;
            font-weight: 600;
            color: #374151;
        }

        .profile-input {
            width: 100%;
            height: 40px;
            padding: 8px 12px;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            font-size: 13.5px;
            color: #1f2937;
            box-sizing: border-box;
            outline: none;
            background-color: #ffffff;
        }

        .profile-input:focus {
            border-color: #2563eb;
        }

        .profile-input[readonly] {
            background-color: #f9fafb;
            color: #6b7280;
            cursor: not-allowed;
        }

        .val-error {
            color: #dc2626;
            font-size: 11.5px;
            font-weight: 500;
            margin-top: 2px;
            display: block;
        }

        .form-actions {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-top: 6px;
        }

        .password-bottom-bar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 6px;
        }

        .btn-primary-blue {
            background-color: #2563eb;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            height: 38px;
            padding: 0 20px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.15s ease;
        }

        .btn-primary-blue:hover {
            background-color: #1d4ed8;
        }

        .btn-cancel-flat {
            background-color: #ffffff;
            color: #374151;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            height: 38px;
            padding: 0 18px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.15s ease;
        }

        .btn-cancel-flat:hover {
            background-color: #f9fafb;
        }

        .btn-logout-outline {
            background: #ffffff;
            color: #374151;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            height: 38px;
            padding: 0 16px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: all 0.15s ease;
            text-decoration: none;
        }

        .btn-logout-outline:hover {
            background-color: #fef2f2;
            color: #dc2626;
            border-color: #fca5a5;
        }

        .alert-box {
            padding: 12px 16px;
            border-radius: 8px;
            font-size: 13px;
            margin-bottom: 20px;
        }

        .alert-box-success {
            background-color: #ecfdf5;
            color: #065f46;
            border: 1px solid #a7f3d0;
        }

        .alert-box-error {
            background-color: #fef2f2;
            color: #991b1b;
            border: 1px solid #fecaca;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminMainContent" runat="server">
    <div class="profile-container">
        <h1 class="profile-page-heading">Admin Profile</h1>

        <!-- Feedback Alert -->
        <asp:Panel ID="pnlAlert" runat="server" Visible="false" CssClass="alert-box">
            <asp:Literal ID="litAlertMsg" runat="server" />
        </asp:Panel>

        <div class="profile-grid">
            <!-- Left Card: Avatar & Summary -->
            <div class="profile-card avatar-box">
                <div class="avatar-img-wrap">
                    <asp:Image ID="imgAdminAvatar" runat="server" ImageUrl="~/Images/admin-avatar.jpg" AlternateText="Bhargav Admin" />
                </div>
                <h3 class="admin-name"><asp:Literal ID="litCardName" runat="server">Bhargav Admin</asp:Literal></h3>
                <p class="admin-role-badge"><asp:Literal ID="litCardRole" runat="server">Super Administrator</asp:Literal></p>

                <!-- Hidden file upload triggered by button -->
                <asp:FileUpload ID="fuAdminPhoto" runat="server" style="display:none;" onchange="__doPostBack('<%= btnUploadPhotoHidden.UniqueID %>', '');" />
                <button type="button" class="btn-change-photo" onclick="document.getElementById('<%= fuAdminPhoto.ClientID %>').click();">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                        <polyline points="17 8 12 3 7 8"></polyline>
                        <line x1="12" y1="3" x2="12" y2="15"></line>
                    </svg>
                    Change Photo
                </button>
                <asp:Button ID="btnUploadPhotoHidden" runat="server" style="display:none;" OnClick="btnUploadPhotoHidden_Click" CausesValidation="false" />
            </div>

            <!-- Right Column: Profile Info & Change Password -->
            <div>
                <!-- 1. Profile Information Card -->
                <div class="profile-card">
                    <h2 class="card-heading">Profile Information</h2>

                    <div class="form-row-2col">
                        <!-- Full Name with RequiredFieldValidator & Regex -->
                        <div class="form-field" style="margin-bottom:0;">
                            <label>Full Name <span style="color:#dc2626;">*</span></label>
                            <asp:TextBox ID="txtFullName" runat="server" CssClass="profile-input" MaxLength="60" />
                            <asp:RequiredFieldValidator ID="rfvFullName" runat="server"
                                ControlToValidate="txtFullName"
                                ErrorMessage="Full Name is required."
                                ValidationGroup="vgProfile"
                                Display="Dynamic"
                                CssClass="val-error" />
                            <asp:RegularExpressionValidator ID="revFullName" runat="server"
                                ControlToValidate="txtFullName"
                                ValidationExpression="^[a-zA-Z\s]{2,60}$"
                                ErrorMessage="Full Name can only contain letters."
                                ValidationGroup="vgProfile"
                                Display="Dynamic"
                                CssClass="val-error" />
                        </div>

                        <!-- Email Address with RequiredFieldValidator & Regex -->
                        <div class="form-field" style="margin-bottom:0;">
                            <label>Email Address <span style="color:#dc2626;">*</span></label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="profile-input" MaxLength="80" />
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                                ControlToValidate="txtEmail"
                                ErrorMessage="Email Address is required."
                                ValidationGroup="vgProfile"
                                Display="Dynamic"
                                CssClass="val-error" />
                            <asp:RegularExpressionValidator ID="revEmail" runat="server"
                                ControlToValidate="txtEmail"
                                ValidationExpression="^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$"
                                ErrorMessage="Enter a valid email address."
                                ValidationGroup="vgProfile"
                                Display="Dynamic"
                                CssClass="val-error" />
                        </div>
                    </div>

                    <div class="form-row-2col">
                        <!-- Phone Number with RequiredFieldValidator & Regex -->
                        <div class="form-field" style="margin-bottom:0;">
                            <label>Phone Number <span style="color:#dc2626;">*</span></label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="profile-input" MaxLength="15" />
                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server"
                                ControlToValidate="txtPhone"
                                ErrorMessage="Phone Number is required."
                                ValidationGroup="vgProfile"
                                Display="Dynamic"
                                CssClass="val-error" />
                            <asp:RegularExpressionValidator ID="revPhone" runat="server"
                                ControlToValidate="txtPhone"
                                ValidationExpression="^(\+91[\-\s]?)?[6-9]\d{9}$"
                                ErrorMessage="Enter a valid phone number (+91 9106536420 or 10 digits)."
                                ValidationGroup="vgProfile"
                                Display="Dynamic"
                                CssClass="val-error" />
                        </div>

                        <!-- Role (Read-only) -->
                        <div class="form-field" style="margin-bottom:0;">
                            <label>Role</label>
                            <asp:TextBox ID="txtRole" runat="server" CssClass="profile-input" ReadOnly="true" Text="Super Administrator" />
                        </div>
                    </div>

                    <div class="form-actions">
                        <asp:Button ID="btnUpdateProfile" runat="server" Text="Update Profile"
                            CssClass="btn-primary-blue"
                            ValidationGroup="vgProfile"
                            CausesValidation="true"
                            OnClick="btnUpdateProfile_Click" />

                        <asp:Button ID="btnCancelProfile" runat="server" Text="Cancel"
                            CssClass="btn-cancel-flat"
                            CausesValidation="false"
                            OnClick="btnCancelProfile_Click" />
                    </div>
                </div>

                <!-- 2. Change Password Card -->
                <div class="profile-card">
                    <h2 class="card-heading">Change Password</h2>

                    <!-- Current Password -->
                    <div class="form-field">
                        <label>Current Password <span style="color:#dc2626;">*</span></label>
                        <asp:TextBox ID="txtCurrentPassword" runat="server" TextMode="Password" CssClass="profile-input" Placeholder="Enter current password" />
                        <asp:RequiredFieldValidator ID="rfvCurrentPassword" runat="server"
                            ControlToValidate="txtCurrentPassword"
                            ErrorMessage="Current password is required."
                            ValidationGroup="vgPassword"
                            Display="Dynamic"
                            CssClass="val-error" />
                    </div>

                    <div class="form-row-2col">
                        <!-- New Password with RequiredFieldValidator & Length Regex -->
                        <div class="form-field" style="margin-bottom:0;">
                            <label>New Password <span style="color:#dc2626;">*</span></label>
                            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="profile-input" Placeholder="Enter new password" />
                            <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server"
                                ControlToValidate="txtNewPassword"
                                ErrorMessage="New password is required."
                                ValidationGroup="vgPassword"
                                Display="Dynamic"
                                CssClass="val-error" />
                            <asp:RegularExpressionValidator ID="revNewPassword" runat="server"
                                ControlToValidate="txtNewPassword"
                                ValidationExpression="^.{6,30}$"
                                ErrorMessage="Password must be at least 6 characters."
                                ValidationGroup="vgPassword"
                                Display="Dynamic"
                                CssClass="val-error" />
                        </div>

                        <!-- Confirm New Password with CompareValidator -->
                        <div class="form-field" style="margin-bottom:0;">
                            <label>Confirm New Password <span style="color:#dc2626;">*</span></label>
                            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="profile-input" Placeholder="Re-enter new password" />
                            <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server"
                                ControlToValidate="txtConfirmPassword"
                                ErrorMessage="Please confirm your new password."
                                ValidationGroup="vgPassword"
                                Display="Dynamic"
                                CssClass="val-error" />
                            <asp:CompareValidator ID="cvPasswordMatch" runat="server"
                                ControlToValidate="txtConfirmPassword"
                                ControlToCompare="txtNewPassword"
                                ErrorMessage="Passwords do not match."
                                ValidationGroup="vgPassword"
                                Display="Dynamic"
                                CssClass="val-error" />
                        </div>
                    </div>

                    <div class="password-bottom-bar">
                        <asp:Button ID="btnUpdatePassword" runat="server" Text="Update Password"
                            CssClass="btn-primary-blue"
                            ValidationGroup="vgPassword"
                            CausesValidation="true"
                            OnClick="btnUpdatePassword_Click" />

                        <!-- Bottom-right Logout button -->
                        <asp:LinkButton ID="btnLogoutProfile" runat="server" CssClass="btn-logout-outline" CausesValidation="false" OnClick="btnLogoutProfile_Click">
                            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                                <polyline points="16 17 21 12 16 7"></polyline>
                                <line x1="21" y1="12" x2="9" y2="12"></line>
                            </svg>
                            Logout
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
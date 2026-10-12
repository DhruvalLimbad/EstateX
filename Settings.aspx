<%@ Page Title="Settings" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Settings.aspx.cs" Inherits="EstateX.Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
    <style>
        .settings-page-wrapper {
            max-width: 1180px;
            margin: 20px auto 60px auto;
            padding: 0 16px;
        }

        .settings-heading {
            font-size: 22px;
            font-weight: 800;
            color: #111827;
            margin: 0 0 24px 0;
        }

        /* Settings Card Container */
        .settings-box-card {
            background: #ffffff;
            border: 1px solid #f3f4f6;
            border-radius: 12px;
            padding: 28px;
            max-width: 650px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.03);
        }

        .card-subheading {
            font-size: 15px;
            font-weight: 700;
            color: #111827;
            margin: 0 0 22px 0;
        }

        .field-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
            margin-bottom: 18px;
        }

        .field-group label {
            font-size: 12.5px;
            font-weight: 600;
            color: #374151;
        }

        .input-box {
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
            transition: border-color 0.15s ease;
        }

        .input-box:focus {
            border-color: #2563eb;
        }

        /* Two columns row for Email & Contact */
        .field-row-split {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
            margin-bottom: 22px;
        }

        @media (max-width: 600px) {
            .field-row-split {
                grid-template-columns: 1fr;
            }
        }

        .val-error {
            color: #dc2626;
            font-size: 11.5px;
            font-weight: 500;
            margin-top: 2px;
            display: block;
        }

        .btn-save-settings {
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

        .btn-save-settings:hover {
            background-color: #1d4ed8;
        }

        .alert-box {
            padding: 12px 16px;
            border-radius: 8px;
            font-size: 13px;
            margin-bottom: 18px;
            max-width: 650px;
            background-color: #ecfdf5;
            color: #065f46;
            border: 1px solid #a7f3d0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminMainContent" runat="server">
    <div class="settings-page-wrapper">
        <h1 class="settings-heading">Settings</h1>

        <asp:Panel ID="pnlAlert" runat="server" Visible="false" CssClass="alert-box">
            <asp:Literal ID="litAlertMsg" runat="server" />
        </asp:Panel>

        <!-- General Settings Card -->
        <div class="settings-box-card">
            <h2 class="card-subheading">General Settings</h2>

            <!-- Application Name (Full width) -->
            <div class="field-group">
                <label>Application Name <span style="color:#dc2626;">*</span></label>
                <asp:TextBox ID="txtAppName" runat="server" CssClass="input-box" MaxLength="60" />
                <asp:RequiredFieldValidator ID="rfvAppName" runat="server"
                    ControlToValidate="txtAppName"
                    ErrorMessage="Application Name is required."
                    ValidationGroup="vgSettings"
                    Display="Dynamic"
                    CssClass="val-error" />
            </div>

            <!-- Two-Column Row: Support Email & Contact Number -->
            <div class="field-row-split">
                <!-- Support Email -->
                <div class="field-group" style="margin-bottom: 0;">
                    <label>Support Email <span style="color:#dc2626;">*</span></label>
                    <asp:TextBox ID="txtSupportEmail" runat="server" CssClass="input-box" MaxLength="80" />
                    <asp:RequiredFieldValidator ID="rfvSupportEmail" runat="server"
                        ControlToValidate="txtSupportEmail"
                        ErrorMessage="Support Email is required."
                        ValidationGroup="vgSettings"
                        Display="Dynamic"
                        CssClass="val-error" />
                    <asp:RegularExpressionValidator ID="revSupportEmail" runat="server"
                        ControlToValidate="txtSupportEmail"
                        ValidationExpression="^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$"
                        ErrorMessage="Enter a valid email address."
                        ValidationGroup="vgSettings"
                        Display="Dynamic"
                        CssClass="val-error" />
                </div>

                <!-- Contact Number -->
                <div class="field-group" style="margin-bottom: 0;">
                    <label>Contact Number <span style="color:#dc2626;">*</span></label>
                    <asp:TextBox ID="txtContactNumber" runat="server" CssClass="input-box" MaxLength="16" />
                    <asp:RequiredFieldValidator ID="rfvContactNumber" runat="server"
                        ControlToValidate="txtContactNumber"
                        ErrorMessage="Contact Number is required."
                        ValidationGroup="vgSettings"
                        Display="Dynamic"
                        CssClass="val-error" />
                    <asp:RegularExpressionValidator ID="revContactNumber" runat="server"
                        ControlToValidate="txtContactNumber"
                        ValidationExpression="^(\+91[\-\s]?)?[6-9]\d{9}$"
                        ErrorMessage="Enter a valid phone number (+91 9106536420 or 10 digits)."
                        ValidationGroup="vgSettings"
                        Display="Dynamic"
                        CssClass="val-error" />
                </div>
            </div>

            <!-- Save Settings Button -->
            <div>
                <asp:Button ID="btnSaveSettings" runat="server" Text="Save Settings"
                    CssClass="btn-save-settings"
                    ValidationGroup="vgSettings"
                    CausesValidation="true"
                    OnClick="btnSaveSettings_Click" />
            </div>
        </div>
    </div>
</asp:Content>
<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="EstateX.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .split-auth-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            min-height: calc(100vh - 140px);
            background: #ffffff;
            margin: -20px -20px 0 -20px;
        }

        @media (max-width: 900px) {
            .split-auth-container {
                grid-template-columns: 1fr;
            }
            .auth-banner-side {
                display: none;
            }
        }

        .auth-banner-side {
            position: relative;
            background: url('https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=1200&auto=format&fit=crop&q=80') center/cover no-repeat;
            display: flex;
            align-items: flex-end;
            padding: 48px;
            box-sizing: border-box;
            min-height: 550px;
        }

        .auth-banner-overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(180deg, rgba(0,0,0,0.1) 40%, rgba(0,0,0,0.75) 100%);
        }

        .auth-banner-content {
            position: relative;
            z-index: 2;
            color: #ffffff;
        }

        .auth-banner-logo {
            font-size: 26px;
            font-weight: 800;
            margin-bottom: 6px;
            letter-spacing: -0.5px;
        }

        .auth-banner-tagline {
            font-size: 13.5px;
            color: rgba(255, 255, 255, 0.85);
            margin: 0;
        }

        .auth-form-side {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 30px;
            background-color: #ffffff;
        }

        .auth-form-inner {
            width: 100%;
            max-width: 380px;
        }

        .brand-header-title {
            font-size: 20px;
            font-weight: 800;
            color: #0052cc;
            margin-bottom: 4px;
        }

        .brand-header-sub {
            font-size: 12.5px;
            color: #4b5563;
            margin-bottom: 24px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 5px;
            margin-bottom: 14px;
        }

        .form-label {
            font-size: 11.5px;
            font-weight: 600;
            color: #374151;
        }

        .form-input {
            width: 100%;
            height: 38px;
            padding: 6px 12px;
            border: 1px solid #d1d5db;
            border-radius: 4px;
            font-size: 13px;
            outline: none;
            box-sizing: border-box;
            background: #ffffff;
            color: #1f2937;
        }

        .form-input:focus {
            border-color: #0052cc;
        }

        .validation-error {
            color: #dc2626;
            font-size: 11px;
            font-weight: 500;
            display: block;
            margin-top: 2px;
        }

        .btn-register-submit {
            width: 100%;
            height: 40px;
            background-color: #0052cc;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            font-size: 13.5px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 14px;
            transition: background-color 0.2s ease;
        }

        .btn-register-submit:hover {
            background-color: #0043a8;
        }

        .auth-switch-link {
            margin-top: 24px;
            font-size: 12px;
            color: #4b5563;
        }

        .auth-switch-link a {
            color: #0052cc;
            text-decoration: none;
            font-weight: 600;
        }

        .auth-switch-link a:hover {
            text-decoration: underline;
        }

        .success-banner {
            background-color: #ecfdf5;
            color: #065f46;
            border: 1px solid #a7f3d0;
            border-radius: 4px;
            padding: 10px 12px;
            font-size: 12px;
            margin-bottom: 16px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="split-auth-container">
        <!-- Left Banner -->
        <div class="auth-banner-side">
            <div class="auth-banner-overlay"></div>
            <div class="auth-banner-content">
                <div class="auth-banner-logo">EstateX</div>
                <p class="auth-banner-tagline">Your journey to the perfect home starts here.</p>
            </div>
        </div>

        <!-- Right Form -->
        <div class="auth-form-side">
            <div class="auth-form-inner">
                <div class="brand-header-title">EstateX</div>
                <div class="brand-header-sub">Create Your Account</div>

                <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="success-banner">
                    ✓ Account registered successfully! You can now log in.
                </asp:Panel>

                <!-- Full Name (Letters and spaces only) -->
                <div class="form-group">
                    <label class="form-label" for="txtFullName">Full Name</label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-input" Placeholder="Hiren Makvana" />
                    <asp:RequiredFieldValidator ID="rfvFullName" runat="server" 
                        ControlToValidate="txtFullName" 
                        ErrorMessage="Full Name is required." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        EnableClientScript="false" />
                    <asp:RegularExpressionValidator ID="revFullName" runat="server" 
                        ControlToValidate="txtFullName" 
                        ErrorMessage="Name can only contain letters and spaces (no digits or symbols)." 
                        ValidationExpression="^[a-zA-Z\s]+$" 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        EnableClientScript="false" />
                </div>

                <!-- Email Address -->
                <div class="form-group">
                    <label class="form-label" for="txtEmail">Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" Placeholder="hiren@example.com" />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                        ControlToValidate="txtEmail" 
                        ErrorMessage="Email address is required." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        EnableClientScript="false" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                        ControlToValidate="txtEmail" 
                        ErrorMessage="Enter a valid email address." 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        EnableClientScript="false" />
                </div>

                <!-- Phone Number -->
                <div class="form-group">
                    <label class="form-label" for="txtPhone">Phone Number</label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-input" Placeholder="+91 9106536420" />
                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                        ControlToValidate="txtPhone" 
                        ErrorMessage="Phone number is required." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        EnableClientScript="false" />
                    <asp:RegularExpressionValidator ID="revPhone" runat="server" 
                        ControlToValidate="txtPhone" 
                        ErrorMessage="Enter a valid 10-digit mobile number." 
                        ValidationExpression="^(\+91[\-\s]?)?[0-9]{10}$" 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        EnableClientScript="false" />
                </div>

                <!-- Password (At least 8 chars, 1 digit, 1 special symbol) -->
                <div class="form-group">
                    <label class="form-label" for="txtPassword">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-input" Placeholder="••••••••" />
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                        ControlToValidate="txtPassword" 
                        ErrorMessage="Password is required." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        EnableClientScript="false" />
                    <asp:RegularExpressionValidator ID="revPassword" runat="server" 
                        ControlToValidate="txtPassword" 
                        ErrorMessage="Password must be at least 8 characters and contain at least 1 digit and 1 special symbol." 
                        ValidationExpression="^(?=.*[0-9])(?=.*[!@#$%^&*()_+\-=\[\]{};':&quot;\\|,.<>\/?]).{8,}$" 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        EnableClientScript="false" />
                </div>

                <!-- Confirm Password -->
                <div class="form-group">
                    <label class="form-label" for="txtConfirmPassword">Confirm Password</label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-input" Placeholder="••••••••" />
                    <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" 
                        ControlToValidate="txtConfirmPassword" 
                        ErrorMessage="Please confirm your password." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        EnableClientScript="false" />
                    <asp:CompareValidator ID="cvConfirmPassword" runat="server" 
                        ControlToValidate="txtConfirmPassword" 
                        ControlToCompare="txtPassword" 
                        ErrorMessage="Passwords do not match." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        EnableClientScript="false" />
                </div>

                <!-- Submit Button -->
                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-register-submit" OnClick="btnRegister_Click" />

                <!-- Login Redirect Link -->
                <div class="auth-switch-link">
                    Already have an account? <a href="Login.aspx">Login</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
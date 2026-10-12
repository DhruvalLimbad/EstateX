<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="EstateX.Login" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .split-login-container {
            display: grid;
            grid-template-columns: 1.1fr 1fr;
            min-height: calc(100vh - 140px);
            background: #ffffff;
            margin: -20px -20px 0 -20px;
        }

        @media (max-width: 900px) {
            .split-login-container {
                grid-template-columns: 1fr;
            }
            .login-banner-side {
                display: none;
            }
        }

        .login-banner-side {
            position: relative;
            background: url('https://images.unsplash.com/photo-1580587771525-78b9dba3b914?w=1200&auto=format&fit=crop&q=80') center/cover no-repeat;
            display: flex;
            align-items: flex-end;
            padding: 50px;
            box-sizing: border-box;
            min-height: 560px;
        }

        .login-banner-overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(180deg, rgba(0,0,0,0.1) 40%, rgba(0,0,0,0.85) 100%);
        }

        .login-banner-content {
            position: relative;
            z-index: 2;
            color: #ffffff;
        }

        .login-banner-title {
            font-size: 30px;
            font-weight: 800;
            margin-bottom: 8px;
            letter-spacing: -0.5px;
        }

        .login-banner-desc {
            font-size: 13.5px;
            color: rgba(255, 255, 255, 0.85);
            margin: 0;
            line-height: 1.5;
        }

        .login-form-side {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 30px;
            background-color: #ffffff;
        }

        .login-form-inner {
            width: 100%;
            max-width: 380px;
        }

        .brand-pill {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            font-size: 18px;
            font-weight: 800;
            color: #0052cc;
            margin-bottom: 18px;
        }

        .welcome-title {
            font-size: 26px;
            font-weight: 800;
            color: #111827;
            margin-bottom: 6px;
        }

        .welcome-sub {
            font-size: 13px;
            color: #6b7280;
            margin-bottom: 24px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
            margin-bottom: 16px;
        }

        .form-label-row {
            display: flex;
            justify-content: space-between;
            align-items: baseline;
        }

        .form-label {
            font-size: 12px;
            font-weight: 600;
            color: #374151;
        }

        .forgot-link {
            font-size: 11.5px;
            color: #0052cc;
            text-decoration: none;
            font-weight: 600;
        }

        .forgot-link:hover {
            text-decoration: underline;
        }

        .form-input {
            width: 100%;
            height: 40px;
            padding: 8px 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 13.5px;
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
            font-size: 11.5px;
            font-weight: 500;
            display: block;
            margin-top: 2px;
        }

        .btn-login-submit {
            width: 100%;
            height: 42px;
            background-color: #1d63ed;
            color: #ffffff;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.2s ease;
        }

        .btn-login-submit:hover {
            background-color: #154fc1;
        }

        .auth-switch-text {
            text-align: center;
            margin-top: 20px;
            font-size: 12.5px;
            color: #6b7280;
        }

        .auth-switch-text a {
            color: #0052cc;
            text-decoration: none;
            font-weight: 600;
        }

        .divider-line {
            height: 1px;
            background-color: #e5e7eb;
            margin: 32px 0 20px 0;
        }

        .trust-box {
            text-align: center;
        }

        .trust-title {
            font-size: 12.5px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 4px;
        }

        .trust-sub {
            font-size: 11.5px;
            color: #6b7280;
            margin: 0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="split-login-container">
        <!-- Left Banner -->
        <div class="login-banner-side">
            <div class="login-banner-overlay"></div>
            <div class="login-banner-content">
                <h2 class="login-banner-title">Discover Your Sanctuary</h2>
                <p class="login-banner-desc">Access exclusive listings and manage your portfolio with EstateX.</p>
            </div>
        </div>

        <!-- Right Form Panel -->
        <div class="login-form-side">
            <div class="login-form-inner">
                <div class="brand-pill">
                    <span>🏢</span> EstateX
                </div>
                <h1 class="welcome-title">Welcome Back</h1>
                <p class="welcome-sub">Please enter your details to sign in.</p>

                <!-- Email Input -->
                <div class="form-group">
                    <label class="form-label" for="txtEmail">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" Placeholder="Enter your email" />
                    
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                        ControlToValidate="txtEmail" 
                        ErrorMessage="Email is required." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        EnableClientScript="false" />

                    <!-- Server Custom Validator to allow admin@123 or valid standard email format -->
                    <asp:CustomValidator ID="cvEmail" runat="server" 
                        ControlToValidate="txtEmail"
                        OnServerValidate="cvEmail_ServerValidate"
                        ErrorMessage="Please enter a valid email address." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        EnableClientScript="false" />
                </div>

                <!-- Password Input -->
                <div class="form-group">
                    <div class="form-label-row">
                        <label class="form-label" for="txtPassword">Password</label>
                        <a href="#" class="forgot-link">Forgot Password?</a>
                    </div>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-input" Placeholder="••••••••" />
                    
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                        ControlToValidate="txtPassword" 
                        ErrorMessage="Password is required." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        EnableClientScript="false" />

                    <!-- Server Custom Validator for password complexity -->
                    <asp:CustomValidator ID="cvPassword" runat="server" 
                        ControlToValidate="txtPassword"
                        OnServerValidate="cvPassword_ServerValidate"
                        ErrorMessage="Password must be at least 8 characters and contain at least 1 number and 1 special symbol." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        EnableClientScript="false" />
                </div>

                <!-- Login Button -->
                <asp:Button ID="btnLogin" runat="server" Text="Login →" CssClass="btn-login-submit" OnClick="btnLogin_Click" />

                <!-- Bottom Switch & Trust Message -->
                <div class="auth-switch-text">
                    Don't have an account? <a href="Register.aspx">Register</a>
                </div>

                <div class="divider-line"></div>

                <div class="trust-box">
                    <div class="trust-title">Secure and simple property access</div>
                    <p class="trust-sub">Manage your property searches and visits from one place.</p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
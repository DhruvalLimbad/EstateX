<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="EstateX.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .contact-container {
            max-width: 1050px;
            margin: 0 auto 60px auto;
            padding: 20px;
        }

        .contact-header {
            margin-bottom: 32px;
        }
        .contact-title {
            font-size: 28px;
            font-weight: 800;
            color: #111827;
            margin-bottom: 8px;
        }
        .contact-subtitle {
            font-size: 14px;
            color: #4b5563;
            max-width: 600px;
            line-height: 1.5;
        }

        /* 2-Column Grid */
        .contact-layout {
            display: grid;
            grid-template-columns: 1fr 1.6fr;
            gap: 32px;
            align-items: start;
        }

        @media (max-width: 820px) {
            .contact-layout {
                grid-template-columns: 1fr;
            }
        }

        /* Left Info Cards */
        .info-cards-stack {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .contact-info-card {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            padding: 20px 22px;
            display: flex;
            align-items: flex-start;
            gap: 16px;
        }

        .info-card-icon {
            font-size: 18px;
            color: #0052cc;
            line-height: 1;
            margin-top: 3px;
        }

        .info-card-content {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .info-card-label {
            font-size: 15px;
            font-weight: 700;
            color: #111827;
        }

        .info-card-desc {
            font-size: 12.5px;
            color: #6b7280;
            margin-bottom: 4px;
        }

        .info-card-value {
            font-size: 13.5px;
            font-weight: 600;
            color: #0052cc;
            text-decoration: none;
        }

        .info-card-value:hover {
            text-decoration: underline;
        }

        .info-card-address {
            font-size: 13px;
            line-height: 1.45;
            color: #374151;
        }

        /* Right Form */
        .contact-form-panel {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            padding: 28px;
        }

        .form-row-duo {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
            margin-bottom: 16px;
        }

        @media (max-width: 550px) {
            .form-row-duo {
                grid-template-columns: 1fr;
            }
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
            margin-bottom: 16px;
        }

        .form-label {
            font-size: 12px;
            font-weight: 600;
            color: #374151;
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

        .form-textarea {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 13.5px;
            outline: none;
            box-sizing: border-box;
            background: #ffffff;
            color: #1f2937;
            resize: vertical;
            min-height: 130px;
            font-family: inherit;
        }

        .form-textarea:focus {
            border-color: #0052cc;
        }

        .validation-error {
            color: #dc2626;
            font-size: 11.5px;
            font-weight: 500;
        }

        .form-actions {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;
        }

        .btn-send {
            background-color: #0052cc;
            color: #ffffff;
            border: none;
            padding: 10px 24px;
            border-radius: 6px;
            font-size: 13.5px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        .btn-send:hover {
            background-color: #0043a8;
        }

        .success-banner {
            background-color: #ecfdf5;
            color: #065f46;
            border: 1px solid #a7f3d0;
            border-radius: 6px;
            padding: 12px;
            font-size: 13px;
            margin-bottom: 16px;
            display: block;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="contact-container">
        <!-- Page Title & Subtitle -->
        <div class="contact-header">
            <h1 class="contact-title">Get in Touch</h1>
            <p class="contact-subtitle">
                We're here to help with your real estate needs. Reach out to our team of experts for personalized assistance.
            </p>
        </div>

        <div class="contact-layout">
            <!-- Left Contact Info Cards -->
            <div class="info-cards-stack">
                <!-- Email Card -->
                <div class="contact-info-card">
                    <span class="info-card-icon">✉</span>
                    <div class="info-card-content">
                        <span class="info-card-label">Email Us</span>
                        <span class="info-card-desc">For general inquiries and support.</span>
                        <a href="mailto:hmakavana538@gmail.com" class="info-card-value">hmakavana538@gmail.com</a>
                    </div>
                </div>

                <!-- Call Card -->
                <div class="contact-info-card">
                    <span class="info-card-icon">📞</span>
                    <div class="info-card-content">
                        <span class="info-card-label">Call Us</span>
                        <span class="info-card-desc">Mon-Fri from 9am to 6pm.</span>
                        <a href="tel:+919328364535" class="info-card-value">+91 9328364535</a>
                    </div>
                </div>

                <!-- Office Address Card -->
                <div class="contact-info-card">
                    <span class="info-card-icon">📍</span>
                    <div class="info-card-content">
                        <span class="info-card-label">Office</span>
                        <span class="info-card-desc">Visit our headquarters.</span>
                        <div class="info-card-address">
                            Hiren Makvana<br />
                            <br />
                            <br />
                            
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Contact Form -->
            <div class="contact-form-panel">
                <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="success-banner">
                    ✓ Thank you! Your message has been sent successfully. We will contact you shortly.
                </asp:Panel>

                <!-- Full Name and Email Address Duo -->
                <div class="form-row-duo">
                    <div class="form-group" style="margin-bottom: 0;">
                        <label class="form-label" for="txtName">Full Name</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-input" Placeholder="Hiren makvana" />
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                            ControlToValidate="txtName" 
                            ErrorMessage="Please enter your full name." 
                            CssClass="validation-error" 
                            Display="Dynamic" 
                            EnableClientScript="false" />
                    </div>

                    <div class="form-group" style="margin-bottom: 0;">
                        <label class="form-label" for="txtEmail">Email Address</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" Placeholder="hmakavana538@gmail.com" />
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                            ControlToValidate="txtEmail" 
                            ErrorMessage="Please enter your email." 
                            CssClass="validation-error" 
                            Display="Dynamic" 
                            EnableClientScript="false" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                            ControlToValidate="txtEmail" 
                            ErrorMessage="Please enter a valid email address." 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            CssClass="validation-error" 
                            Display="Dynamic" 
                            EnableClientScript="false" />
                    </div>
                </div>

                <!-- Subject -->
                <div class="form-group">
                    <label class="form-label" for="txtSubject">Subject</label>
                    <asp:TextBox ID="txtSubject" runat="server" CssClass="form-input" Placeholder="How can we help you?" />
                    <asp:RequiredFieldValidator ID="rfvSubject" runat="server" 
                        ControlToValidate="txtSubject" 
                        ErrorMessage="Please enter a subject." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        EnableClientScript="false" />
                </div>

                <!-- Message -->
                <div class="form-group">
                    <label class="form-label" for="txtMessage">Message</label>
                    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-textarea" Placeholder="Please describe your inquiry in detail..." />
                    <asp:RequiredFieldValidator ID="rfvMessage" runat="server" 
                        ControlToValidate="txtMessage" 
                        ErrorMessage="Please enter your message." 
                        CssClass="validation-error" 
                        Display="Dynamic" 
                        EnableClientScript="false" />
                </div>

                <!-- Action Button -->
                <div class="form-actions">
                    <asp:Button ID="btnSendMessage" runat="server" Text="Send Message ➤" CssClass="btn-send" OnClick="btnSendMessage_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
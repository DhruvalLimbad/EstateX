<%@ Page Title="Schedule a Visit" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ScheduleVisit.aspx.cs" Inherits="EstateX.ScheduleVisit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .visit-outer-wrap {
            max-width: 1180px;
            margin: 24px auto 60px auto;
            padding: 0 16px;
        }

        .visit-split-layout {
            display: grid;
            grid-template-columns: 1.25fr 0.95fr;
            gap: 40px;
            align-items: flex-start;
        }

        @media (max-width: 900px) {
            .visit-split-layout {
                grid-template-columns: 1fr;
                gap: 32px;
            }
        }

        /* Left Side: Header & Form */
        .visit-main-title {
            font-size: 28px;
            font-weight: 800;
            color: #111827;
            margin-bottom: 6px;
            letter-spacing: -0.5px;
        }

        .visit-sub-desc {
            font-size: 13.5px;
            color: #6b7280;
            margin-bottom: 24px;
        }

        .visit-card-form {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            padding: 24px;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.04);
        }

        .visit-field-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
            margin-bottom: 18px;
        }

        .visit-input-label {
            font-size: 12px;
            font-weight: 600;
            color: #374151;
        }

        .visit-control-input {
            width: 100%;
            height: 42px;
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

        .visit-control-input:focus {
            border-color: #2563eb;
        }

        .visit-dual-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
            margin-bottom: 18px;
        }

        @media (max-width: 600px) {
            .visit-dual-grid {
                grid-template-columns: 1fr;
            }
        }

        .val-error-text {
            color: #dc2626;
            font-size: 11.5px;
            font-weight: 500;
            display: block;
            margin-top: 3px;
        }

        .btn-visit-submit {
            background-color: #1d63ed;
            color: #ffffff;
            border: none;
            border-radius: 6px;
            height: 40px;
            padding: 0 20px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: background-color 0.15s ease;
        }

        .btn-visit-submit:hover {
            background-color: #154fc1;
        }

        /* Success Message */
        .visit-alert-success {
            background-color: #ecfdf5;
            color: #065f46;
            border: 1px solid #a7f3d0;
            padding: 12px 16px;
            border-radius: 6px;
            font-size: 13px;
            margin-bottom: 16px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        /* Right Side: Upcoming Visits List */
        .upcoming-section-title {
            font-size: 18px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 20px;
        }

        .upcoming-list-column {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .visit-summary-card {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            overflow: hidden;
            display: flex;
            align-items: center;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.03);
        }

        .visit-summary-img {
            width: 120px;
            height: 88px;
            object-fit: cover;
            flex-shrink: 0;
            background-color: #f3f4f6;
        }

        .visit-summary-content {
            padding: 12px 16px;
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .visit-summary-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .visit-prop-title {
            font-size: 14px;
            font-weight: 700;
            color: #111827;
        }

        .badge-confirmed {
            background-color: #ecfdf5;
            color: #059669;
            font-size: 11px;
            font-weight: 700;
            padding: 2px 8px;
            border-radius: 4px;
        }

        .badge-pending {
            background-color: #fffbeb;
            color: #d97706;
            font-size: 11px;
            font-weight: 700;
            padding: 2px 8px;
            border-radius: 4px;
        }

        .visit-date-stamp {
            font-size: 12px;
            color: #4b5563;
        }

        .visit-loc-stamp {
            font-size: 11.5px;
            color: #6b7280;
        }

        .link-past-visits {
            display: block;
            text-align: center;
            font-size: 13px;
            font-weight: 600;
            color: #1d63ed;
            text-decoration: none;
            margin-top: 14px;
        }

        .link-past-visits:hover {
            text-decoration: underline;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="visit-outer-wrap">
        <div class="visit-split-layout">
            <!-- Left Side: Schedule a Visit Form -->
            <div>
                <h1 class="visit-main-title">Schedule a Visit</h1>
                <p class="visit-sub-desc">Select a property and a convenient time to view it in person.</p>

                <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="visit-alert-success">
                    ✅ Your visit request has been submitted successfully!
                </asp:Panel>

                <div class="visit-card-form">
                    <!-- Property Name Selection -->
                    <div class="visit-field-group">
                        <label class="visit-input-label">Property Name</label>
                        <asp:DropDownList ID="ddlProperty" runat="server" CssClass="visit-control-input">
                            <asp:ListItem Value="" Text="Select a property to visit" />
                            <asp:ListItem Value="The Grand Atrium" Text="The Grand Atrium" />
                            <asp:ListItem Value="Riverside Loft 4B" Text="Riverside Loft 4B" />
                            <asp:ListItem Value="Sunset Boulevard Estate" Text="Sunset Boulevard Estate" />
                            <asp:ListItem Value="Skyline Penthouse" Text="Skyline Penthouse" />
                            <asp:ListItem Value="Palm Courtyard Villa" Text="Palm Courtyard Villa" />
                            <asp:ListItem Value="Urban Minimalist Row" Text="Urban Minimalist Row" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvProperty" runat="server"
                            ControlToValidate="ddlProperty"
                            InitialValue=""
                            ErrorMessage="Please select a property."
                            CssClass="val-error-text"
                            Display="Dynamic" />
                    </div>

                    <!-- Date & Time Inputs -->
                    <div class="visit-dual-grid">
                        <div>
                            <label class="visit-input-label">Date</label>
                            <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="visit-control-input" />
                            <asp:RequiredFieldValidator ID="rfvDate" runat="server"
                                ControlToValidate="txtDate"
                                ErrorMessage="Date is required."
                                CssClass="val-error-text"
                                Display="Dynamic" />
                        </div>
                        <div>
                            <label class="visit-input-label">Time</label>
                            <asp:TextBox ID="txtTime" runat="server" TextMode="Time" CssClass="visit-control-input" />
                            <asp:RequiredFieldValidator ID="rfvTime" runat="server"
                                ControlToValidate="txtTime"
                                ErrorMessage="Time is required."
                                CssClass="val-error-text"
                                Display="Dynamic" />
                        </div>
                    </div>

                    <!-- Name & Phone Number Inputs -->
                    <div class="visit-dual-grid">
                        <div>
                            <label class="visit-input-label">Your Name</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="visit-control-input" Placeholder="Dhruval" />
                            <asp:RequiredFieldValidator ID="rfvName" runat="server"
                                ControlToValidate="txtName"
                                ErrorMessage="Name is required."
                                CssClass="val-error-text"
                                Display="Dynamic" />
                        </div>
                        <div>
                            <label class="visit-input-label">Phone Number</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="visit-control-input" Placeholder="+91 9106536420" />
                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server"
                                ControlToValidate="txtPhone"
                                ErrorMessage="Phone number is required."
                                CssClass="val-error-text"
                                Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revPhone" runat="server"
                                ControlToValidate="txtPhone"
                                ValidationExpression="^(\+91[\-\s]?)?[6-9]\d{9}$"
                                ErrorMessage="Enter a valid 10-digit mobile number."
                                CssClass="val-error-text"
                                Display="Dynamic" />
                        </div>
                    </div>

                    <!-- Book Visit Action Button -->
                    <asp:Button ID="btnBookVisit" runat="server" Text="📅 Book Visit" CssClass="btn-visit-submit" OnClick="btnBookVisit_Click" />
                </div>
            </div>

            <!-- Right Side: Upcoming Visits List -->
            <div>
                <h2 class="upcoming-section-title">Upcoming Visits</h2>

                <div class="upcoming-list-column">
                    <!-- Visit Item 1 -->
                    <div class="visit-summary-card">
                        <img src="https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=400&auto=format&fit=crop&q=80" alt="The Grand Atrium" class="visit-summary-img" />
                        <div class="visit-summary-content">
                            <div class="visit-summary-header">
                                <span class="visit-prop-title">The Grand Atrium</span>
                                <span class="badge-confirmed">Confirmed</span>
                            </div>
                            <div class="visit-date-stamp">📅 Oct 24, 2026 • 🕒 14:30</div>
                            <div class="visit-loc-stamp">📍 1200 Downtown Ave, Metro City</div>
                        </div>
                    </div>

                    <!-- Visit Item 2 -->
                    <div class="visit-summary-card">
                        <img src="https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=400&auto=format&fit=crop&q=80" alt="Riverside Loft 4B" class="visit-summary-img" />
                        <div class="visit-summary-content">
                            <div class="visit-summary-header">
                                <span class="visit-prop-title">Riverside Loft 4B</span>
                                <span class="badge-pending">Pending</span>
                            </div>
                            <div class="visit-date-stamp">📅 Oct 26, 2026 • 🕒 10:00</div>
                            <div class="visit-loc-stamp">📍 45 River Walk, Mumbai District</div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
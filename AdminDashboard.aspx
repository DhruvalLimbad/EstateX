<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="AdminDashboard.aspx.cs" Inherits="EstateX.AdminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
    <style>
        .admin-dash-wrapper {
            max-width: 1200px;
            margin: 10px auto 60px auto;
            padding: 0 10px;
        }

        .dash-welcome-header {
            margin-bottom: 28px;
        }

        .dash-title {
            font-size: 26px;
            font-weight: 800;
            color: #111827;
            margin: 0 0 6px 0;
        }

        .dash-subtitle {
            font-size: 14px;
            color: #6b7280;
            margin: 0;
        }

        /* 4 Metrics Stats Grid */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 20px;
            margin-bottom: 36px;
        }

        .stat-card {
            background-color: #ffffff;
            border: 1px solid #f3f4f6;
            border-radius: 12px;
            padding: 22px 24px;
            display: flex;
            align-items: center;
            gap: 18px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.04);
            transition: transform 0.15s ease, box-shadow 0.15s ease;
        }

        .stat-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
        }

        .stat-icon-wrap {
            width: 50px;
            height: 50px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            flex-shrink: 0;
        }

        .icon-bg-blue { background-color: #eff6ff; }
        .icon-bg-purple { background-color: #f5f3ff; }
        .icon-bg-cyan { background-color: #ecfeff; }
        .icon-bg-pink { background-color: #fdf2f8; }

        .stat-meta {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .stat-label {
            font-size: 12.5px;
            font-weight: 600;
            color: #6b7280;
            margin: 0;
        }

        .stat-count {
            font-size: 24px;
            font-weight: 800;
            color: #111827;
            margin: 0;
            line-height: 1;
        }

        /* Property Activity Card */
        .activity-card {
            background-color: #ffffff;
            border: 1px solid #f3f4f6;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.04);
        }

        .activity-card-title {
            font-size: 17px;
            font-weight: 700;
            color: #111827;
            margin: 0 0 20px 0;
        }

        .activity-table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        .activity-table th {
            padding: 12px 16px;
            font-size: 11px;
            font-weight: 700;
            color: #6b7280;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 1px solid #e5e7eb;
        }

        .activity-table td {
            padding: 16px;
            font-size: 13.5px;
            color: #374151;
            border-bottom: 1px solid #f9fafb;
            vertical-align: middle;
        }

        .activity-table tr:last-child td {
            border-bottom: none;
        }

        /* Activity Status Badges */
        .act-badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 11.5px;
            font-weight: 600;
        }

        .act-badge-new {
            background-color: #f3f4f6;
            color: #4b5563;
        }

        .act-badge-published {
            background-color: #ecfdf5;
            color: #059669;
        }

        .act-badge-approved {
            background-color: #eff6ff;
            color: #2563eb;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminMainContent" runat="server">
    <div class="admin-dash-wrapper">
        <!-- Welcome Header -->
        <div class="dash-welcome-header">
            <h1 class="dash-title">Welcome, <asp:Literal ID="litAdminName" runat="server">Bhargav</asp:Literal></h1>
            <p class="dash-subtitle">Here's what's happening with EstateX today.</p>
        </div>

        <!-- Metric Stat Cards -->
        <div class="stats-grid">
            <!-- 1. Total Properties -->
            <div class="stat-card">
                <div class="stat-icon-wrap icon-bg-blue">🚙</div>
                <div class="stat-meta">
                    <p class="stat-label">Total Properties</p>
                    <p class="stat-count"><asp:Literal ID="litTotalProps" runat="server">128</asp:Literal></p>
                </div>
            </div>

            <!-- 2. Total Users -->
            <div class="stat-card">
                <div class="stat-icon-wrap icon-bg-purple">👥</div>
                <div class="stat-meta">
                    <p class="stat-label">Total Users</p>
                    <p class="stat-count"><asp:Literal ID="litTotalUsers" runat="server">342</asp:Literal></p>
                </div>
            </div>

            <!-- 3. Total Visit Requests -->
            <div class="stat-card">
                <div class="stat-icon-wrap icon-bg-cyan">📅</div>
                <div class="stat-meta">
                    <p class="stat-label">Total Visit Requests</p>
                    <p class="stat-count"><asp:Literal ID="litVisitRequests" runat="server">57</asp:Literal></p>
                </div>
            </div>

            <!-- 4. Total Inquiries -->
            <div class="stat-card">
                <div class="stat-icon-wrap icon-bg-pink">💬</div>
                <div class="stat-meta">
                    <p class="stat-label">Total Property Inquiries</p>
                    <p class="stat-count"><asp:Literal ID="litInquiries" runat="server">89</asp:Literal></p>
                </div>
            </div>
        </div>

        <!-- Property Activity Card -->
        <div class="activity-card">
            <h2 class="activity-card-title">Property activity</h2>

            <table class="activity-table">
                <thead>
                    <tr>
                        <th style="width: 25%;">Activity</th>
                        <th style="width: 22%;">User</th>
                        <th style="width: 25%;">Property</th>
                        <th style="width: 16%;">Date</th>
                        <th style="width: 12%; text-align: center;">Status</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptRecentActivity" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td style="font-weight: 500;"><%# Eval("Activity") %></td>
                                <td><%# Eval("User") %></td>
                                <td><%# Eval("Property") %></td>
                                <td><%# Eval("Date") %></td>
                                <td style="text-align: center;">
                                    <span class='act-badge <%# Eval("Status").ToString() == "Published" ? "act-badge-published" : (Eval("Status").ToString() == "Approved" ? "act-badge-approved" : "act-badge-new") %>'>
                                        <%# Eval("Status") %>
                                    </span>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
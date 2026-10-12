<%@ Page Title="My Visits" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="MyVisits.aspx.cs" Inherits="EstateX.MyVisits" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .visits-page-wrap {
            max-width: 1200px;
            margin: 20px auto 60px auto;
            padding: 0 16px;
        }

        /* Top Header */
        .page-header-row {
            margin-bottom: 36px;
        }

        .page-main-heading {
            font-size: 28px;
            font-weight: 800;
            color: #111827;
            margin-bottom: 6px;
        }

        .page-sub-caption {
            font-size: 13.5px;
            color: #6b7280;
            margin: 0;
        }

        /* Section Headings */
        .section-headline {
            font-size: 18px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 20px;
        }

        /* Upcoming Visits Cards Grid */
        .upcoming-cards-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(360px, 1fr));
            gap: 20px;
            margin-bottom: 48px;
        }

        @media (max-width: 640px) {
            .upcoming-cards-grid {
                grid-template-columns: 1fr;
            }
        }

        .visit-box-card {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.04);
            display: flex;
            flex-direction: column;
        }

        .visit-box-top {
            background-color: #f3f4f6;
            padding: 12px 18px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #e5e7eb;
            font-size: 12px;
            font-weight: 500;
            color: #4b5563;
        }

        .pill-badge {
            font-size: 11px;
            font-weight: 700;
            padding: 3px 10px;
            border-radius: 12px;
            display: inline-block;
        }

        .pill-confirmed {
            background-color: #1d4ed8;
            color: #ffffff;
        }

        .pill-pending {
            background-color: #e5e7eb;
            color: #374151;
        }

        .pill-completed {
            background-color: #e5e7eb;
            color: #374151;
        }

        .pill-cancelled {
            background-color: #fee2e2;
            color: #dc2626;
        }

        .visit-box-body {
            padding: 20px 18px;
            flex: 1;
        }

        .visit-prop-name {
            font-size: 16px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 6px;
        }

        .visit-prop-loc {
            font-size: 12.5px;
            color: #6b7280;
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .visit-box-actions {
            display: grid;
            grid-template-columns: 1fr 1.3fr;
            gap: 12px;
            padding: 14px 18px;
            border-top: 1px solid #f3f4f6;
            background-color: #ffffff;
        }

        .btn-action-cancel {
            background-color: #ffffff;
            color: #4b5563;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            height: 38px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: all 0.15s ease;
        }

        .btn-action-cancel:hover {
            background-color: #f9fafb;
            color: #dc2626;
            border-color: #fca5a5;
        }

        .btn-action-details {
            background-color: #0052cc;
            color: #ffffff;
            border: none;
            border-radius: 6px;
            height: 38px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: background-color 0.15s ease;
        }

        .btn-action-details:hover {
            background-color: #0747a6;
        }

        /* Completed Visits Table */
        .table-wrap-card {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            overflow-x: auto;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.04);
        }

        .visits-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13.5px;
            text-align: left;
        }

        .visits-table th {
            background-color: #f3f4f6;
            color: #374151;
            font-weight: 700;
            padding: 14px 18px;
            font-size: 12px;
            border-bottom: 1px solid #e5e7eb;
        }

        .visits-table td {
            padding: 16px 18px;
            border-bottom: 1px solid #f3f4f6;
            color: #4b5563;
            vertical-align: middle;
        }

        .visits-table tr:last-child td {
            border-bottom: none;
        }

        .tbl-prop-strong {
            font-weight: 700;
            color: #111827;
        }

        .tbl-action-link {
            color: #0052cc;
            text-decoration: none;
            font-weight: 600;
            font-size: 12.5px;
        }

        .tbl-action-link:hover {
            text-decoration: underline;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="visits-page-wrap">
        <!-- Top Title -->
        <div class="page-header-row">
            <h1 class="page-main-heading">My Visits</h1>
            <p class="page-sub-caption">Manage and review your property viewing schedule.</p>
        </div>

        <!-- 1. Upcoming Visits Section -->
        <h2 class="section-headline">Upcoming Visits</h2>
        <div class="upcoming-cards-grid">
            <!-- Card 1: Sunset Boulevard Estate -->
            <div class="visit-box-card">
                <div class="visit-box-top">
                    <span>Tomorrow, 10:00 AM</span>
                    <span class="pill-badge pill-confirmed">Confirmed</span>
                </div>
                <div class="visit-box-body">
                    <div class="visit-prop-name">Sunset Boulevard Estate</div>
                    <div class="visit-prop-loc">📍 Bandra West, Mumbai District</div>
                </div>
                <div class="visit-box-actions">
                    <asp:LinkButton ID="btnCancel1" runat="server" CssClass="btn-action-cancel" OnClick="btnCancel_Click" CommandArgument="Sunset Boulevard Estate">Cancel</asp:LinkButton>
                    <a href="PropertyDetails.aspx?id=1" class="btn-action-details">Details</a>
                </div>
            </div>

            <!-- Card 2: Riverside Loft 4B -->
            <div class="visit-box-card">
                <div class="visit-box-top">
                    <span>Oct 24, 2:30 PM</span>
                    <span class="pill-badge pill-pending">Pending</span>
                </div>
                <div class="visit-box-body">
                    <div class="visit-prop-name">Riverside Loft 4B</div>
                    <div class="visit-prop-loc">📍 45 River Walk, Mumbai District</div>
                </div>
                <div class="visit-box-actions">
                    <asp:LinkButton ID="btnCancel2" runat="server" CssClass="btn-action-cancel" OnClick="btnCancel_Click" CommandArgument="Riverside Loft 4B">Cancel</asp:LinkButton>
                    <a href="PropertyDetails.aspx?id=2" class="btn-action-details">Details</a>
                </div>
            </div>
        </div>

        <!-- 2. Completed Visits Section -->
        <h2 class="section-headline">Completed Visits</h2>
        <div class="table-wrap-card">
            <table class="visits-table">
                <thead>
                    <tr>
                        <th>Property</th>
                        <th>Location</th>
                        <th>Date &amp; Time</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="tbl-prop-strong">Skyline Penthouse</td>
                        <td>Worli, Maharashtra</td>
                        <td>Oct 15, 11:00 AM</td>
                        <td><span class="pill-badge pill-completed">Completed</span></td>
                        <td><a href="#" class="tbl-action-link">Review</a></td>
                    </tr>
                    <tr>
                        <td class="tbl-prop-strong">Palm Courtyard Villa</td>
                        <td>Civil Lines, Delhi</td>
                        <td>Oct 10, 4:00 PM</td>
                        <td><span class="pill-badge pill-cancelled">Cancelled</span></td>
                        <td><a href="PropertyDetails.aspx?id=3" class="tbl-action-link">Details</a></td>
                    </tr>
                    <tr>
                        <td class="tbl-prop-strong">Urban Minimalist Row</td>
                        <td>Kochi, Kerala</td>
                        <td>Oct 02, 9:30 AM</td>
                        <td><span class="pill-badge pill-completed">Completed</span></td>
                        <td><a href="#" class="tbl-action-link">Review</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
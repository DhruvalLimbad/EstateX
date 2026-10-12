<%@ Page Title="Notifications" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Notifications.aspx.cs" Inherits="EstateX.Notifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
   <style>
    .notif-container {
        max-width: 1000px;
        margin: 28px auto 70px auto;
        padding: 0 16px;
    }

    .notif-header {
        margin-bottom: 24px;
    }

    .notif-title {
        font-size: 26px;
        font-weight: 800;
        color: #111827;
        margin-bottom: 6px;
    }

    .notif-subtitle {
        font-size: 13.5px;
        color: #6b7280;
        margin: 0;
    }

    /* Notifications Stack */
    .notif-list {
        display: flex;
        flex-direction: column;
        gap: 14px;
    }

    /* Base Notification Card */
    .notif-card {
        background-color: #ffffff;
        border: 1px solid #e5e7eb;
        border-radius: 8px;
        padding: 18px 22px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        position: relative;
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.03);
        cursor: pointer;
        transition: transform 0.2s cubic-bezier(0.4, 0, 0.2, 1),
                    box-shadow 0.2s cubic-bezier(0.4, 0, 0.2, 1),
                    border-color 0.2s ease,
                    background-color 0.2s ease;
    }

    /* Card Hover Animation & Elevation */
    .notif-card:hover {
        transform: translateY(-2px);
        background-color: #fbfcfe;
        border-color: #bfdbfe;
        box-shadow: 0 6px 18px rgba(37, 99, 235, 0.08);
    }

    /* Unread Card Indicator */
    .notif-card.unread {
        border-left: 4px solid #2563eb;
    }

    .notif-card.unread:hover {
        border-left-color: #1d4ed8;
        background-color: #f8faff;
        box-shadow: 0 6px 20px rgba(37, 99, 235, 0.12);
    }

    .notif-left {
        display: flex;
        align-items: center;
        gap: 16px;
        flex: 1;
    }

    /* Icon Box & Micro-Interaction */
    .notif-icon-box {
        width: 44px;
        height: 44px;
        border-radius: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-shrink: 0;
        transition: transform 0.2s ease, background-color 0.2s ease;
    }

    .notif-card:hover .notif-icon-box {
        transform: scale(1.06);
    }

    .icon-box-blue {
        background-color: #eff6ff;
        color: #2563eb;
    }

    .icon-box-gray {
        background-color: #f3f4f6;
        color: #4b5563;
    }

    .icon-box-orange {
        background-color: #fff7ed;
        color: #ea580c;
    }

    .notif-content {
        display: flex;
        flex-direction: column;
        gap: 4px;
    }

    .notif-item-title {
        font-size: 14px;
        font-weight: 700;
        color: #111827;
        margin: 0;
        transition: color 0.15s ease;
    }

    .notif-card:hover .notif-item-title {
        color: #2563eb;
    }

    .notif-item-desc {
        font-size: 13px;
        color: #4b5563;
        margin: 0;
        line-height: 1.4;
    }

    .notif-time-badge {
        font-size: 11.5px;
        color: #6b7280;
        font-weight: 500;
        white-space: nowrap;
        margin-left: 18px;
    }

    .notif-time-badge.active-time {
        color: #2563eb;
        font-weight: 600;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="notif-container">
        <!-- Header -->
        <div class="notif-header">
            <h1 class="notif-title">Notifications</h1>
            <p class="notif-subtitle">Stay updated on your visits, inquiries, and properties.</p>
        </div>

        <!-- Notification List Items -->
        <div class="notif-list">
            <!-- 1. Visit Confirmed -->
            <div class="notif-card">
                <div class="notif-left">
                    <div class="notif-icon-box icon-box-blue">
                        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                            <line x1="16" y1="2" x2="16" y2="6"></line>
                            <line x1="8" y1="2" x2="8" y2="6"></line>
                            <line x1="3" y1="10" x2="21" y2="10"></line>
                        </svg>
                    </div>
                    <div class="notif-content">
                        <h4 class="notif-item-title">Visit Confirmed</h4>
                        <p class="notif-item-desc">Your visit to Sunset Boulevard Estate, Bandra West, Mumbai has been confirmed for tomorrow at 2:00 PM.</p>
                    </div>
                </div>
                <div class="notif-time-badge">2 hours ago</div>
            </div>

            
            <!-- 3. Price Drop Alert -->
            <div class="notif-card">
                <div class="notif-left">
                    <div class="notif-icon-box icon-box-orange">
                        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="23 18 13.5 8.5 8.5 13.5 1 6"></polyline>
                            <polyline points="17 18 23 18 23 12"></polyline>
                        </svg>
                    </div>
                    <div class="notif-content">
                        <h4 class="notif-item-title">Price Drop Alert</h4>
                        <p class="notif-item-desc">A property on your wishlist, 45 Pine Court, Worli, just dropped in price by ₹ 75,000.</p>
                    </div>
                </div>
                <div class="notif-time-badge">Yesterday</div>
            </div>

            <!-- 4. System Maintenance -->
            <div class="notif-card">
                <div class="notif-left">
                    <div class="notif-icon-box icon-box-gray">
                        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="12" cy="12" r="10"></circle>
                            <line x1="12" y1="16" x2="12" y2="12"></line>
                            <line x1="12" y1="8" x2="12.01" y2="8"></line>
                        </svg>
                    </div>
                    <div class="notif-content">
                        <h4 class="notif-item-title">System Maintenance</h4>
                        <p class="notif-item-desc">EstateX will undergo brief maintenance on Sunday at 2:00 AM IST.</p>
                    </div>
                </div>
                <div class="notif-time-badge">Oct 12</div>
            </div>
        </div>
    </div>
</asp:Content>
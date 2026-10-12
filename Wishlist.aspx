<%@ Page Title="My Wishlist" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Wishlist.aspx.cs" Inherits="EstateX.Wishlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .wishlist-container {
            max-width: 1200px;
            margin: 24px auto 60px auto;
            padding: 0 16px;
        }

        .wishlist-header {
            margin-bottom: 28px;
        }

        .wishlist-title {
            font-size: 26px;
            font-weight: 800;
            color: #111827;
            margin-bottom: 6px;
        }

        .wishlist-count {
            font-size: 13.5px;
            color: #6b7280;
            margin: 0;
        }

        /* 3-Column Card Grid */
        .wishlist-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 24px;
        }

        @media (max-width: 960px) {
            .wishlist-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 640px) {
            .wishlist-grid {
                grid-template-columns: 1fr;
            }
        }

        .wishlist-card {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.04);
            transition: transform 0.15s ease, box-shadow 0.15s ease;
        }

        .wishlist-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }

        .card-image-wrap {
            position: relative;
            width: 100%;
            height: 220px;
            background-color: #f3f4f6;
        }

        .card-image-wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }

        .heart-badge {
            position: absolute;
            top: 12px;
            right: 12px;
            width: 32px;
            height: 32px;
            background-color: #ffffff;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
            cursor: pointer;
            border: none;
        }

        .heart-badge svg {
            width: 17px;
            height: 17px;
            fill: #0052cc;
        }

        .status-tag {
            position: absolute;
            bottom: 12px;
            left: 12px;
            background: rgba(255, 255, 255, 0.95);
            padding: 4px 10px;
            border-radius: 4px;
            font-size: 11px;
            font-weight: 600;
            color: #374151;
            display: flex;
            align-items: center;
            gap: 4px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .card-body {
            padding: 16px 18px;
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .card-header-row {
            display: flex;
            justify-content: space-between;
            align-items: baseline;
            margin-bottom: 6px;
        }

        .property-title {
            font-size: 16px;
            font-weight: 700;
            color: #111827;
            margin: 0;
        }

        .property-price {
            font-size: 15px;
            font-weight: 700;
            color: #0052cc;
            white-space: nowrap;
        }

        .property-address {
            font-size: 12.5px;
            color: #6b7280;
            margin-bottom: 16px;
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .card-footer-actions {
            margin-top: auto;
            display: flex;
            align-items: center;
            gap: 10px;
            padding-top: 14px;
            border-top: 1px solid #f3f4f6;
        }

        .btn-view-details {
            flex: 1;
            height: 38px;
            background-color: #0052cc;
            color: #ffffff;
            font-size: 13px;
            font-weight: 600;
            text-decoration: none;
            border-radius: 6px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border: none;
            transition: background-color 0.15s ease;
        }

        .btn-view-details:hover {
            background-color: #0747a6;
            color: #ffffff;
        }

        .btn-remove-wishlist {
            width: 38px;
            height: 38px;
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 6px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: background-color 0.15s ease, border-color 0.15s ease;
        }

        .btn-remove-wishlist:hover {
            background-color: #fee2e2;
            border-color: #fca5a5;
        }

        .btn-remove-wishlist svg {
            width: 15px;
            height: 15px;
            stroke: #6b7280;
        }

        .btn-remove-wishlist:hover svg {
            stroke: #dc2626;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wishlist-container">
        <!-- Wishlist Header -->
        <div class="wishlist-header">
            <h1 class="wishlist-title">My Wishlist</h1>
            <p class="wishlist-count"><asp:Literal ID="litCount" runat="server">You have saved 3 properties.</asp:Literal></p>
        </div>

        <!-- 3 Properties Grid with Past Indian Addresses -->
        <div class="wishlist-grid">
            <!-- Card 1: The Azure Residences -->
            <asp:Panel ID="pnlCard1" runat="server" CssClass="wishlist-card">
                <div class="card-image-wrap">
                    <img src="https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=600&auto=format&fit=crop&q=80" alt="The Azure Residences" />
                    <button type="button" class="heart-badge" title="Saved">
                        <svg viewBox="0 0 24 24"><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>
                    </button>
                    <span class="status-tag">🏷️ Available</span>
                </div>
                <div class="card-body">
                    <div class="card-header-row">
                        <h3 class="property-title">The Azure Residences</h3>
                        <span class="property-price">₹ 1,250,000</span>
                    </div>
                    <div class="property-address">
                        📍 124 Waterfront Ave, Worli, Mumbai
                    </div>
                    <div class="card-footer-actions">
                        <a href="PropertyDetails.aspx?id=1" class="btn-view-details">View Details</a>
                        <asp:LinkButton ID="btnDelete1" runat="server" CssClass="btn-remove-wishlist" OnClick="btnDelete_Click" CommandArgument="1" ToolTip="Remove">
                            <svg viewBox="0 0 24 24" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <polyline points="3 6 5 6 21 6"></polyline>
                                <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                            </svg>
                        </asp:LinkButton>
                    </div>
                </div>
            </asp:Panel>

            <!-- Card 2: Industrial Edge Lofts -->
            <asp:Panel ID="pnlCard2" runat="server" CssClass="wishlist-card">
                <div class="card-image-wrap">
                    <img src="https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=600&auto=format&fit=crop&q=80" alt="Industrial Edge Lofts" />
                    <button type="button" class="heart-badge" title="Saved">
                        <svg viewBox="0 0 24 24"><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>
                    </button>
                    <span class="status-tag">🏷️ Available</span>
                </div>
                <div class="card-body">
                    <div class="card-header-row">
                        <h3 class="property-title">Industrial Edge Lofts</h3>
                        <span class="property-price">₹ 895,000</span>
                    </div>
                    <div class="property-address">
                        📍 88 Design District, Bandra West, Mumbai
                    </div>
                    <div class="card-footer-actions">
                        <a href="PropertyDetails.aspx?id=2" class="btn-view-details">View Details</a>
                        <asp:LinkButton ID="btnDelete2" runat="server" CssClass="btn-remove-wishlist" OnClick="btnDelete_Click" CommandArgument="2" ToolTip="Remove">
                            <svg viewBox="0 0 24 24" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <polyline points="3 6 5 6 21 6"></polyline>
                                <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                            </svg>
                        </asp:LinkButton>
                    </div>
                </div>
            </asp:Panel>

            <!-- Card 3: Cedar Park Townhomes -->
            <asp:Panel ID="pnlCard3" runat="server" CssClass="wishlist-card">
                <div class="card-image-wrap">
                    <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=600&auto=format&fit=crop&q=80" alt="Cedar Park Townhomes" />
                    <button type="button" class="heart-badge" title="Saved">
                        <svg viewBox="0 0 24 24"><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>
                    </button>
                    <span class="status-tag">📝 Under Contract</span>
                </div>
                <div class="card-body">
                    <div class="card-header-row">
                        <h3 class="property-title">Cedar Park Townhomes</h3>
                        <span class="property-price">₹ 650,000</span>
                    </div>
                    <div class="property-address">
                        📍 402 Parkside Dr, Powai, Mumbai
                    </div>
                    <div class="card-footer-actions">
                        <a href="PropertyDetails.aspx?id=3" class="btn-view-details">View Details</a>
                        <asp:LinkButton ID="btnDelete3" runat="server" CssClass="btn-remove-wishlist" OnClick="btnDelete_Click" CommandArgument="3" ToolTip="Remove">
                            <svg viewBox="0 0 24 24" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <polyline points="3 6 5 6 21 6"></polyline>
                                <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                            </svg>
                        </asp:LinkButton>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
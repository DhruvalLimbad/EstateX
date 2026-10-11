<%@ Page Title="Property Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="PropertyDetails.aspx.cs" Inherits="EstateX.PropertyDetails" %><asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        /* Breadcrumbs */
        .breadcrumb-nav {
            font-size: 13px;
            color: #6b7280;
            margin-bottom: 20px;
        }
        .breadcrumb-nav a {
            color: #6b7280;
            text-decoration: none;
        }
        .breadcrumb-nav a:hover {
            color: #0052cc;
        }
        .breadcrumb-nav span {
            margin: 0 6px;
        }
        .breadcrumb-current {
            color: #111827;
            font-weight: 500;
        }

        /* 2-Column Layout */
        .details-layout {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 32px;
            align-items: start;
            margin-bottom: 60px;
        }
        @media (max-width: 900px) {
            .details-layout {
                grid-template-columns: 1fr;
            }
        }

        /* Image Showcase */
        .showcase-wrapper {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            overflow: hidden;
            margin-bottom: 24px;
        }
        .showcase-toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 16px;
            font-size: 13px;
            color: #4b5563;
            border-bottom: 1px solid #f3f4f6;
        }
        .showcase-tools {
            display: flex;
            gap: 12px;
            font-size: 15px;
            cursor: pointer;
        }
        .showcase-img-box {
            position: relative;
            height: 380px;
            background-color: #f3f4f6;
        }
        .showcase-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .photo-count-badge {
            position: absolute;
            bottom: 14px;
            right: 14px;
            background: rgba(255, 255, 255, 0.95);
            color: #1f2937;
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 600;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        /* Title & Price Header */
        .property-title-row {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 6px;
        }
        .property-main-title {
            font-size: 26px;
            font-weight: 800;
            color: #111827;
        }
        .property-main-price {
            font-size: 24px;
            font-weight: 800;
            color: #0052cc;
            text-align: right;
        }
        .property-location-tag {
            font-size: 14px;
            color: #6b7280;
            margin-bottom: 20px;
        }

        /* Spec Highlights Box */
        .spec-box {
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            padding: 16px 24px;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 16px;
            margin-bottom: 30px;
        }
        .spec-unit {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }
        .spec-unit-label {
            font-size: 10px;
            font-weight: 700;
            color: #6b7280;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .spec-unit-value {
            font-size: 14px;
            font-weight: 700;
            color: #111827;
        }

        /* Content Sections */
        .section-block {
            margin-bottom: 32px;
            padding-bottom: 24px;
            border-bottom: 1px solid #e5e7eb;
        }
        .section-heading {
            font-size: 18px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 14px;
        }
        .section-body-text {
            font-size: 14px;
            line-height: 1.65;
            color: #4b5563;
            margin-bottom: 12px;
        }

        /* Amenities Grid */
        .amenities-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
        }
        .amenity-item {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 14px;
            color: #374151;
        }
        .amenity-check {
            color: #0052cc;
            font-weight: bold;
        }

        /* Sidebar Cards */
        .sidebar-card {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            margin-bottom: 20px;
            overflow: hidden;
        }
        .sidebar-card-header {
            background-color: #f9fafb;
            padding: 12px 18px;
            font-size: 11px;
            font-weight: 700;
            color: #4b5563;
            text-transform: uppercase;
            letter-spacing: 0.6px;
            border-bottom: 1px solid #e5e7eb;
        }
        .sidebar-card-body {
            padding: 18px;
        }

        /* Listing Agent Card */
        .agent-profile {
            display: flex;
            align-items: center;
            gap: 14px;
        }
        .agent-avatar {
            width: 52px;
            height: 52px;
            border-radius: 6px;
            object-fit: cover;
        }
        .agent-name {
            font-size: 15px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 2px;
        }
        .agent-title {
            font-size: 12px;
            color: #6b7280;
            margin-bottom: 4px;
        }
        .agent-rating {
            font-size: 12px;
            color: #0052cc;
            font-weight: 600;
        }

        /* Take Action Card */
        .notice-box {
            background-color: #eff6ff;
            border-left: 3px solid #0052cc;
            padding: 10px 14px;
            font-size: 12px;
            color: #1e40af;
            border-radius: 4px;
            margin-bottom: 16px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .action-button-list {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .btn-action-gray {
            width: 100%;
            background-color: #f3f4f6;
            color: #374151;
            border: 1px solid #e5e7eb;
            padding: 10px 0;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            text-align: center;
            text-decoration: none;
            display: block;
        }
        .btn-action-gray:hover {
            background-color: #e5e7eb;
        }
        .btn-action-outline {
            width: 100%;
            background-color: #ffffff;
            color: #0052cc;
            border: 1px solid #0052cc;
            padding: 10px 0;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            text-align: center;
            text-decoration: none;
            display: block;
        }
        .btn-action-outline:hover {
            background-color: #f0f7ff;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Breadcrumb Path -->
    <div class="breadcrumb-nav">
        <a href="PropertyList.aspx">Properties</a>
        <span>&rsaquo;</span>
        <asp:Label ID="lblBreadcrumbTitle" runat="server" CssClass="breadcrumb-current" Text="Modern Penthouse Suite" />
    </div>

    <!-- Main 2-Column Content -->
    <div class="details-layout">
        
        <!-- Left: Image & Specs -->
        <div>
            <!-- Gallery Box -->
            <div class="showcase-wrapper">
                <div class="showcase-toolbar">
                    <span>Property Details</span>
                    <div class="showcase-tools">
                        <span>⌂</span>
                        <span>🔍</span>
                        <span>⧉</span>
                        <span>♡</span>
                    </div>
                </div>
                <div class="showcase-img-box">
                    <asp:Image ID="imgMainPhoto" runat="server" CssClass="showcase-img" ImageUrl="https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=1200" />
                    <div class="photo-count-badge">📷 View 12 Photos</div>
                </div>
            </div>

            <!-- Title & Price Header -->
            <div class="property-title-row">
                <asp:Label ID="lblTitle" runat="server" CssClass="property-main-title" Text="Modern Penthouse Suite" />
                <asp:Label ID="lblPrice" runat="server" CssClass="property-main-price" Text="₹ 3,450,000" />
            </div>
            <p class="property-location-tag">
                <asp:Label ID="lblLocation" runat="server" Text="📍 Mumbai District" />
            </p>

            <!-- Specifications Strip -->
            <div class="spec-box">
                <div class="spec-unit">
                    <span class="spec-unit-label">Property Type</span>
                    <asp:Label ID="lblType" runat="server" CssClass="spec-unit-value" Text="Condominium" />
                </div>
                <div class="spec-unit">
                    <span class="spec-unit-label">Area</span>
                    <asp:Label ID="lblArea" runat="server" CssClass="spec-unit-value" Text="2,450 sqft" />
                </div>
                <div class="spec-unit">
                    <span class="spec-unit-label">Bedrooms</span>
                    <asp:Label ID="lblBeds" runat="server" CssClass="spec-unit-value" Text="3 Beds" />
                </div>
                <div class="spec-unit">
                    <span class="spec-unit-label">Bathrooms</span>
                    <asp:Label ID="lblBaths" runat="server" CssClass="spec-unit-value" Text="3.5 Baths" />
                </div>
            </div>

            <!-- Description -->
            <div class="section-block">
                <h3 class="section-heading">Description</h3>
                <p class="section-body-text">
                    Experience unparalleled luxury in this stunning full-floor penthouse located in the heart of the Financial District. Boasting panoramic views of the city skyline and harbor, this meticulously designed residence offers a perfect blend of modern elegance and functional living.
                </p>
                <p class="section-body-text">
                    The expansive open-concept living area features 11-foot ceilings, custom wide-plank oak flooring, and floor-to-ceiling smart glass windows. The chef's kitchen is equipped with top-of-the-line appliances, custom Italian cabinetry, and a massive Calacatta marble island.
                </p>
            </div>

            <!-- Features & Amenities -->
            <div class="section-block" style="border-bottom: none;">
                <h3 class="section-heading">Features & Amenities</h3>
                <div class="amenities-grid">
                    <div class="amenity-item"><span class="amenity-check">✓</span> 24/7 Doorman & Concierge</div>
                    <div class="amenity-item"><span class="amenity-check">✓</span> Private Elevator Landing</div>
                    <div class="amenity-item"><span class="amenity-check">✓</span> Smart Home System</div>
                    <div class="amenity-item"><span class="amenity-check">✓</span> Rooftop Terrace Access</div>
                    <div class="amenity-item"><span class="amenity-check">✓</span> Fitness Center & Spa</div>
                    <div class="amenity-item"><span class="amenity-check">✓</span> Wine Cellar</div>
                </div>
            </div>
        </div>

        <!-- Right: Agent & Actions Sidebar -->
        <aside>
            <!-- Listing Agent Card -->
            <div class="sidebar-card">
                <div class="sidebar-card-header">Listing Agent</div>
                <div class="sidebar-card-body">
                    <div class="agent-profile">
                        <img src="https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=150" alt="Riya Mehta" class="agent-avatar" />
                        <div>
                            <div class="agent-name">Riya Mehta</div>
                            <div class="agent-title">Senior Associate Broker</div>
                            <div class="agent-rating">★ 4.9 (124 reviews)</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Take Action Card -->
            <div class="sidebar-card">
                <div class="sidebar-card-header">Take Action</div>
                <div class="sidebar-card-body">
                    <div class="notice-box">
                        ℹ Login to continue with booking and inquiries.
                    </div>
                    <div class="action-button-list">
<a href="ScheduleVisit.aspx" 
   style="display: inline-flex; align-items: center; justify-content: center; gap: 8px; background-color: #1d63ed !important; color: #ffffff !important; text-decoration: none !important; font-size: 13.5px !important; font-weight: 600 !important; padding: 10px 22px !important; border-radius: 6px !important; border: none !important; cursor: pointer !important; box-shadow: 0 1px 2px rgba(0, 0, 0, 0.08);">
   📅 Book Visit
</a>
                 <asp:LinkButton ID="btnAddToWishlist" runat="server" 
    OnClick="btnAddToWishlist_Click" 
    CausesValidation="false" 
    style="display: inline-flex !important; align-items: center !important; justify-content: center !important; gap: 8px !important; background-color: #0052cc !important; color: #ffffff !important; border: none !important; border-radius: 6px !important; padding: 10px 20px !important; font-size: 13.5px !important; font-weight: 600 !important; text-decoration: none !important; cursor: pointer !important; width: auto !important; box-shadow: 0 1px 2px rgba(0,0,0,0.1) !important;">
    <svg viewBox="0 0 24 24" style="width: 16px !important; height: 16px !important; min-width: 16px !important; max-width: 16px !important; fill: #ffffff !important; display: inline-block !important;">
        <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/>
    </svg>
    Add to Wishlist
</asp:LinkButton>
                    </div>
                </div>
            </div>
        </aside>

    </div>
</asp:Content>
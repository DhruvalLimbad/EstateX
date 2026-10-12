<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="EstateX.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        /* Hero Split Section */
        .home-hero-grid {
            display: grid;
            grid-template-columns: 1.15fr 1fr;
            gap: 20px;
            margin-bottom: 40px;
        }

        @media (max-width: 900px) {
            .home-hero-grid {
                grid-template-columns: 1fr;
            }
        }

        /* Left Hero Box */
        .hero-welcome-box {
            background-color: #f3f5f9;
            border-radius: 12px;
            padding: 44px 36px 36px 36px;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            min-height: 480px;
        }

        .welcome-heading {
            font-size: 32px;
            font-weight: 800;
            color: #111827;
            margin-bottom: 6px;
        }

        .welcome-name {
            color: #0052cc;
        }

        .welcome-desc {
            font-size: 13.5px;
            color: #4b5563;
            margin-bottom: 30px;
        }

        /* Search Filter Card inside Left Hero */
        .hero-filter-card {
            background: #ffffff;
            border-radius: 10px;
            border: 1px solid #e5e7eb;
            padding: 18px 20px;
            display: flex;
            flex-direction: column;
            gap: 14px;
        }

        .filter-inputs-row {
            display: grid;
            grid-template-columns: 1.4fr 1fr 1fr;
            gap: 12px;
        }

        @media (max-width: 600px) {
            .filter-inputs-row {
                grid-template-columns: 1fr;
            }
        }

        .filter-field {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .filter-field-label {
            font-size: 11px;
            font-weight: 600;
            color: #6b7280;
        }

        .filter-field input, .filter-field select {
            height: 38px;
            border: 1px solid #e5e7eb;
            border-radius: 6px;
            padding: 0 10px;
            font-size: 13px;
            color: #1f2937;
            background: #fafafa;
            outline: none;
        }

        .btn-search-hero {
            align-self: flex-end;
            background-color: #0052cc;
            color: #ffffff;
            border: none;
            border-radius: 6px;
            padding: 9px 18px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
        }
        .btn-search-hero:hover {
            background-color: #0043a8;
        }

        /* Right Hero Featured Villa Card */
        .hero-featured-card {
            position: relative;
            border-radius: 12px;
            overflow: hidden;
            min-height: 480px;
            background: url('https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=1000&auto=format&fit=crop&q=80') center/cover no-repeat;
            display: flex;
            align-items: flex-end;
            padding: 30px;
        }

        .hero-featured-overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(180deg, rgba(0,0,0,0) 50%, rgba(0,0,0,0.85) 100%);
        }

        .hero-featured-content {
            position: relative;
            z-index: 2;
            color: #ffffff;
        }

        .featured-pill {
            display: inline-block;
            background: #0052cc;
            color: #ffffff;
            font-size: 10px;
            font-weight: 700;
            padding: 3px 8px;
            border-radius: 4px;
            text-transform: uppercase;
            margin-bottom: 8px;
        }

        .featured-title {
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 4px;
        }

        .featured-location {
            font-size: 12.5px;
            color: rgba(255, 255, 255, 0.85);
        }

        /* Recommended Section */
        .section-header-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .section-heading-title {
            font-size: 20px;
            font-weight: 800;
            color: #111827;
        }

        .view-all-link {
            font-size: 13px;
            font-weight: 600;
            color: #0052cc;
            text-decoration: none;
        }

        /* 4-Column Properties Grid */
        .recommended-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 60px;
        }

        @media (max-width: 1100px) {
            .recommended-grid { grid-template-columns: repeat(2, 1fr); }
        }
        @media (max-width: 600px) {
            .recommended-grid { grid-template-columns: 1fr; }
        }

        .rec-card {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }

        .rec-img-wrap {
            position: relative;
            height: 170px;
            background: #f3f4f6;
        }

        .rec-img-wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .rec-badge-active {
            position: absolute;
            bottom: 8px;
            left: 8px;
            background: rgba(0, 0, 0, 0.65);
            color: #ffffff;
            font-size: 10px;
            padding: 2px 6px;
            border-radius: 3px;
        }

        .rec-badge-offer {
            position: absolute;
            bottom: 8px;
            left: 8px;
            background: #d97706;
            color: #ffffff;
            font-size: 10px;
            padding: 2px 6px;
            border-radius: 3px;
        }

        .rec-heart-btn {
            position: absolute;
            top: 8px;
            right: 8px;
            background: rgba(255, 255, 255, 0.9);
            border: none;
            width: 26px;
            height: 26px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 12px;
            color: #4b5563;
        }

        .rec-body {
            padding: 14px;
            display: flex;
            flex-direction: column;
            flex: 1;
        }

        .rec-price {
            font-size: 16px;
            font-weight: 800;
            color: #0052cc;
            margin-bottom: 4px;
        }

        .rec-title {
            font-size: 14px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 4px;
        }

        .rec-location {
            font-size: 12px;
            color: #6b7280;
            margin-bottom: 14px;
        }

        .rec-specs-row {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 4px;
            border-top: 1px solid #f3f4f6;
            padding-top: 10px;
            margin-bottom: 12px;
            text-align: center;
        }

        .spec-item {
            font-size: 11px;
            color: #4b5563;
        }

        .btn-rec-details {
            display: block;
            border: 1px solid #e5e7eb;
            background: #ffffff;
            color: #374151;
            text-align: center;
            padding: 7px 0;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
            text-decoration: none;
            margin-top: auto;
        }

        .btn-rec-details:hover {
            background-color: #f9fafb;
            border-color: #0052cc;
            color: #0052cc;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Top Hero Section (Matching Image) -->
    <div class="home-hero-grid">
        <!-- Left Hero Welcome Box -->
        <div class="hero-welcome-box">
     <h1 class="welcome-heading">
    <asp:Literal ID="litWelcomeHeading" runat="server"></asp:Literal>
</h1>
            <p class="welcome-desc">Find your next premium investment property.</p>

            <div class="hero-filter-card">
                <div class="filter-inputs-row">
                    <div class="filter-field">
                        <label class="filter-field-label">Location</label>
                        <asp:TextBox ID="txtHeroLoc" runat="server" Placeholder="📍 City, Region..." />
                    </div>
                    <div class="filter-field">
                        <label class="filter-field-label">Property Type</label>
                        <asp:DropDownList ID="ddlHeroType" runat="server">
                            <asp:ListItem Value="" Text="🏢 Any Type" />
                            <asp:ListItem Value="Apartment" Text="Apartment" />
                            <asp:ListItem Value="Townhouse" Text="Townhouse" />
                            <asp:ListItem Value="House" Text="House" />
                            <asp:ListItem Value="Commercial" Text="Commercial" />
                        </asp:DropDownList>
                    </div>
                    <div class="filter-field">
                        <label class="filter-field-label">Max Price</label>
                        <asp:DropDownList ID="ddlHeroPrice" runat="server">
                            <asp:ListItem Value="" Text="💵 Any Price" />
                            <asp:ListItem Value="1000000" Text="Under ₹ 10,00,000" />
                            <asp:ListItem Value="2500000" Text="Under ₹ 25,00,000" />
                            <asp:ListItem Value="5000000" Text="Under ₹ 50,00,000" />
                        </asp:DropDownList>
                    </div>
                </div>
                <asp:Button ID="btnHeroSearch" runat="server" Text="🔍 Search Properties" CssClass="btn-search-hero" OnClick="btnHeroSearch_Click" />
            </div>
        </div>

        <!-- Right Hero Featured Listing -->
        <div class="hero-featured-card">
            <div class="hero-featured-overlay"></div>
            <div class="hero-featured-content">
                <span class="featured-pill">Featured Listing</span>
                <div class="featured-title">The Glass Pavilion</div>
                <div class="featured-location">📍 Beverly Hills, CA</div>
            </div>
        </div>
    </div>

    <!-- Recommended for You Header -->
    <div class="section-header-row">
        <h2 class="section-heading-title">Recommended for You</h2>
        <a href="PropertyList.aspx" class="view-all-link">View All →</a>
    </div>

    <!-- Properties Cards (Unchanged Data) -->
    <div class="recommended-grid">
        <!-- Card 1 -->
        <div class="rec-card">
            <div class="rec-img-wrap">
                <img src="https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=600" alt="Sunset Boulevard Estate" />
                <span class="rec-badge-active">Active</span>
                <button type="button" class="rec-heart-btn">♡</button>
            </div>
            <div class="rec-body">
                <div class="rec-price">₹ 4,250,000</div>
                <div class="rec-title">Sunset Boulevard Estate</div>
                <div class="rec-location">📍 Mumbai, CA</div>
                <div class="rec-specs-row">
                    <span class="spec-item">🛏 5 Beds</span>
                    <span class="spec-item">🛁 6 Baths</span>
                    <span class="spec-item">📐 6,200 sqft</span>
                </div>
                <a href="PropertyDetails.aspx?id=1" class="btn-rec-details">View Details</a>
            </div>
        </div>

        <!-- Card 2 -->
        <div class="rec-card">
            <div class="rec-img-wrap">
                <img src="https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=600" alt="Skyline Penthouse" />
                <button type="button" class="rec-heart-btn">♡</button>
            </div>
            <div class="rec-body">
                <div class="rec-price">₹ 2,850,000</div>
                <div class="rec-title">Skyline Penthouse</div>
                <div class="rec-location">📍 Maharashtra, NY</div>
                <div class="rec-specs-row">
                    <span class="spec-item">🛏 3 Beds</span>
                    <span class="spec-item">🛁 2.5 Baths</span>
                    <span class="spec-item">📐 3,100 sqft</span>
                </div>
                <a href="PropertyDetails.aspx?id=2" class="btn-rec-details">View Details</a>
            </div>
        </div>

        <!-- Card 3 -->
        <div class="rec-card">
            <div class="rec-img-wrap">
                <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=600" alt="Palm Courtyard Villa" />
                <span class="rec-badge-offer">Under Offer</span>
                <button type="button" class="rec-heart-btn">♡</button>
            </div>
            <div class="rec-body">
                <div class="rec-price">₹ 5,100,000</div>
                <div class="rec-title">Palm Courtyard Villa</div>
                <div class="rec-location">📍 Delhi, FL</div>
                <div class="rec-specs-row">
                    <span class="spec-item">🛏 6 Beds</span>
                    <span class="spec-item">🛁 7 Baths</span>
                    <span class="spec-item">📐 8,400 sqft</span>
                </div>
                <a href="PropertyDetails.aspx?id=3" class="btn-rec-details">View Details</a>
            </div>
        </div>

        <!-- Card 4 -->
        <div class="rec-card">
            <div class="rec-img-wrap">
                <img src="https://images.unsplash.com/photo-1600566753376-12c8ab7fb75b?w=600" alt="Urban Minimalist Row" />
                <button type="button" class="rec-heart-btn">♡</button>
            </div>
            <div class="rec-body">
                <div class="rec-price">₹ 1,950,000</div>
                <div class="rec-title">Urban Minimalist Row</div>
                <div class="rec-location">📍 Kerala, TX</div>
                <div class="rec-specs-row">
                    <span class="spec-item">🛏 3 Beds</span>
                    <span class="spec-item">🛁 2.5 Baths</span>
                    <span class="spec-item">📐 2,400 sqft</span>
                </div>
                <a href="PropertyDetails.aspx?id=4" class="btn-rec-details">View Details</a>
            </div>
        </div>
    </div>
</asp:Content>
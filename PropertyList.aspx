<%@ Page Title="Properties" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="PropertyList.aspx.cs" Inherits="EstateX.PropertyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .page-header {
            margin-bottom: 24px;
        }
        .page-title {
            font-size: 28px;
            font-weight: 800;
            color: #111827;
        }

        /* Filter Panel */
        .filter-panel {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            padding: 16px 20px;
            display: flex;
            align-items: flex-end;
            gap: 16px;
            margin-bottom: 36px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
        }
        .filter-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }
        .filter-group-location {
            flex: 2;
        }
        .filter-group-select {
            flex: 1;
        }
        .filter-label {
            font-size: 11px;
            font-weight: 600;
            color: #6b7280;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .input-box {
            width: 100%;
            height: 40px;
            padding: 8px 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 14px;
            outline: none;
            box-sizing: border-box;
            background: #ffffff;
            color: #1f2937;
        }
        .input-box:focus {
            border-color: #0052cc;
        }
        .btn-filter-search {
            height: 40px;
            background-color: #0052cc;
            color: #ffffff;
            border: none;
            padding: 0 24px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            white-space: nowrap;
        }
        .btn-filter-search:hover {
            background-color: #0043a8;
        }

        /* Property Cards Grid */
        .property-catalog {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 24px;
            margin-bottom: 50px;
        }
        @media (max-width: 992px) {
            .property-catalog {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        @media (max-width: 640px) {
            .property-catalog {
                grid-template-columns: 1fr;
            }
            .filter-panel {
                flex-direction: column;
                align-items: stretch;
            }
        }

        /* Individual Card */
        .card-property {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }
        .card-img-wrap {
            position: relative;
            width: 100%;
            height: 200px;
            background-color: #f3f4f6;
        }
        .card-img-wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .heart-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            background: #ffffff;
            border: 1px solid #e5e7eb;
            width: 30px;
            height: 30px;
            border-radius: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 13px;
            color: #6b7280;
        }
        .card-body {
            padding: 16px;
            display: flex;
            flex-direction: column;
            flex: 1;
        }
        .card-top {
            display: flex;
            justify-content: space-between;
            align-items: baseline;
            margin-bottom: 6px;
        }
        .card-title {
            font-size: 16px;
            font-weight: 700;
            color: #111827;
        }
        .card-price {
            font-size: 15px;
            font-weight: 800;
            color: #0052cc;
            white-space: nowrap;
        }
        .card-location {
            font-size: 13px;
            color: #6b7280;
            margin-bottom: 12px;
        }
        .tag-row {
            display: flex;
            flex-wrap: wrap;
            gap: 6px;
            margin-bottom: 18px;
        }
        .spec-tag {
            background-color: #f3f4f6;
            color: #4b5563;
            font-size: 11px;
            font-weight: 500;
            padding: 4px 8px;
            border-radius: 4px;
        }
        .card-actions {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
            margin-top: auto;
        }
        .btn-card-inquire {
            background-color: #ffffff;
            color: #374151;
            border: 1px solid #d1d5db;
            padding: 8px 0;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
        }
        .btn-card-inquire:hover {
            background-color: #f9fafb;
        }
        .btn-card-view {
            background-color: #0052cc;
            color: #ffffff;
            border: 1px solid #0052cc;
            padding: 8px 0;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
        }
        .btn-card-view:hover {
            background-color: #0043a8;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h1 class="page-title">Explore Properties</h1>
    </div>

    <!-- Filter Bar -->
    <div class="filter-panel">
        <div class="filter-group filter-group-location">
            <label class="filter-label" for="txtLocation">Location</label>
            <asp:TextBox ID="txtLocation" runat="server" CssClass="input-box" Placeholder="Enter city or neighborhood" />
        </div>

        <div class="filter-group filter-group-select">
            <label class="filter-label" for="ddlType">Property Type</label>
            <asp:DropDownList ID="ddlType" runat="server" CssClass="input-box">
                <asp:ListItem Value="" Text="All Types" />
                <asp:ListItem Value="Apartment" Text="Apartment" />
                <asp:ListItem Value="Townhouse" Text="Townhouse" />
                <asp:ListItem Value="House" Text="House" />
                <asp:ListItem Value="Commercial" Text="Commercial" />
            </asp:DropDownList>
        </div>

        <div class="filter-group filter-group-select">
            <label class="filter-label" for="ddlPrice">Price Range</label>
            <asp:DropDownList ID="ddlPrice" runat="server" CssClass="input-box">
                <asp:ListItem Value="" Text="Any Price" />
                <asp:ListItem Value="1" Text="Under ₹ 10,00,000" />
                <asp:ListItem Value="2" Text="₹ 10,00,000 - ₹ 20,00,000" />
                <asp:ListItem Value="3" Text="Above ₹ 20,00,000" />
            </asp:DropDownList>
        </div>

        <asp:Button ID="btnSearch" runat="server" Text="🔍 Search" CssClass="btn-filter-search" OnClick="btnSearch_Click" />
    </div>

    <!-- Property Catalog List -->
    <div class="property-catalog">
        
        <!-- Card 1: The Zenith Loft -->
        <div class="card-property">
            <div class="card-img-wrap">
                <button type="button" class="heart-btn" title="Save to favorites">♡</button>
                <img src="https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=600" alt="The Zenith Loft" />
            </div>
            <div class="card-body">
                <div class="card-top">
                    <span class="card-title">The Zenith Loft</span>
                    <span class="card-price">₹ 3,450,000</span>
                </div>
                <p class="card-location">📍 Mumbai District</p>
                <div class="tag-row">
                    <span class="spec-tag">Apartment</span>
                    <span class="spec-tag">2 Beds</span>
                    <span class="spec-tag">2 Baths</span>
                </div>
                <div class="card-actions">
                    <a href="Contact.aspx?id=1&title=The+Zenith+Loft" class="btn-card-inquire">Inquire</a>
                    <a href="PropertyDetails.aspx?id=1" class="btn-card-view">View Details</a>
                </div>
            </div>
        </div>

        <!-- Card 2: Oakwood Terrace -->
        <div class="card-property">
            <div class="card-img-wrap">
                <button type="button" class="heart-btn" title="Save to favorites">♡</button>
                <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=600" alt="Oakwood Terrace" />
            </div>
            <div class="card-body">
                <div class="card-top">
                    <span class="card-title">Oakwood Terrace</span>
                    <span class="card-price">₹ 12,00,000</span>
                </div>
                <p class="card-location">📍 Ahmedabad</p>
                <div class="tag-row">
                    <span class="spec-tag">Townhouse</span>
                    <span class="spec-tag">3 Beds</span>
                    <span class="spec-tag">2.5 Baths</span>
                </div>
                <div class="card-actions">
                    <a href="Contact.aspx?id=2&title=Oakwood+Terrace" class="btn-card-inquire">Inquire</a>
                    <a href="PropertyDetails.aspx?id=2" class="btn-card-view">View Details</a>
                </div>
            </div>
        </div>

        <!-- Card 3: Maple Grove Estate -->
        <div class="card-property">
            <div class="card-img-wrap">
                <button type="button" class="heart-btn" title="Save to favorites">♡</button>
                <img src="https://images.unsplash.com/photo-1600566753376-12c8ab7fb75b?w=600" alt="Maple Grove Estate" />
            </div>
            <div class="card-body">
                <div class="card-top">
                    <span class="card-title">Maple Grove Estate</span>
                    <span class="card-price">₹ 24,00,000</span>
                </div>
                <p class="card-location">📍 Noida</p>
                <div class="tag-row">
                    <span class="spec-tag">House</span>
                    <span class="spec-tag">5 Beds</span>
                    <span class="spec-tag">4 Baths</span>
                </div>
                <div class="card-actions">
                    <a href="Contact.aspx?id=3&title=Maple+Grove+Estate" class="btn-card-inquire">Inquire</a>
                    <a href="PropertyDetails.aspx?id=3" class="btn-card-view">View Details</a>
                </div>
            </div>
        </div>

        <!-- Card 4: Innovation Hub -->
        <div class="card-property">
            <div class="card-img-wrap">
                <button type="button" class="heart-btn" title="Save to favorites">♡</button>
                <img src="https://images.unsplash.com/photo-1497366216548-37526070297c?w=600" alt="Innovation Hub" />
            </div>
            <div class="card-body">
                <div class="card-top">
                    <span class="card-title">Innovation Hub</span>
                    <span class="card-price">₹ 4,500</span>
                </div>
                <p class="card-location">📍 Rajkot District</p>
                <div class="tag-row">
                    <span class="spec-tag">Commercial</span>
                    <span class="spec-tag">500 sqft</span>
                </div>
                <div class="card-actions">
                    <a href="Contact.aspx?id=4&title=Innovation+Hub" class="btn-card-inquire">Booking</a>
                    <a href="PropertyDetails.aspx?id=4" class="btn-card-view">View Details</a>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
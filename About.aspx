<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="EstateX.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .about-section {
            padding: 40px 20px 80px 20px;
            max-width: 900px;
            margin: 0 auto;
            text-align: center;
        }

        .about-heading {
            font-size: 32px;
            font-weight: 800;
            color: #111827;
            margin-bottom: 16px;
        }

        .about-intro {
            font-size: 15px;
            line-height: 1.7;
            color: #4b5563;
            max-width: 720px;
            margin: 0 auto 50px auto;
        }

        /* Features Card Container (Centered 2-Card Layout) */
        .features-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 28px;
            max-width: 720px;
            margin: 0 auto;
        }

        @media (max-width: 680px) {
            .features-grid {
                grid-template-columns: 1fr;
            }
        }

        /* Feature Card */
        .feature-card {
            background-color: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 36px 28px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .feature-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
        }

        .feature-icon-badge {
            width: 48px;
            height: 48px;
            background-color: #0052cc;
            color: #ffffff;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            margin-bottom: 20px;
        }

        .feature-title {
            font-size: 18px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 12px;
        }

        .feature-desc {
            font-size: 13.5px;
            line-height: 1.6;
            color: #4b5563;
            margin: 0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="about-section">
        <!-- Title and Introduction Header -->
        <h1 class="about-heading">About EstateX</h1>
        <p class="about-intro">
            EstateX is your premier platform for navigating the complex real estate market. We provide data-driven insights and a streamlined experience for finding, comparing, and understanding properties in your desired locations.
        </p>

        <!-- Feature Highlights (Excluding Price Comparison) -->
        <div class="features-grid">
            <!-- Card 1: Property Search -->
            <div class="feature-card">
                <div class="feature-icon-badge">
                    <span>🔍</span>
                </div>
                <h3 class="feature-title">Property Search</h3>
                <p class="feature-desc">
                    Advanced filtering to find exact matches for your criteria quickly and efficiently.
                </p>
            </div>

            <!-- Card 2: Nearby Properties -->
            <div class="feature-card">
                <div class="feature-icon-badge">
                    <span>📍</span>
                </div>
                <h3 class="feature-title">Nearby Properties</h3>
                <p class="feature-desc">
                    Discover comparative listings in proximity to evaluate neighborhood market trends.
                </p>
            </div>
        </div>
    </div>
</asp:Content>
<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="EstateX.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>

        <section class="ef-section" aria-labelledby="aboutTitle">
            <div class="ef-container">
                <div class="ef-narrow">

                    <div class="ef-section-center">
                        <h1 id="aboutTitle">About EstateX</h1>
                        <p class="ef-lede">EstateX is your premier platform for navigating the complex real estate market. We provide data-driven insights and a streamlined experience for finding, comparing, and understanding properties in your desired locations.</p>
                    </div>

                    <div class="ef-grid-3">

                        <div class="ef-feature-card">
                            <span class="ef-feature-icon">
                                <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                    <circle cx="7" cy="7" r="4.5" />
                                    <path d="M10.5 10.5 14 14" />
                                </svg>
                            </span>
                            <h2>Property Search</h2>
                            <p>Advanced filtering to find exact matches for your criteria quickly and efficiently.</p>
                        </div>

                        <div class="ef-feature-card">
                            <span class="ef-feature-icon">
                                <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                    <path d="M2.5 5.5h11M11 3l2.5 2.5L11 8" />
                                    <path d="M13.5 10.5h-11M5 8l-2.5 2.5L5 13" />
                                </svg>
                            </span>
                            <h2>Price Comparison</h2>
                            <p>Side-by-side analysis of property values to ensure you make informed financial decisions.</p>
                        </div>

                        <div class="ef-feature-card">
                            <span class="ef-feature-icon">
                                <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                    <path d="M13 6.67C13 10.33 8 14 8 14S3 10.33 3 6.67a5 5 0 0 1 10 0z" />
                                    <circle cx="8" cy="6.67" r="1.83" />
                                </svg>
                            </span>
                            <h2>Nearby Properties</h2>
                            <p>Discover comparative listings in proximity to evaluate neighborhood market trends.</p>
                        </div>

                    </div>

                </div>
            </div>
        </section>

    </main>

</asp:Content>

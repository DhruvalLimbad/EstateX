<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EstateX._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>

        <%-- ================================================================
             Hero + property search
             ================================================================ --%>
        <section class="ef-hero" aria-labelledby="heroTitle">
            <div class="ef-container">
                <h1 id="heroTitle">Find Your Perfect Property</h1>
                <p class="ef-hero-sub">Discover premium real estate listings tailored to your lifestyle. Effortless search, precise comparisons, and detailed insights.</p>

                <div class="ef-search">

                    <div class="ef-search-grid ef-search-bar">

                        <%-- Location --%>
                        <div class="ef-search-field">
                            <svg class="ef-search-icon" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                <path d="M13 6.67C13 10.33 8 14 8 14S3 10.33 3 6.67a5 5 0 0 1 10 0z" />
                                <circle cx="8" cy="6.67" r="1.83" />
                            </svg>
                            <asp:Label ID="lblLocation" runat="server" CssClass="ef-sr-only" AssociatedControlID="txtLocation" Text="Location" />
                            <asp:TextBox ID="txtLocation" runat="server" CssClass="ef-search-input" placeholder="Location"
                                MaxLength="100" ValidationGroup="SearchValidation" />
                        </div>

                        <%-- Property type --%>
                        <div class="ef-search-field">
                            <svg class="ef-search-icon" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                <path d="M2 14h12M3 14V6.5L8 3l5 3.5V14" />
                                <path d="M6.5 14v-3.5h3V14" />
                            </svg>
                            <asp:Label ID="lblPropertyType" runat="server" CssClass="ef-sr-only" AssociatedControlID="ddlPropertyType" Text="Property type" />
                            <asp:DropDownList ID="ddlPropertyType" runat="server" CssClass="ef-search-select" ValidationGroup="SearchValidation">
                                <asp:ListItem Text="Property Type" Value="" />
                                <asp:ListItem Text="Apartment" Value="Apartment" />
                                <asp:ListItem Text="Villa" Value="Villa" />
                                <asp:ListItem Text="House" Value="House" />
                                <asp:ListItem Text="Penthouse" Value="Penthouse" />
                                <asp:ListItem Text="Plot" Value="Plot" />
                                <asp:ListItem Text="Commercial" Value="Commercial" />
                            </asp:DropDownList>
                        </div>

                        <%-- Price range --%>
                        <div class="ef-search-field">
                            <svg class="ef-search-icon" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                <path d="M8.5 2H14v5.5L7.75 13.75a1 1 0 0 1-1.41 0L2.25 9.66a1 1 0 0 1 0-1.41L8.5 2z" />
                                <circle cx="11" cy="5" r="1" />
                            </svg>
                            <asp:Label ID="lblPriceRange" runat="server" CssClass="ef-sr-only" AssociatedControlID="ddlPriceRange" Text="Price range" />
                            <asp:DropDownList ID="ddlPriceRange" runat="server" CssClass="ef-search-select" ValidationGroup="SearchValidation">
                                <%-- Values stay ASCII so the posted payload never depends on
                                     request encoding; the rupee symbol lives in the display text. --%>
                                <asp:ListItem Text="Price Range" Value="" />
                                <asp:ListItem Text="Under &#8377;50 Lakhs" Value="under-50l" />
                                <asp:ListItem Text="&#8377;50 Lakhs - &#8377;1 Crore" Value="50l-1cr" />
                                <asp:ListItem Text="&#8377;1 Crore - &#8377;2 Crore" Value="1cr-2cr" />
                                <asp:ListItem Text="&#8377;2 Crore - &#8377;5 Crore" Value="2cr-5cr" />
                                <asp:ListItem Text="Above &#8377;5 Crore" Value="above-5cr" />
                            </asp:DropDownList>
                        </div>

                        <%-- Search --%>
                        <div class="ef-search-action">
                            <asp:Button ID="btnSearch" runat="server" CssClass="ef-btn ef-btn-primary" Text="Search"
                                CausesValidation="true" ValidationGroup="SearchValidation" OnClick="btnSearch_Click" />
                        </div>

                    </div>

                    <%-- Validation messages, aligned under the field they belong to --%>
                    <div class="ef-search-grid ef-search-errors">
                        <div class="ef-search-error-cell">
                            <asp:RequiredFieldValidator ID="rfvLocation" runat="server"
                                ControlToValidate="txtLocation"
                                CssClass="field-error"
                                Display="Dynamic"
                                ValidationGroup="SearchValidation"
                                ErrorMessage="Please enter a location."
                                Text="Please enter a location." />
                            <asp:RegularExpressionValidator ID="revLocation" runat="server"
                                ControlToValidate="txtLocation"
                                CssClass="field-error"
                                Display="Dynamic"
                                ValidationGroup="SearchValidation"
                                ValidationExpression="^[\s\S]{2,100}$"
                                ErrorMessage="Location must be between 2 and 100 characters."
                                Text="Location must be between 2 and 100 characters." />
                            <asp:CustomValidator ID="cvLocation" runat="server"
                                ControlToValidate="txtLocation"
                                CssClass="field-error"
                                Display="Dynamic"
                                ValidationGroup="SearchValidation"
                                ClientValidationFunction="validateLocation"
                                OnServerValidate="cvLocation_ServerValidate"
                                ErrorMessage="Location cannot be only spaces."
                                Text="Location cannot be only spaces." />
                        </div>
                        <div class="ef-search-error-cell">
                            <asp:RequiredFieldValidator ID="rfvPropertyType" runat="server"
                                ControlToValidate="ddlPropertyType"
                                InitialValue=""
                                CssClass="field-error"
                                Display="Dynamic"
                                ValidationGroup="SearchValidation"
                                ErrorMessage="Please select a property type."
                                Text="Please select a property type." />
                        </div>
                        <div class="ef-search-error-cell">
                            <asp:RequiredFieldValidator ID="rfvPriceRange" runat="server"
                                ControlToValidate="ddlPriceRange"
                                InitialValue=""
                                CssClass="field-error"
                                Display="Dynamic"
                                ValidationGroup="SearchValidation"
                                ErrorMessage="Please select a price range."
                                Text="Please select a price range." />
                        </div>
                        <div></div>
                    </div>

                    <asp:ValidationSummary ID="vsSearch" runat="server"
                        ValidationGroup="SearchValidation"
                        HeaderText=""
                        ShowSummary="true"
                        ShowMessageBox="false"
                        CssClass="validation-summary" />

                    <asp:Panel ID="pnlSearchResult" runat="server" CssClass="ef-search-result" Visible="false">
                        <asp:Literal ID="litSearchResult" runat="server" Mode="PassThrough" />
                    </asp:Panel>

                </div>
            </div>
        </section>

        <%-- ================================================================
             Featured properties
             ================================================================ --%>
        <section class="ef-section" aria-labelledby="featuredTitle">
            <div class="ef-container">
                <div class="ef-section-head">
                    <div>
                        <h2 id="featuredTitle">Featured Properties</h2>
                        <p>Handpicked selections for modern living.</p>
                    </div>
                    <a class="ef-section-link" href="<%= ResolveUrl("~/Properties") %>">View All &rarr;</a>
                </div>

                <div class="ef-grid-3">

                    <article class="ef-property-card">
                        <div class="ef-property-media">
                            <img class="ef-property-img" src="<%= ResolveUrl("~/Images/azure-residences.jpg") %>"
                                alt="Living room at The Azure Residences" width="800" height="400" />
                            <span class="ef-property-badge">Apartment</span>
                        </div>
                        <div class="ef-property-body">
                            <div class="ef-property-top">
                                <h3 class="ef-property-title">The Azure Residences</h3>
                                <span class="ef-property-price">&#8377; 850,000</span>
                            </div>
                            <p class="ef-property-meta">
                                <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                    <path d="M13 6.67C13 10.33 8 14 8 14S3 10.33 3 6.67a5 5 0 0 1 10 0z" />
                                    <circle cx="8" cy="6.67" r="1.83" />
                                </svg>
                                Downtown Core, Metro City
                            </p>
                            <a class="ef-btn ef-btn-outline ef-btn-block" href="<%= ResolveUrl("~/PropertyDetail") %>">View Details</a>
                        </div>
                    </article>

                    <article class="ef-property-card">
                        <div class="ef-property-media">
                            <img class="ef-property-img" src="<%= ResolveUrl("~/Images/oakwood-home.jpg") %>"
                                alt="Exterior of Oakwood Family Home" width="800" height="400" />
                            <span class="ef-property-badge">House</span>
                        </div>
                        <div class="ef-property-body">
                            <div class="ef-property-top">
                                <h3 class="ef-property-title">Oakwood Family Home</h3>
                                <span class="ef-property-price">&#8377; 1,200,000</span>
                            </div>
                            <p class="ef-property-meta">
                                <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                    <path d="M13 6.67C13 10.33 8 14 8 14S3 10.33 3 6.67a5 5 0 0 1 10 0z" />
                                    <circle cx="8" cy="6.67" r="1.83" />
                                </svg>
                                Westside Suburbs, Metro City
                            </p>
                            <a class="ef-btn ef-btn-outline ef-btn-block" href="<%= ResolveUrl("~/PropertyDetail") %>">View Details</a>
                        </div>
                    </article>

                    <article class="ef-property-card">
                        <div class="ef-property-media">
                            <img class="ef-property-img" src="<%= ResolveUrl("~/Images/skyline-penthouse.jpg") %>"
                                alt="City skyline view from Skyline Penthouse" width="800" height="400" />
                            <span class="ef-property-badge">Condo</span>
                        </div>
                        <div class="ef-property-body">
                            <div class="ef-property-top">
                                <h3 class="ef-property-title">Skyline Penthouse</h3>
                                <span class="ef-property-price">&#8377; 2,150,000</span>
                            </div>
                            <p class="ef-property-meta">
                                <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                    <path d="M13 6.67C13 10.33 8 14 8 14S3 10.33 3 6.67a5 5 0 0 1 10 0z" />
                                    <circle cx="8" cy="6.67" r="1.83" />
                                </svg>
                                Financial District, Metro City
                            </p>
                            <a class="ef-btn ef-btn-outline ef-btn-block" href="<%= ResolveUrl("~/PropertyDetail") %>">View Details</a>
                        </div>
                    </article>

                </div>
            </div>
        </section>

        <%-- ================================================================
             Why choose EstateX
             ================================================================ --%>
        <section class="ef-section ef-section-soft" aria-labelledby="whyTitle">
            <div class="ef-container">
                <div class="ef-section-center">
                    <h2 id="whyTitle">Why Choose EstateX</h2>
                    <p>A systematic approach for finding your next home.</p>
                </div>

                <div class="ef-grid-3">

                    <div class="ef-feature-card">
                        <span class="ef-feature-icon">
                            <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                <circle cx="7" cy="7" r="4.5" />
                                <path d="M10.5 10.5 14 14" />
                            </svg>
                        </span>
                        <h3>Easy Property Search</h3>
                        <p>Our advanced filtering system allows you to pinpoint exactly what you need with academic precision.</p>
                    </div>

                    <div class="ef-feature-card">
                        <span class="ef-feature-icon">
                            <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                <path d="M4 13V7M8 13V3M12 13v-4" />
                            </svg>
                        </span>
                        <h3>Price Comparison</h3>
                        <p>Analyse market trends and compare property values side-by-side in clean, structured data tables.</p>
                    </div>

                    <div class="ef-feature-card">
                        <span class="ef-feature-icon">
                            <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                <circle cx="8" cy="8" r="5.5" />
                                <circle cx="8" cy="8" r="1.5" />
                                <path d="M8 1v1.5M8 13.5V15M15 8h-1.5M2.5 8H1" />
                            </svg>
                        </span>
                        <h3>Nearby Property Finder</h3>
                        <p>Discover context about neighbourhoods, amenities, and transit options with our integrated mapping tools.</p>
                    </div>

                </div>
            </div>
        </section>

        <%-- ================================================================
             Call to action
             ================================================================ --%>
        <section class="ef-cta" aria-labelledby="ctaTitle">
            <h2 id="ctaTitle">Looking for your next property?</h2>
            <p>Start your systematic search today and uncover the best real estate opportunities on the market.</p>
            <div class="ef-cta-actions">
                <a class="ef-btn ef-btn-white" href="<%= ResolveUrl("~/Properties") %>">Explore Properties</a>
                <a class="ef-btn ef-btn-ghost" href="<%= ResolveUrl("~/Register") %>">Create Account</a>
            </div>
        </section>

    </main>

    <script type="text/javascript">
        // Client-side counterpart of cvLocation_ServerValidate: the location must
        // hold at least two non-whitespace characters.
        function validateLocation(source, args) {
            var value = args.Value == null ? "" : args.Value;
            var trimmed = value.replace(/^\s+|\s+$/g, "");
            args.IsValid = trimmed.length >= 2 && trimmed.length <= 100;
        }
    </script>

</asp:Content>

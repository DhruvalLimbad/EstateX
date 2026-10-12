<%@ Page Title="Properties" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Properties.aspx.cs" Inherits="EstateX.Properties" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>

        <%-- ================================================================
             Page heading + filter bar
             ================================================================ --%>
        <section class="ef-section" aria-labelledby="exploreTitle">
            <div class="ef-container">

                <div class="ef-page-head">
                    <h1 id="exploreTitle">Explore Properties</h1>
                </div>

                <div class="ef-filter">

                    <div class="ef-filter-grid">

                        <%-- Location --%>
                        <div class="ef-filter-field">
                            <asp:Label ID="lblLocation" runat="server" CssClass="ef-filter-label" AssociatedControlID="txtLocation" Text="Location" />
                            <div class="ef-filter-control">
                                <svg class="ef-filter-icon" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                    <path d="M13 6.67C13 10.33 8 14 8 14S3 10.33 3 6.67a5 5 0 0 1 10 0z" />
                                    <circle cx="8" cy="6.67" r="1.83" />
                                </svg>
                                <asp:TextBox ID="txtLocation" runat="server" CssClass="ef-filter-input" placeholder="Enter city or neighborhood"
                                    MaxLength="100" ValidationGroup="FilterValidation" />
                            </div>
                        </div>

                        <%-- Property type --%>
                        <div class="ef-filter-field">
                            <asp:Label ID="lblPropertyType" runat="server" CssClass="ef-filter-label" AssociatedControlID="ddlPropertyType" Text="Property Type" />
                            <div class="ef-filter-control">
                                <asp:DropDownList ID="ddlPropertyType" runat="server" CssClass="ef-filter-select" ValidationGroup="FilterValidation">
                                    <asp:ListItem Text="All Types" Value="" />
                                    <asp:ListItem Text="Apartment" Value="Apartment" />
                                    <asp:ListItem Text="Townhouse" Value="Townhouse" />
                                    <asp:ListItem Text="Villa" Value="Villa" />
                                    <asp:ListItem Text="House" Value="House" />
                                    <asp:ListItem Text="Penthouse" Value="Penthouse" />
                                    <asp:ListItem Text="Plot" Value="Plot" />
                                    <asp:ListItem Text="Commercial" Value="Commercial" />
                                </asp:DropDownList>
                            </div>
                        </div>

                        <%-- Price range --%>
                        <div class="ef-filter-field">
                            <asp:Label ID="lblPriceRange" runat="server" CssClass="ef-filter-label" AssociatedControlID="ddlPriceRange" Text="Price Range" />
                            <div class="ef-filter-control">
                                <%-- Values stay ASCII so the posted payload never depends on
                                     request encoding; the rupee symbol lives in the display text. --%>
                                <asp:DropDownList ID="ddlPriceRange" runat="server" CssClass="ef-filter-select" ValidationGroup="FilterValidation">
                                    <asp:ListItem Text="Any Price" Value="" />
                                    <asp:ListItem Text="Under &#8377;50 Lakhs" Value="under-50l" />
                                    <asp:ListItem Text="&#8377;50 Lakhs - &#8377;1 Crore" Value="50l-1cr" />
                                    <asp:ListItem Text="&#8377;1 Crore - &#8377;2 Crore" Value="1cr-2cr" />
                                    <asp:ListItem Text="&#8377;2 Crore - &#8377;5 Crore" Value="2cr-5cr" />
                                    <asp:ListItem Text="Above &#8377;5 Crore" Value="above-5cr" />
                                </asp:DropDownList>
                            </div>
                        </div>

                        <%-- Search --%>
                        <div class="ef-filter-action">
                            <asp:Button ID="btnSearch" runat="server" CssClass="ef-btn ef-btn-primary" Text="Search"
                                CausesValidation="true" ValidationGroup="FilterValidation" OnClick="btnSearch_Click" />
                        </div>

                    </div>

                    <%-- Every filter here is optional - "All Types" and "Any Price" are
                         valid answers - so the only rule is on a location that was
                         actually typed. --%>
                    <div class="ef-filter-errors">
                        <asp:CustomValidator ID="cvLocation" runat="server"
                            ControlToValidate="txtLocation"
                            CssClass="field-error"
                            Display="Dynamic"
                            ValidationGroup="FilterValidation"
                            ClientValidationFunction="validateFilterLocation"
                            OnServerValidate="cvLocation_ServerValidate"
                            ErrorMessage="Location must be between 2 and 100 characters."
                            Text="Location must be between 2 and 100 characters." />
                    </div>

                    <asp:Panel ID="pnlSearchResult" runat="server" CssClass="ef-search-result" Visible="false">
                        <asp:Literal ID="litSearchResult" runat="server" Mode="PassThrough" />
                    </asp:Panel>

                </div>

            </div>
        </section>

        <%-- ================================================================
             Listings
             ================================================================ --%>
        <section class="ef-section ef-section-flush" aria-label="Property listings">
            <div class="ef-container">
                <div class="ef-grid-3">

                    <article class="ef-property-card">
                        <div class="ef-property-media">
                            <img class="ef-property-img" src="<%= ResolveUrl("~/Images/azure-residences.jpg") %>"
                                alt="Living room at The Zenith Loft" width="800" height="400" />
                            <button type="button" class="ef-fav" aria-pressed="false" aria-label="Save The Zenith Loft">
                                <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                    <path d="M8 13.5S2.5 10.2 2.5 6.4A2.9 2.9 0 0 1 8 5a2.9 2.9 0 0 1 5.5 1.4c0 3.8-5.5 7.1-5.5 7.1z" />
                                </svg>
                            </button>
                        </div>
                        <div class="ef-property-body">
                            <div class="ef-property-top">
                                <h2 class="ef-property-title">The Zenith Loft</h2>
                                <span class="ef-property-price">&#8377; 3,450,000</span>
                            </div>
                            <p class="ef-property-meta">
                                <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                    <path d="M13 6.67C13 10.33 8 14 8 14S3 10.33 3 6.67a5 5 0 0 1 10 0z" />
                                    <circle cx="8" cy="6.67" r="1.83" />
                                </svg>
                                Mumbai District
                            </p>
                            <ul class="ef-chips">
                                <li class="ef-chip">Apartment</li>
                                <li class="ef-chip">2 Beds</li>
                                <li class="ef-chip">2 Baths</li>
                            </ul>
                            <div class="ef-property-actions">
                                <a class="ef-btn ef-btn-outline" href="<%= ResolveUrl("~/Contact") %>">Inquire</a>
                                <a class="ef-btn ef-btn-primary" href="<%= ResolveUrl("~/PropertyDetail") %>">View Details</a>
                            </div>
                        </div>
                    </article>

                    <article class="ef-property-card">
                        <div class="ef-property-media">
                            <img class="ef-property-img" src="<%= ResolveUrl("~/Images/oakwood-home.jpg") %>"
                                alt="Exterior of Oakwood Terrace" width="800" height="400" />
                            <button type="button" class="ef-fav" aria-pressed="false" aria-label="Save Oakwood Terrace">
                                <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                    <path d="M8 13.5S2.5 10.2 2.5 6.4A2.9 2.9 0 0 1 8 5a2.9 2.9 0 0 1 5.5 1.4c0 3.8-5.5 7.1-5.5 7.1z" />
                                </svg>
                            </button>
                        </div>
                        <div class="ef-property-body">
                            <div class="ef-property-top">
                                <h2 class="ef-property-title">Oakwood Terrace</h2>
                                <span class="ef-property-price">&#8377; 12,00,000</span>
                            </div>
                            <p class="ef-property-meta">
                                <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                    <path d="M13 6.67C13 10.33 8 14 8 14S3 10.33 3 6.67a5 5 0 0 1 10 0z" />
                                    <circle cx="8" cy="6.67" r="1.83" />
                                </svg>
                                Ahmedabad
                            </p>
                            <ul class="ef-chips">
                                <li class="ef-chip">Townhouse</li>
                                <li class="ef-chip">3 Beds</li>
                                <li class="ef-chip">2.5 Baths</li>
                            </ul>
                            <div class="ef-property-actions">
                                <a class="ef-btn ef-btn-outline" href="<%= ResolveUrl("~/Contact") %>">Inquire</a>
                                <a class="ef-btn ef-btn-primary" href="<%= ResolveUrl("~/PropertyDetail") %>">View Details</a>
                            </div>
                        </div>
                    </article>

                    <article class="ef-property-card">
                        <div class="ef-property-media">
                            <img class="ef-property-img" src="<%= ResolveUrl("~/Images/skyline-penthouse.jpg") %>"
                                alt="Kitchen and dining area at Maple Grove Estate" width="800" height="400" />
                            <button type="button" class="ef-fav" aria-pressed="false" aria-label="Save Maple Grove Estate">
                                <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                    <path d="M8 13.5S2.5 10.2 2.5 6.4A2.9 2.9 0 0 1 8 5a2.9 2.9 0 0 1 5.5 1.4c0 3.8-5.5 7.1-5.5 7.1z" />
                                </svg>
                            </button>
                        </div>
                        <div class="ef-property-body">
                            <div class="ef-property-top">
                                <h2 class="ef-property-title">Maple Grove Estate</h2>
                                <span class="ef-property-price">&#8377; 24,00,000</span>
                            </div>
                            <p class="ef-property-meta">
                                <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                    <path d="M13 6.67C13 10.33 8 14 8 14S3 10.33 3 6.67a5 5 0 0 1 10 0z" />
                                    <circle cx="8" cy="6.67" r="1.83" />
                                </svg>
                                Noida
                            </p>
                            <ul class="ef-chips">
                                <li class="ef-chip">House</li>
                                <li class="ef-chip">5 Beds</li>
                                <li class="ef-chip">4 Baths</li>
                            </ul>
                            <div class="ef-property-actions">
                                <a class="ef-btn ef-btn-outline" href="<%= ResolveUrl("~/Contact") %>">Inquire</a>
                                <a class="ef-btn ef-btn-primary" href="<%= ResolveUrl("~/PropertyDetail") %>">View Details</a>
                            </div>
                        </div>
                    </article>

                    <article class="ef-property-card">
                        <%-- No photograph for this listing yet; the placeholder keeps the
                             card the same height as the ones that do have one. --%>
                        <div class="ef-property-media is-empty">
                            <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                <path d="M2.5 14h11M4 14V3h5v11M9 14V6.5h3V14" />
                                <path d="M5.5 5.5h2M5.5 8h2M5.5 10.5h2" />
                            </svg>
                            <button type="button" class="ef-fav" aria-pressed="false" aria-label="Save Innovation Hub">
                                <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                    <path d="M8 13.5S2.5 10.2 2.5 6.4A2.9 2.9 0 0 1 8 5a2.9 2.9 0 0 1 5.5 1.4c0 3.8-5.5 7.1-5.5 7.1z" />
                                </svg>
                            </button>
                        </div>
                        <div class="ef-property-body">
                            <div class="ef-property-top">
                                <h2 class="ef-property-title">Innovation Hub</h2>
                                <span class="ef-property-price">&#8377; 4500</span>
                            </div>
                            <p class="ef-property-meta">
                                <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                    <path d="M13 6.67C13 10.33 8 14 8 14S3 10.33 3 6.67a5 5 0 0 1 10 0z" />
                                    <circle cx="8" cy="6.67" r="1.83" />
                                </svg>
                                Rajkot District
                            </p>
                            <ul class="ef-chips">
                                <li class="ef-chip">Commercial</li>
                                <li class="ef-chip">5000 sqft</li>
                            </ul>
                            <div class="ef-property-actions">
                                <a class="ef-btn ef-btn-outline" href="<%= ResolveUrl("~/Contact") %>">Booking</a>
                                <a class="ef-btn ef-btn-primary" href="<%= ResolveUrl("~/PropertyDetail") %>">View Details</a>
                            </div>
                        </div>
                    </article>

                </div>
            </div>
        </section>

    </main>

    <script type="text/javascript">
        // Client-side counterpart of cvLocation_ServerValidate. An empty box means
        // "no location filter", so only a value that was actually typed is checked.
        function validateFilterLocation(source, args) {
            var value = args.Value == null ? "" : args.Value;
            var trimmed = value.replace(/^\s+|\s+$/g, "");
            args.IsValid = trimmed.length === 0 || (trimmed.length >= 2 && trimmed.length <= 100);
        }

        // The heart is a shortlist marker only; nothing is persisted yet, so it
        // reflects its own pressed state instead of posting back.
        (function () {
            var buttons = document.querySelectorAll(".ef-fav");

            for (var i = 0; i < buttons.length; i++) {
                buttons[i].onclick = function () {
                    var pressed = this.getAttribute("aria-pressed") === "true";
                    this.setAttribute("aria-pressed", pressed ? "false" : "true");
                };
            }
        })();
    </script>

</asp:Content>

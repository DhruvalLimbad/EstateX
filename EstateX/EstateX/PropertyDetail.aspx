<%@ Page Title="Modern Penthouse Suite" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PropertyDetail.aspx.cs" Inherits="EstateX.PropertyDetail" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>

        <section class="ef-section">
            <div class="ef-container">

                <nav class="ef-crumbs" aria-label="Breadcrumb">
                    <ol>
                        <li><a href="<%= ResolveUrl("~/Properties") %>">Properties</a></li>
                        <li aria-current="page">Modern Penthouse Suite</li>
                    </ol>
                </nav>

                <div class="ef-detail-grid">

                    <%-- ====================================================
                         Main column
                         ==================================================== --%>
                    <div class="ef-detail-main">

                        <div class="ef-panel">
                            <div class="ef-panel-head">
                                <h2 class="ef-panel-title">Property Details</h2>
                                <div class="ef-panel-tools">
                                    <a class="ef-tool" href="<%= ResolveUrl("~/Properties") %>" aria-label="Back to all properties" title="Back to all properties">
                                        <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                            <path d="M2.5 7.2 8 3l5.5 4.2V13a.8.8 0 0 1-.8.8H3.3a.8.8 0 0 1-.8-.8z" />
                                            <path d="M6.5 13.8V9.5h3v4.3" />
                                        </svg>
                                    </a>
                                    <a class="ef-tool" href="<%= ResolveUrl("~/Images/azure-residences.jpg") %>" target="_blank" rel="noopener" aria-label="View the photo full size" title="View the photo full size">
                                        <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                            <circle cx="7" cy="7" r="4.3" />
                                            <path d="M10.3 10.3 13.5 13.5" />
                                        </svg>
                                    </a>
                                    <a class="ef-tool" href="mailto:?subject=Modern%20Penthouse%20Suite%20on%20EstateX&amp;body=I%20thought%20you%20might%20like%20this%20listing." aria-label="Share this listing by email" title="Share this listing by email">
                                        <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                            <path d="M6.5 3H3.4A1.4 1.4 0 0 0 2 4.4v8.2A1.4 1.4 0 0 0 3.4 14h8.2a1.4 1.4 0 0 0 1.4-1.4V9.5" />
                                            <path d="M9.5 2.5H14v4.5M14 2.5 7.8 8.7" />
                                        </svg>
                                    </a>
                                    <button type="button" class="ef-tool ef-fav-tool" aria-pressed="false" aria-label="Save Modern Penthouse Suite" title="Save this listing">
                                        <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                            <path d="M8 13.5S2.5 10.2 2.5 6.4A2.9 2.9 0 0 1 8 5a2.9 2.9 0 0 1 5.5 1.4c0 3.8-5.5 7.1-5.5 7.1z" />
                                        </svg>
                                    </button>
                                </div>
                            </div>

                            <div class="ef-detail-media">
                                <img class="ef-detail-img" src="<%= ResolveUrl("~/Images/azure-residences.jpg") %>"
                                    alt="Open-plan living area of the Modern Penthouse Suite" width="800" height="400" />
                                <a class="ef-photo-btn" href="<%= ResolveUrl("~/Images/azure-residences.jpg") %>" target="_blank" rel="noopener">
                                    <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                        <path d="M2.5 5.5h2.2l.9-1.4h4.8l.9 1.4h2.2v7.2h-11z" />
                                        <circle cx="8" cy="9" r="2.1" />
                                    </svg>
                                    View 12 Photos
                                </a>
                            </div>
                        </div>

                        <div class="ef-detail-headline">
                            <h1 class="ef-detail-title">Modern Penthouse Suite</h1>
                            <p class="ef-detail-price-wrap">
                                <span class="ef-detail-price">&#8377; 3,450,000</span>
                                <span class="ef-detail-price-note">Est. &#8377;18,200/mo</span>
                            </p>
                        </div>

                        <p class="ef-property-meta">
                            <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                <path d="M13 6.67C13 10.33 8 14 8 14S3 10.33 3 6.67a5 5 0 0 1 10 0z" />
                                <circle cx="8" cy="6.67" r="1.83" />
                            </svg>
                            Mumbai District
                        </p>

                        <hr class="ef-rule" />

                        <dl class="ef-specs">
                            <div class="ef-spec">
                                <dt class="ef-spec-label">Property Type</dt>
                                <dd class="ef-spec-value">
                                    <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                        <path d="M2.5 7.2 8 3l5.5 4.2V13a.8.8 0 0 1-.8.8H3.3a.8.8 0 0 1-.8-.8z" />
                                        <path d="M6.5 13.8V9.5h3v4.3" />
                                    </svg>
                                    Condominium
                                </dd>
                            </div>
                            <div class="ef-spec">
                                <dt class="ef-spec-label">Area</dt>
                                <dd class="ef-spec-value">
                                    <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                        <path d="M3 9.5V13h3.5M13 6.5V3H9.5M3.2 12.8 12.8 3.2" />
                                    </svg>
                                    2,450 sqft
                                </dd>
                            </div>
                            <div class="ef-spec">
                                <dt class="ef-spec-label">Bedrooms</dt>
                                <dd class="ef-spec-value">
                                    <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                        <path d="M2.3 12.5V5M2.3 9h11.4v3.5M13.7 9a2.4 2.4 0 0 0-2.4-2.4H7.2V9" />
                                    </svg>
                                    3 Beds
                                </dd>
                            </div>
                            <div class="ef-spec">
                                <dt class="ef-spec-label">Bathrooms</dt>
                                <dd class="ef-spec-value">
                                    <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                        <path d="M2.3 8.6h11.4v1.5a3 3 0 0 1-3 3H5.3a3 3 0 0 1-3-3z" />
                                        <path d="M4.6 8.6V4.3a1.5 1.5 0 0 1 3 0" />
                                    </svg>
                                    3.5 Baths
                                </dd>
                            </div>
                        </dl>

                        <div class="ef-detail-block">
                            <h2 class="ef-detail-h2">Description</h2>
                            <p>Experience unparalleled luxury in this stunning full-floor penthouse located in the heart of the Financial District. Boasting panoramic views of the city skyline and harbor, this meticulously designed residence offers a perfect blend of modern elegance and functional living.</p>
                            <p>The expansive open-concept living area features 11-foot ceilings, custom wide-plank oak flooring, and floor-to-ceiling smart glass windows. The chef&rsquo;s kitchen is equipped with top-of-the-line Gaggenau appliances, custom Italian cabinetry, and a massive Calacatta marble island.</p>
                        </div>

                        <div class="ef-detail-block">
                            <h2 class="ef-detail-h2">Features &amp; Amenities</h2>
                            <ul class="ef-amenities">
                                <li>
                                    <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                        <circle cx="8" cy="8" r="5.8" />
                                        <path d="M5.6 8.2 7.3 9.9l3.1-3.6" />
                                    </svg>
                                    24/7 Doorman &amp; Concierge
                                </li>
                                <li>
                                    <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                        <circle cx="8" cy="8" r="5.8" />
                                        <path d="M5.6 8.2 7.3 9.9l3.1-3.6" />
                                    </svg>
                                    Private Elevator Landing
                                </li>
                                <li>
                                    <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                        <circle cx="8" cy="8" r="5.8" />
                                        <path d="M5.6 8.2 7.3 9.9l3.1-3.6" />
                                    </svg>
                                    Smart Home System
                                </li>
                                <li>
                                    <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                        <circle cx="8" cy="8" r="5.8" />
                                        <path d="M5.6 8.2 7.3 9.9l3.1-3.6" />
                                    </svg>
                                    Rooftop Terrace Access
                                </li>
                                <li>
                                    <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                        <circle cx="8" cy="8" r="5.8" />
                                        <path d="M5.6 8.2 7.3 9.9l3.1-3.6" />
                                    </svg>
                                    Fitness Center &amp; Spa
                                </li>
                                <li>
                                    <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                        <circle cx="8" cy="8" r="5.8" />
                                        <path d="M5.6 8.2 7.3 9.9l3.1-3.6" />
                                    </svg>
                                    Wine Cellar
                                </li>
                            </ul>
                        </div>

                    </div>

                    <%-- ====================================================
                         Sidebar
                         ==================================================== --%>
                    <aside class="ef-detail-side">

                        <div class="ef-side-card">
                            <h2 class="ef-side-head">Listing Agent</h2>
                            <div class="ef-side-body ef-agent">
                                <%-- No portrait on file yet, so the initials stand in for one.
                                     Drop the photo in and swap this for an <img> inside the
                                     same span; the frame already crops and rounds it. --%>
                                <span class="ef-agent-avatar" aria-hidden="true">RM</span>
                                <div>
                                    <p class="ef-agent-name">Riya Mehta</p>
                                    <p class="ef-agent-role">Senior Associate Broker</p>
                                    <p class="ef-agent-rating">
                                        <svg viewBox="0 0 16 16" fill="currentColor" aria-hidden="true" focusable="false">
                                            <path d="M8 2.2l1.73 3.5 3.87.56-2.8 2.73.66 3.85L8 11.02l-3.46 1.82.66-3.85-2.8-2.73 3.87-.56z" />
                                        </svg>
                                        4.9 <span>(124 reviews)</span>
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="ef-side-card">
                            <h2 class="ef-side-head">Take Action</h2>
                            <div class="ef-side-body">

                                <p class="ef-notice">
                                    <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                        <circle cx="8" cy="8" r="5.8" />
                                        <path d="M8 7.4v3.2M8 5.3v.1" />
                                    </svg>
                                    <span>Login to continue with booking and inquiries.</span>
                                </p>

                                <%-- Booking and inquiries need a signed-in member, and no
                                     membership store is wired up yet, so both stay disabled.
                                     The wishlist is a local shortlist marker, so it does not. --%>
                                <div class="ef-btn-stack">
                                    <button type="button" class="ef-btn ef-btn-muted" disabled="disabled">
                                        <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                            <path d="M2.8 4.3h10.4v9.2H2.8z" />
                                            <path d="M2.8 6.8h10.4M5.5 2.5v2.6M10.5 2.5v2.6" />
                                        </svg>
                                        Book Visit
                                    </button>
                                    <button type="button" class="ef-btn ef-btn-muted" disabled="disabled">
                                        <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                            <path d="M2.5 4h11v8h-11z" />
                                            <path d="M2.5 4.4 8 8.8l5.5-4.4" />
                                        </svg>
                                        Send Inquiry
                                    </button>
                                    <button type="button" class="ef-btn ef-btn-soft-primary ef-wishlist" aria-pressed="false">
                                        <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                            <path d="M8 13.5S2.5 10.2 2.5 6.4A2.9 2.9 0 0 1 8 5a2.9 2.9 0 0 1 5.5 1.4c0 3.8-5.5 7.1-5.5 7.1z" />
                                        </svg>
                                        <span class="ef-wishlist-label">Add to Wishlist</span>
                                    </button>
                                </div>

                            </div>
                        </div>

                    </aside>

                </div>

            </div>
        </section>

    </main>

    <script type="text/javascript">
        // Both hearts are shortlist markers only; nothing is persisted yet, so
        // they reflect their own pressed state instead of posting back.
        (function () {
            var toggles = document.querySelectorAll(".ef-fav-tool, .ef-wishlist");

            for (var i = 0; i < toggles.length; i++) {
                toggles[i].onclick = function () {
                    var pressed = this.getAttribute("aria-pressed") === "true";
                    this.setAttribute("aria-pressed", pressed ? "false" : "true");

                    var label = this.querySelector(".ef-wishlist-label");

                    if (label) {
                        label.firstChild.nodeValue = pressed ? "Add to Wishlist" : "Saved to Wishlist";
                    }
                };
            }
        })();
    </script>

</asp:Content>

<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="EstateX.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>

        <section class="ef-section" aria-labelledby="contactTitle">
            <div class="ef-container">

                <div class="ef-page-head">
                    <h1 id="contactTitle">Get in Touch</h1>
                    <p>We&rsquo;re here to help with your real estate needs. Reach out to our team of experts for personalized assistance.</p>
                </div>

                <div class="ef-contact-grid">

                    <%-- ====================================================
                         Ways to reach us
                         ==================================================== --%>
                    <div class="ef-contact-list">

                        <div class="ef-contact-card">
                            <div class="ef-contact-head">
                                <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                    <path d="M2.5 4h11v8h-11z" />
                                    <path d="M2.5 4.4 8 8.8l5.5-4.4" />
                                </svg>
                                <h2>Email Us</h2>
                            </div>
                            <p class="ef-contact-note">For general inquiries and support.</p>
                            <p class="ef-contact-value"><a href="mailto:support@estatex.com">support@estatex.com</a></p>
                        </div>

                        <div class="ef-contact-card">
                            <div class="ef-contact-head">
                                <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                    <path d="M5.6 2.8 7 5.3 5.6 6.8a8.2 8.2 0 0 0 3.6 3.6l1.5-1.4 2.5 1.4v2.2a1 1 0 0 1-1.1 1A11 11 0 0 1 2.4 3.9a1 1 0 0 1 1-1.1z" />
                                </svg>
                                <h2>Call Us</h2>
                            </div>
                            <p class="ef-contact-note">Mon-Fri from 8am to 5pm.</p>
                            <p class="ef-contact-value"><a href="tel:+919106536420">+91 9106536420</a></p>
                        </div>

                        <div class="ef-contact-card">
                            <div class="ef-contact-head">
                                <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                    <path d="M13 6.67C13 10.33 8 14 8 14S3 10.33 3 6.67a5 5 0 0 1 10 0z" />
                                    <circle cx="8" cy="6.67" r="1.83" />
                                </svg>
                                <h2>Office</h2>
                            </div>
                            <p class="ef-contact-note">Visit our headquarters.</p>
                            <address class="ef-contact-address">
                                123 Enterprise Way<br />
                                Suite 400<br />
                                Mumbai, CA 94105
                            </address>
                        </div>

                    </div>

                    <%-- ====================================================
                         Message form
                         ==================================================== --%>
                    <div class="ef-form-card">

                        <asp:Panel ID="pnlContactResult" runat="server" CssClass="ef-alert-success" Visible="false">
                            <asp:Literal ID="litContactResult" runat="server" Mode="PassThrough" />
                        </asp:Panel>

                        <div class="ef-form-grid">

                            <div class="ef-field">
                                <asp:Label ID="lblFullName" runat="server" CssClass="ef-label" AssociatedControlID="txtFullName" Text="Full Name" />
                                <asp:TextBox ID="txtFullName" runat="server" CssClass="ef-input"
                                    MaxLength="100" placeholder="Your full name" ValidationGroup="ContactValidation" />
                                <asp:RequiredFieldValidator ID="rfvFullName" runat="server"
                                    ControlToValidate="txtFullName"
                                    CssClass="field-error"
                                    Display="Dynamic"
                                    ValidationGroup="ContactValidation"
                                    ErrorMessage="Please enter your full name."
                                    Text="Please enter your full name." />
                                <asp:RegularExpressionValidator ID="revFullName" runat="server"
                                    ControlToValidate="txtFullName"
                                    CssClass="field-error"
                                    Display="Dynamic"
                                    ValidationGroup="ContactValidation"
                                    ValidationExpression="^[A-Za-z][A-Za-z .'-]{1,99}$"
                                    ErrorMessage="Full name must be 2 to 100 letters."
                                    Text="Full name must be 2 to 100 letters." />
                            </div>

                            <div class="ef-field">
                                <asp:Label ID="lblEmail" runat="server" CssClass="ef-label" AssociatedControlID="txtEmail" Text="Email Address" />
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="ef-input" TextMode="Email"
                                    MaxLength="254" placeholder="you@example.com" ValidationGroup="ContactValidation" />
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                                    ControlToValidate="txtEmail"
                                    CssClass="field-error"
                                    Display="Dynamic"
                                    ValidationGroup="ContactValidation"
                                    ErrorMessage="Please enter your email."
                                    Text="Please enter your email." />
                                <asp:RegularExpressionValidator ID="revEmail" runat="server"
                                    ControlToValidate="txtEmail"
                                    CssClass="field-error"
                                    Display="Dynamic"
                                    ValidationGroup="ContactValidation"
                                    ValidationExpression="^[A-Za-z0-9!#$%&amp;'*+/=?^_`{|}~-]+(?:\.[A-Za-z0-9!#$%&amp;'*+/=?^_`{|}~-]+)*@(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\.)+[A-Za-z]{2,}$"
                                    ErrorMessage="Please enter a valid email address."
                                    Text="Please enter a valid email address." />
                            </div>

                        </div>

                        <div class="ef-field">
                            <asp:Label ID="lblSubject" runat="server" CssClass="ef-label" AssociatedControlID="txtSubject" Text="Subject" />
                            <asp:TextBox ID="txtSubject" runat="server" CssClass="ef-input"
                                MaxLength="150" placeholder="How can we help you?" ValidationGroup="ContactValidation" />
                            <asp:RequiredFieldValidator ID="rfvSubject" runat="server"
                                ControlToValidate="txtSubject"
                                CssClass="field-error"
                                Display="Dynamic"
                                ValidationGroup="ContactValidation"
                                ErrorMessage="Please enter a subject."
                                Text="Please enter a subject." />
                            <%-- The lookahead rejects an entry that is nothing but spaces. --%>
                            <asp:RegularExpressionValidator ID="revSubject" runat="server"
                                ControlToValidate="txtSubject"
                                CssClass="field-error"
                                Display="Dynamic"
                                ValidationGroup="ContactValidation"
                                ValidationExpression="^(?=[\s\S]*\S)[\s\S]{2,150}$"
                                ErrorMessage="Subject must be 2 to 150 characters."
                                Text="Subject must be 2 to 150 characters." />
                        </div>

                        <div class="ef-field">
                            <asp:Label ID="lblMessage" runat="server" CssClass="ef-label" AssociatedControlID="txtMessage" Text="Message" />
                            <asp:TextBox ID="txtMessage" runat="server" CssClass="ef-input ef-textarea" TextMode="MultiLine"
                                Rows="5" MaxLength="2000" placeholder="Please describe your inquiry in detail..." ValidationGroup="ContactValidation" />
                            <asp:RequiredFieldValidator ID="rfvMessage" runat="server"
                                ControlToValidate="txtMessage"
                                CssClass="field-error"
                                Display="Dynamic"
                                ValidationGroup="ContactValidation"
                                ErrorMessage="Please enter your message."
                                Text="Please enter your message." />
                            <asp:RegularExpressionValidator ID="revMessage" runat="server"
                                ControlToValidate="txtMessage"
                                CssClass="field-error"
                                Display="Dynamic"
                                ValidationGroup="ContactValidation"
                                ValidationExpression="^(?=[\s\S]*\S)[\s\S]{10,2000}$"
                                ErrorMessage="Message must be 10 to 2000 characters."
                                Text="Message must be 10 to 2000 characters." />
                        </div>

                        <asp:ValidationSummary ID="vsContact" runat="server"
                            ValidationGroup="ContactValidation"
                            HeaderText=""
                            ShowSummary="true"
                            ShowMessageBox="false"
                            CssClass="validation-summary" />

                        <%-- A LinkButton rather than a Button so the send icon can sit
                             inside it as markup, the way every other button here does. --%>
                        <div class="ef-form-actions">
                            <asp:LinkButton ID="btnSend" runat="server" CssClass="ef-btn ef-btn-primary"
                                CausesValidation="true" ValidationGroup="ContactValidation" OnClick="btnSend_Click">
                                Send Message
                                <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                    <path d="M14 2 7.3 8.7M14 2l-4.3 12-2.4-5.3L2 6.3z" />
                                </svg>
                            </asp:LinkButton>
                        </div>

                    </div>

                </div>

            </div>
        </section>

    </main>

</asp:Content>

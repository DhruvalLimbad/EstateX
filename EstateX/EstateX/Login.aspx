<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EstateX.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="ef-auth-split" aria-labelledby="loginTitle">

            <%-- Placeholder photograph: swap the src for the hero shot when one
                 is supplied; the frame already crops and scrims it. --%>
            <div class="ef-auth-visual">
                <img src="<%= ResolveUrl("~/Images/azure-residences.jpg") %>" alt="" width="800" height="400" />
                <div class="ef-auth-visual-copy">
                    <h2>Discover Your Sanctuary</h2>
                    <p>Access exclusive listings and manage your portfolio with EstateX.</p>
                </div>
            </div>

            <div class="ef-auth-panel">
                <div class="ef-auth-form">

                    <p class="ef-auth-brand">
                        <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                            <path d="M2.5 7.2 8 3l5.5 4.2V13a.8.8 0 0 1-.8.8H3.3a.8.8 0 0 1-.8-.8z" />
                            <path d="M6.5 13.8V9.5h3v4.3" />
                        </svg>
                        EstateX
                    </p>

                    <div class="ef-auth-head">
                        <h1 id="loginTitle">Welcome Back</h1>
                        <p>Please enter your details to sign in</p>
                    </div>

                    <asp:Panel ID="pnlLoginResult" runat="server" CssClass="ef-alert-success" Visible="false">
                        <asp:Literal ID="litLoginResult" runat="server" Mode="PassThrough" />
                    </asp:Panel>

                    <div class="ef-field">
                        <asp:Label ID="lblEmail" runat="server" CssClass="ef-label" AssociatedControlID="txtEmail" Text="Email" />
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="ef-input" TextMode="Email"
                            MaxLength="254" placeholder="Enter your email" ValidationGroup="LoginValidation" />
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                            ControlToValidate="txtEmail"
                            CssClass="field-error"
                            Display="Dynamic"
                            ValidationGroup="LoginValidation"
                            ErrorMessage="Please enter your email."
                            Text="Please enter your email." />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server"
                            ControlToValidate="txtEmail"
                            CssClass="field-error"
                            Display="Dynamic"
                            ValidationGroup="LoginValidation"
                            ValidationExpression="^[A-Za-z0-9!#$%&amp;'*+/=?^_`{|}~-]+(?:\.[A-Za-z0-9!#$%&amp;'*+/=?^_`{|}~-]+)*@(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\.)+[A-Za-z]{2,}$"
                            ErrorMessage="Please enter a valid email address."
                            Text="Please enter a valid email address." />
                    </div>

                    <div class="ef-field">
                        <div class="ef-label-row">
                            <asp:Label ID="lblPassword" runat="server" CssClass="ef-label" AssociatedControlID="txtPassword" Text="Password" />
                            <%-- No recovery flow exists yet. --%>
                            <a class="ef-label-link" href="#">Forgot Password?</a>
                        </div>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="ef-input" TextMode="Password"
                            MaxLength="128" placeholder="Enter your password" ValidationGroup="LoginValidation" />
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                            ControlToValidate="txtPassword"
                            CssClass="field-error"
                            Display="Dynamic"
                            ValidationGroup="LoginValidation"
                            ErrorMessage="Please enter your password."
                            Text="Please enter your password." />
                        <asp:RegularExpressionValidator ID="revPassword" runat="server"
                            ControlToValidate="txtPassword"
                            CssClass="field-error"
                            Display="Dynamic"
                            ValidationGroup="LoginValidation"
                            ValidationExpression="^[\s\S]{6,}$"
                            ErrorMessage="Password must be at least 6 characters."
                            Text="Password must be at least 6 characters." />
                    </div>

                    <%-- A LinkButton rather than a Button so the arrow can sit inside
                         it as markup, the way every other button here does. --%>
                    <div class="ef-auth-actions">
                        <asp:LinkButton ID="btnLogin" runat="server" CssClass="ef-btn ef-btn-primary ef-btn-block"
                            CausesValidation="true" ValidationGroup="LoginValidation" OnClick="btnLogin_Click">
                            Login
                            <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
                                <path d="M3 8h9M8.5 4.5 12 8l-3.5 3.5" />
                            </svg>
                        </asp:LinkButton>
                    </div>

                    <asp:ValidationSummary ID="vsLogin" runat="server"
                        ValidationGroup="LoginValidation"
                        HeaderText=""
                        ShowSummary="true"
                        ShowMessageBox="false"
                        CssClass="validation-summary" />

                    <p class="ef-auth-foot">
                        Don&rsquo;t have an account? <a href="<%= ResolveUrl("~/Register") %>">Register</a>
                    </p>

                    <div class="ef-auth-blurb">
                        <p class="ef-auth-blurb-title">Secure and simple property access</p>
                        <p>Manage your property searches and visits from one place</p>
                    </div>

                </div>
            </div>

        </section>
    </main>

</asp:Content>

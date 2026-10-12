<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EstateX.Register" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="ef-auth-split" aria-labelledby="registerTitle">

            <%-- Placeholder photograph: swap the src for the hero shot when one
                 is supplied; the frame already crops and scrims it. --%>
            <div class="ef-auth-visual">
                <img src="<%= ResolveUrl("~/Images/skyline-penthouse.jpg") %>" alt="" width="800" height="400" />
                <div class="ef-auth-visual-copy">
                    <h2>EstateX</h2>
                    <p>Your journey to the perfect home starts here.</p>
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
                        <h1 id="registerTitle">Create Your Account</h1>
                    </div>

                    <asp:Panel ID="pnlRegisterResult" runat="server" CssClass="ef-alert-success" Visible="false">
                        <asp:Literal ID="litRegisterResult" runat="server" Mode="PassThrough" />
                    </asp:Panel>

                    <div class="ef-field">
                        <asp:Label ID="lblFullName" runat="server" CssClass="ef-label" AssociatedControlID="txtFullName" Text="Full Name" />
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="ef-input"
                            MaxLength="100" placeholder="Your full name" ValidationGroup="RegisterValidation" />
                        <asp:RequiredFieldValidator ID="rfvFullName" runat="server"
                            ControlToValidate="txtFullName"
                            CssClass="field-error"
                            Display="Dynamic"
                            ValidationGroup="RegisterValidation"
                            ErrorMessage="Please enter your full name."
                            Text="Please enter your full name." />
                        <asp:RegularExpressionValidator ID="revFullName" runat="server"
                            ControlToValidate="txtFullName"
                            CssClass="field-error"
                            Display="Dynamic"
                            ValidationGroup="RegisterValidation"
                            ValidationExpression="^[A-Za-z][A-Za-z .'-]{1,99}$"
                            ErrorMessage="Full name must be 2 to 100 letters."
                            Text="Full name must be 2 to 100 letters." />
                    </div>

                    <div class="ef-field">
                        <asp:Label ID="lblEmail" runat="server" CssClass="ef-label" AssociatedControlID="txtEmail" Text="Email Address" />
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="ef-input" TextMode="Email"
                            MaxLength="254" placeholder="you@example.com" ValidationGroup="RegisterValidation" />
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                            ControlToValidate="txtEmail"
                            CssClass="field-error"
                            Display="Dynamic"
                            ValidationGroup="RegisterValidation"
                            ErrorMessage="Please enter your email."
                            Text="Please enter your email." />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server"
                            ControlToValidate="txtEmail"
                            CssClass="field-error"
                            Display="Dynamic"
                            ValidationGroup="RegisterValidation"
                            ValidationExpression="^[A-Za-z0-9!#$%&amp;'*+/=?^_`{|}~-]+(?:\.[A-Za-z0-9!#$%&amp;'*+/=?^_`{|}~-]+)*@(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\.)+[A-Za-z]{2,}$"
                            ErrorMessage="Please enter a valid email address."
                            Text="Please enter a valid email address." />
                    </div>

                    <div class="ef-field">
                        <asp:Label ID="lblPhone" runat="server" CssClass="ef-label" AssociatedControlID="txtPhone" Text="Phone Number" />
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="ef-input" TextMode="Phone"
                            MaxLength="10" placeholder="10-digit mobile number" ValidationGroup="RegisterValidation" />
                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server"
                            ControlToValidate="txtPhone"
                            CssClass="field-error"
                            Display="Dynamic"
                            ValidationGroup="RegisterValidation"
                            ErrorMessage="Please enter your phone number."
                            Text="Please enter your phone number." />
                        <asp:RegularExpressionValidator ID="revPhone" runat="server"
                            ControlToValidate="txtPhone"
                            CssClass="field-error"
                            Display="Dynamic"
                            ValidationGroup="RegisterValidation"
                            ValidationExpression="^[6-9][0-9]{9}$"
                            ErrorMessage="Enter a valid 10-digit Indian mobile number."
                            Text="Enter a valid 10-digit Indian mobile number." />
                    </div>

                    <div class="ef-field">
                        <asp:Label ID="lblPassword" runat="server" CssClass="ef-label" AssociatedControlID="txtPassword" Text="Password" />
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="ef-input" TextMode="Password"
                            MaxLength="128" placeholder="At least 6 characters" ValidationGroup="RegisterValidation" />
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                            ControlToValidate="txtPassword"
                            CssClass="field-error"
                            Display="Dynamic"
                            ValidationGroup="RegisterValidation"
                            ErrorMessage="Please enter your password."
                            Text="Please enter your password." />
                        <asp:RegularExpressionValidator ID="revPassword" runat="server"
                            ControlToValidate="txtPassword"
                            CssClass="field-error"
                            Display="Dynamic"
                            ValidationGroup="RegisterValidation"
                            ValidationExpression="^[\s\S]{6,}$"
                            ErrorMessage="Password must be at least 6 characters."
                            Text="Password must be at least 6 characters." />
                    </div>

                    <div class="ef-field">
                        <asp:Label ID="lblConfirmPassword" runat="server" CssClass="ef-label" AssociatedControlID="txtConfirmPassword" Text="Confirm Password" />
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="ef-input" TextMode="Password"
                            MaxLength="128" placeholder="Re-enter your password" ValidationGroup="RegisterValidation" />
                        <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server"
                            ControlToValidate="txtConfirmPassword"
                            CssClass="field-error"
                            Display="Dynamic"
                            ValidationGroup="RegisterValidation"
                            ErrorMessage="Please confirm your password."
                            Text="Please confirm your password." />
                        <asp:CompareValidator ID="cmpPassword" runat="server"
                            ControlToValidate="txtConfirmPassword"
                            ControlToCompare="txtPassword"
                            Operator="Equal"
                            Type="String"
                            CssClass="field-error"
                            Display="Dynamic"
                            ValidationGroup="RegisterValidation"
                            ErrorMessage="Passwords do not match."
                            Text="Passwords do not match." />
                    </div>

                    <div class="ef-auth-actions">
                        <asp:Button ID="btnRegister" runat="server" CssClass="ef-btn ef-btn-primary ef-btn-block" Text="Register"
                            CausesValidation="true" ValidationGroup="RegisterValidation" OnClick="btnRegister_Click" />
                    </div>

                    <asp:ValidationSummary ID="vsRegister" runat="server"
                        ValidationGroup="RegisterValidation"
                        HeaderText=""
                        ShowSummary="true"
                        ShowMessageBox="false"
                        CssClass="validation-summary" />

                    <p class="ef-auth-foot">
                        Already have an account? <a href="<%= ResolveUrl("~/Login") %>">Login</a>
                    </p>

                </div>
            </div>

        </section>
    </main>

</asp:Content>

<%@ Page Title="Manage Users" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="EstateX.ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
    <style>
        .users-page-container {
            max-width: 1180px;
            margin: 20px auto 60px auto;
            padding: 0 16px;
        }

        .users-top-bar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 24px;
        }

        .users-page-heading {
            font-size: 22px;
            font-weight: 800;
            color: #111827;
            margin: 0;
        }

        .users-controls-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 14px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }

        .user-search-wrap {
            position: relative;
            width: 260px;
        }

        .user-search-wrap svg {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            stroke: #9ca3af;
        }

        .user-search-input {
            width: 100%;
            height: 38px;
            padding: 8px 12px 8px 36px;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            font-size: 13px;
            background-color: #ffffff;
            box-sizing: border-box;
            outline: none;
        }

        .btn-add-user {
            background-color: #2563eb;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            padding: 0 18px;
            height: 38px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: background-color 0.15s ease;
        }

        .btn-add-user:hover {
            background-color: #1d4ed8;
        }

        /* User Table Card */
        .users-table-card {
            background: #ffffff;
            border: 1px solid #f3f4f6;
            border-radius: 12px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.03);
            overflow: hidden;
        }

        .users-table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        .users-table th {
            background-color: #f9fafb;
            padding: 14px 20px;
            font-size: 11px;
            font-weight: 700;
            color: #6b7280;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 1px solid #e5e7eb;
        }

        .users-table td {
            padding: 16px 20px;
            font-size: 13px;
            color: #374151;
            border-bottom: 1px solid #f3f4f6;
            vertical-align: middle;
        }

        .users-table tr:last-child td {
            border-bottom: none;
        }

        .cell-user-name {
            font-weight: 700;
            color: #111827;
        }

        .cell-user-email {
            color: #4b5563;
        }

        .cell-user-phone {
            color: #4b5563;
        }

        /* Status Pills */
        .status-pill {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 11.5px;
            font-weight: 600;
        }

        .status-pill.active {
            background-color: #ecfdf5;
            color: #059669;
        }

        .status-pill.blocked {
            background-color: #fef2f2;
            color: #dc2626;
        }

        /* Action Buttons */
        .user-action-btn {
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            border-radius: 6px;
            padding: 5px 8px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            color: #6b7280;
            margin-left: 4px;
            transition: all 0.15s ease;
        }

        .user-action-btn:hover {
            background-color: #f3f4f6;
            color: #111827;
        }

        .user-action-btn.delete {
            color: #ef4444;
        }

        .user-action-btn.delete:hover {
            background-color: #fee2e2;
            border-color: #fca5a5;
        }

        .users-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 16px 20px;
            border-top: 1px solid #f3f4f6;
            font-size: 12px;
            color: #6b7280;
        }

        .users-pages {
            display: flex;
            gap: 6px;
        }

        .users-page-btn {
            width: 28px;
            height: 28px;
            border-radius: 6px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: 600;
            color: #4b5563;
            background: #ffffff;
            border: 1px solid #e5e7eb;
        }

        .users-page-btn.active {
            background-color: #2563eb;
            color: #ffffff;
            border-color: #2563eb;
        }

        .alert-box {
            padding: 12px 16px;
            border-radius: 8px;
            font-size: 13px;
            margin-bottom: 16px;
        }

        .alert-box-success {
            background-color: #ecfdf5;
            color: #065f46;
            border: 1px solid #a7f3d0;
        }

        /* Popup Modal */
        .modal-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(17, 24, 39, 0.6);
            backdrop-filter: blur(2px);
            z-index: 9999;
            align-items: center;
            justify-content: center;
            padding: 16px;
            box-sizing: border-box;
        }

        .modal-overlay.active {
            display: flex;
        }

        .modal-box {
            background: #ffffff;
            width: 100%;
            max-width: 480px;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
        }

        .modal-row {
            display: flex;
            flex-direction: column;
            gap: 5px;
            margin-bottom: 14px;
        }

        .modal-row label {
            font-size: 12px;
            font-weight: 600;
            color: #374151;
        }

        .modal-input {
            width: 100%;
            height: 38px;
            padding: 8px 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 13px;
            box-sizing: border-box;
            outline: none;
        }

        .modal-input:focus {
            border-color: #2563eb;
        }

        .val-err {
            color: #dc2626;
            font-size: 11px;
            font-weight: 500;
            margin-top: 2px;
            display: block;
        }

        .modal-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 20px;
            padding-top: 14px;
            border-top: 1px solid #f3f4f6;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminMainContent" runat="server">
    <div class="users-page-container">
        <!-- Top Bar -->
        <div class="users-top-bar">
            <h1 class="users-page-heading">Manage Users</h1>
        </div>

        <!-- Success Message -->
        <asp:Panel ID="pnlUserAlert" runat="server" Visible="false" CssClass="alert-box alert-box-success">
            <asp:Literal ID="litUserMsg" runat="server" />
        </asp:Panel>

        <!-- Controls: Search & Add Button -->
        <div class="users-controls-row">
            <div class="user-search-wrap">
                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="11" cy="11" r="8"></circle>
                    <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                </svg>
                <asp:TextBox ID="txtSearchUser" runat="server" CssClass="user-search-input" Placeholder="Search users..." AutoPostBack="true" OnTextChanged="txtSearchUser_TextChanged" />
            </div>

            <button type="button" class="btn-add-user" onclick="openUserModal();">
                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round">
                    <line x1="12" y1="5" x2="12" y2="19"></line>
                    <line x1="5" y1="12" x2="19" y2="12"></line>
                </svg>
                 Add User
            </button>
        </div>

        <!-- Users Table Card -->
        <div class="users-table-card">
            <table class="users-table">
                <thead>
                    <tr>
                        <th style="width: 25%;">NAME</th>
                        <th style="width: 30%;">EMAIL</th>
                        <th style="width: 20%;">PHONE</th>
                        <th style="width: 12%;">STATUS</th>
                        <th style="width: 13%; text-align: right;">ACTIONS</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptUsers" runat="server" OnItemCommand="rptUsers_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td class="cell-user-name"><%# Eval("Name") %></td>
                                <td class="cell-user-email"><%# Eval("Email") %></td>
                                <td class="cell-user-phone"><%# Eval("Phone") %></td>
                                <td>
                                    <span class='status-pill <%# Eval("Status").ToString().ToLower() %>'>
                                        <%# Eval("Status") %>
                                    </span>
                                </td>
                                <td style="text-align: right;">
                                    <!-- View Action -->
                                    <asp:LinkButton ID="btnView" runat="server" CssClass="user-action-btn" CommandName="ViewUser" CommandArgument='<%# Eval("Id") %>' CausesValidation="false" title="View Details">
                                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                    </asp:LinkButton>

                                    <!-- Toggle Status (Block / Unblock) Action -->
                                    <asp:LinkButton ID="btnToggleStatus" runat="server" CssClass="user-action-btn" CommandName="ToggleStatus" CommandArgument='<%# Eval("Id") %>' CausesValidation="false" title="Toggle Status">
                                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                                            <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                                        </svg>
                                    </asp:LinkButton>

                                    <!-- Delete Action -->
                                    <asp:LinkButton ID="btnDelete" runat="server" CssClass="user-action-btn delete" CommandName="DeleteUser" CommandArgument='<%# Eval("Id") %>' CausesValidation="false" title="Delete User" OnClientClick="return confirm('Are you sure you want to delete this user?');">
                                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <polyline points="3 6 5 6 21 6"></polyline>
                                            <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                        </svg>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>

            <!-- Footer Pagination -->
            <div class="users-footer">
                <div>Showing 1–4 of 342 users</div>
                <div class="users-pages">
                    <span class="users-page-btn active">1</span>
                    <span class="users-page-btn">2</span>
                    <span class="users-page-btn">3</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Add User Modal with .NET Validation -->
    <div id="userModal" class="modal-overlay">
        <div class="modal-box">
            <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:16px; border-bottom:1px solid #f3f4f6; padding-bottom:10px;">
                <h3 style="font-size:17px; font-weight:700; color:#111827; margin:0;">Add New User</h3>
                <button type="button" style="background:none; border:none; font-size:22px; cursor:pointer; color:#9ca3af;" onclick="closeUserModal();">&times;</button>
            </div>

            <!-- Full Name with RequiredFieldValidator -->
            <div class="modal-row">
                <label>Full Name <span style="color:#dc2626;">*</span></label>
                <asp:TextBox ID="txtNewUserName" runat="server" CssClass="modal-input" Placeholder="e.g. Rohan Mehta" MaxLength="60" />
                <asp:RequiredFieldValidator ID="rfvUserName" runat="server"
                    ControlToValidate="txtNewUserName"
                    ErrorMessage="Full Name is required."
                    ValidationGroup="vgAddUser"
                    Display="Dynamic"
                    CssClass="val-err" />
            </div>

            <!-- Email with RequiredFieldValidator and RegularExpressionValidator -->
            <div class="modal-row">
                <label>Email Address <span style="color:#dc2626;">*</span></label>
                <asp:TextBox ID="txtNewUserEmail" runat="server" CssClass="modal-input" Placeholder="name@example.com" MaxLength="80" />
                <asp:RequiredFieldValidator ID="rfvUserEmail" runat="server"
                    ControlToValidate="txtNewUserEmail"
                    ErrorMessage="Email address is required."
                    ValidationGroup="vgAddUser"
                    Display="Dynamic"
                    CssClass="val-err" />
                <asp:RegularExpressionValidator ID="revUserEmail" runat="server"
                    ControlToValidate="txtNewUserEmail"
                    ValidationExpression="^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$"
                    ErrorMessage="Enter a valid email address."
                    ValidationGroup="vgAddUser"
                    Display="Dynamic"
                    CssClass="val-err" />
            </div>

            <!-- Phone with RequiredFieldValidator and Indian 10-Digit Phone RegularExpressionValidator -->
            <div class="modal-row">
                <label>Phone Number (10 digits) <span style="color:#dc2626;">*</span></label>
                <asp:TextBox ID="txtNewUserPhone" runat="server" CssClass="modal-input" Placeholder="9876543210" MaxLength="10" />
                <asp:RequiredFieldValidator ID="rfvUserPhone" runat="server"
                    ControlToValidate="txtNewUserPhone"
                    ErrorMessage="Phone number is required."
                    ValidationGroup="vgAddUser"
                    Display="Dynamic"
                    CssClass="val-err" />
                <asp:RegularExpressionValidator ID="revUserPhone" runat="server"
                    ControlToValidate="txtNewUserPhone"
                    ValidationExpression="^[6-9]\d{9}$"
                    ErrorMessage="Enter a valid 10-digit Indian phone number starting with 6-9."
                    ValidationGroup="vgAddUser"
                    Display="Dynamic"
                    CssClass="val-err" />
            </div>

            <!-- User Status -->
            <div class="modal-row">
                <label>Status</label>
                <asp:DropDownList ID="ddlNewUserStatus" runat="server" CssClass="modal-input">
                    <asp:ListItem Value="Active" Text="Active" />
                    <asp:ListItem Value="Blocked" Text="Blocked" />
                </asp:DropDownList>
            </div>

            <!-- Modal Action Buttons -->
            <div class="modal-actions">
                <button type="button" style="height:36px; padding:0 14px; border:1px solid #d1d5db; background:#fff; border-radius:6px; cursor:pointer;" onclick="closeUserModal();">Cancel</button>
                <asp:Button ID="btnSaveUser" runat="server" Text="Create User"
                    ValidationGroup="vgAddUser"
                    CausesValidation="true"
                    OnClick="btnSaveUser_Click"
                    style="height:36px; padding:0 18px; border:none; background:#2563eb; color:#fff; border-radius:6px; font-weight:600; cursor:pointer;" />
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function openUserModal() {
            var modal = document.getElementById("userModal");
            if (modal) modal.classList.add("active");
        }

        function closeUserModal() {
            var modal = document.getElementById("userModal");
            if (modal) modal.classList.remove("active");
        }

        window.onclick = function (event) {
            var modal = document.getElementById("userModal");
            if (event.target === modal) closeUserModal();
        };
    </script>
</asp:Content>
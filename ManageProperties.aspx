<%@ Page Title="Manage Properties" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="ManageProperties.aspx.cs" Inherits="EstateX.ManageProperties" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
    <style>
        .admin-prop-container {
            max-width: 1180px;
            margin: 20px auto 60px auto;
            padding: 0 16px;
        }

        .admin-top-bar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 24px;
        }

        .admin-page-title {
            font-size: 22px;
            font-weight: 800;
            color: #111827;
            margin: 0;
        }

        /* Filter Controls */
        .filter-controls-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 14px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }

        .filter-left-group {
            display: flex;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
        }

        .search-box-wrap {
            position: relative;
            width: 250px;
        }

        .search-box-wrap svg {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            stroke: #9ca3af;
        }

        .search-input {
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

        .filter-dropdown {
            height: 38px;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            padding: 0 14px;
            font-size: 13px;
            color: #374151;
            background-color: #ffffff;
            cursor: pointer;
            outline: none;
        }

        .btn-add-property {
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

        .btn-add-property:hover {
            background-color: #1d4ed8;
        }

        /* Property Table */
        .prop-table-card {
            background: #ffffff;
            border: 1px solid #f3f4f6;
            border-radius: 12px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.03);
            overflow: hidden;
        }

        .admin-table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        .admin-table th {
            background-color: #f9fafb;
            padding: 14px 20px;
            font-size: 11px;
            font-weight: 700;
            color: #6b7280;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 1px solid #e5e7eb;
        }

        .admin-table td {
            padding: 16px 20px;
            font-size: 13px;
            color: #374151;
            border-bottom: 1px solid #f3f4f6;
            vertical-align: middle;
        }

        .admin-table tr:last-child td {
            border-bottom: none;
        }

        .prop-info-title {
            font-size: 13.5px;
            font-weight: 700;
            color: #111827;
            margin: 0 0 3px 0;
        }

        .prop-info-loc {
            font-size: 11.5px;
            color: #6b7280;
            margin: 0;
        }

        .prop-price {
            font-weight: 700;
            color: #111827;
        }

        /* Status Pills */
        .badge-status {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 600;
        }

        .status-published {
            background-color: #ecfdf5;
            color: #059669;
        }

        .status-draft {
            background-color: #fffbeb;
            color: #d97706;
        }

        .status-sold {
            background-color: #f3f4f6;
            color: #6b7280;
        }

        /* Row Actions */
        .btn-table-action {
            background: none;
            border: none;
            padding: 6px;
            cursor: pointer;
            border-radius: 6px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: background-color 0.15s ease;
        }

        .btn-table-action.edit:hover {
            background-color: #eff6ff;
        }

        .btn-table-action.delete:hover {
            background-color: #fee2e2;
        }

        .table-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 16px 20px;
            border-top: 1px solid #f3f4f6;
            font-size: 12px;
            color: #6b7280;
        }

        .pagination-cluster {
            display: flex;
            gap: 6px;
        }

        .page-num-btn {
            width: 28px;
            height: 28px;
            border-radius: 6px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: 600;
            text-decoration: none;
            color: #4b5563;
            background: #ffffff;
            border: 1px solid #e5e7eb;
        }

        .page-num-btn.active {
            background-color: #2563eb;
            color: #ffffff;
            border-color: #2563eb;
        }

        .admin-alert {
            padding: 12px 16px;
            border-radius: 8px;
            font-size: 13px;
            margin-bottom: 18px;
        }

        .alert-success {
            background-color: #ecfdf5;
            color: #065f46;
            border: 1px solid #a7f3d0;
        }

        /* Modal Overlay & Card */
        .prop-modal-overlay {
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

        .prop-modal-overlay.active {
            display: flex;
        }

        .prop-modal-card {
            background: #ffffff;
            width: 100%;
            max-width: 520px;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
        }

        .modal-field-group {
            display: flex;
            flex-direction: column;
            gap: 5px;
            margin-bottom: 14px;
        }

        .modal-field-label {
            font-size: 12px;
            font-weight: 600;
            color: #374151;
        }

        .modal-text-input {
            width: 100%;
            height: 38px;
            padding: 8px 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 13px;
            box-sizing: border-box;
            outline: none;
        }

        .modal-text-input:focus {
            border-color: #2563eb;
        }

        .val-error-text {
            color: #dc2626;
            font-size: 11px;
            font-weight: 500;
            margin-top: 2px;
            display: block;
        }

        .modal-btn-row {
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
    <div class="admin-prop-container">
        <!-- Top Bar Header -->
        <div class="admin-top-bar">
            <h1 class="admin-page-title">Manage Properties</h1>
        </div>

        <!-- Success Message Alert -->
        <asp:Panel ID="pnlMsg" runat="server" Visible="false" CssClass="admin-alert alert-success">
            <asp:Literal ID="litMsg" runat="server" />
        </asp:Panel>

        <!-- Search & Filter Bar -->
        <div class="filter-controls-row">
            <div class="filter-left-group">
                <div class="search-box-wrap">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                    </svg>
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="search-input" Placeholder="Search properties..." AutoPostBack="true" OnTextChanged="FilterChanged" />
                </div>

                <asp:DropDownList ID="ddlFilterCategory" runat="server" CssClass="filter-dropdown" AutoPostBack="true" OnSelectedIndexChanged="FilterChanged">
                    <asp:ListItem Value="" Text="All Categories" />
                    <asp:ListItem Value="Apartment" Text="Apartment" />
                    <asp:ListItem Value="Villa" Text="Villa" />
                    <asp:ListItem Value="Office" Text="Office" />
                    <asp:ListItem Value="Plot" Text="Plot" />
                </asp:DropDownList>

                <asp:DropDownList ID="ddlFilterStatus" runat="server" CssClass="filter-dropdown" AutoPostBack="true" OnSelectedIndexChanged="FilterChanged">
                    <asp:ListItem Value="" Text="All Status" />
                    <asp:ListItem Value="Published" Text="Published" />
                    <asp:ListItem Value="Draft" Text="Draft" />
                    <asp:ListItem Value="Sold" Text="Sold" />
                </asp:DropDownList>
            </div>

            <button type="button" class="btn-add-property" onclick="openPropModal(0, '', '', 'Apartment', '', 'Published');">
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round">
                    <line x1="12" y1="5" x2="12" y2="19"></line>
                    <line x1="5" y1="12" x2="19" y2="12"></line>
                </svg>
                 Add Property
            </button>
        </div>

        <!-- Property Grid Card -->
        <div class="prop-table-card">
            <table class="admin-table">
                <thead>
                    <tr>
                        <th style="width: 38%;">Property Name</th>
                        <th style="width: 15%;">Category</th>
                        <th style="width: 18%;">Price</th>
                        <th style="width: 15%;">Status</th>
                        <th style="width: 14%; text-align: right;">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptProperties" runat="server" OnItemCommand="rptProperties_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <div class="prop-info-title"><%# Eval("Name") %></div>
                                    <div class="prop-info-loc"><%# Eval("Location") %></div>
                                </td>
                                <td><%# Eval("Category") %></td>
                                <td class="prop-price"><%# Eval("FormattedPrice") %></td>
                                <td>
                                    <span class='badge-status <%# Eval("Status").ToString() == "Published" ? "status-published" : (Eval("Status").ToString() == "Draft" ? "status-draft" : "status-sold") %>'>
                                        <%# Eval("Status") %>
                                    </span>
                                </td>
                                <td style="text-align: right;">
                                    <asp:LinkButton ID="btnEdit" runat="server" CssClass="btn-table-action edit" CommandName="EditProp" CommandArgument='<%# Eval("Id") %>' CausesValidation="false" title="Edit">
                                        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#6b7280" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M12 20h9"></path>
                                            <path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path>
                                        </svg>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn-table-action delete" CommandName="DeleteProp" CommandArgument='<%# Eval("Id") %>' CausesValidation="false" title="Delete" OnClientClick="return confirm('Are you sure you want to delete this property?');">
                                        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#ef4444" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
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
            <div class="table-footer">
                <div>Showing 1–5 of 128 properties</div>
                <div class="pagination-cluster">
                    <span class="page-num-btn active">1</span>
                    <span class="page-num-btn">2</span>
                    <span class="page-num-btn">3</span>
                </div>
            </div>
        </div>
    </div>

    <%-- Add / Edit Modal Popup --%>
    <div id="propModal" class="prop-modal-overlay">
        <div class="prop-modal-card">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px; border-bottom: 1px solid #f3f4f6; padding-bottom: 10px;">
                <h3 id="modalTitle" style="font-size: 17px; font-weight: 700; color: #111827; margin: 0;">Add Property</h3>
                <button type="button" style="background: none; border: none; font-size: 22px; cursor: pointer; color: #9ca3af;" onclick="closePropModal();">&times;</button>
            </div>

            <asp:HiddenField ID="hfPropId" runat="server" Value="0" />

            <!-- Property Name -->
            <div class="modal-field-group">
                <label class="modal-field-label">Property Name <span style="color:#dc2626;">*</span></label>
                <asp:TextBox ID="txtPropName" runat="server" CssClass="modal-text-input" MaxLength="100" />
                <asp:RequiredFieldValidator ID="rfvPropName" runat="server"
                    ControlToValidate="txtPropName"
                    ErrorMessage="Property Name is required."
                    ValidationGroup="vgProp"
                    EnableClientScript="false"
                    CssClass="val-error-text"
                    Display="Dynamic" />
            </div>

            <!-- Location -->
            <div class="modal-field-group">
                <label class="modal-field-label">Location (Rajkot) <span style="color:#dc2626;">*</span></label>
                <asp:TextBox ID="txtPropLocation" runat="server" CssClass="modal-text-input" Placeholder="e.g. Kalawad Road, Rajkot" MaxLength="150" />
                <asp:RequiredFieldValidator ID="rfvPropLocation" runat="server"
                    ControlToValidate="txtPropLocation"
                    ErrorMessage="Location is required."
                    ValidationGroup="vgProp"
                    EnableClientScript="false"
                    CssClass="val-error-text"
                    Display="Dynamic" />
            </div>

            <!-- Category -->
            <div class="modal-field-group">
                <label class="modal-field-label">Category <span style="color:#dc2626;">*</span></label>
                <asp:DropDownList ID="ddlModalCategory" runat="server" CssClass="modal-text-input">
                    <asp:ListItem Value="Apartment" Text="Apartment" />
                    <asp:ListItem Value="Villa" Text="Villa" />
                    <asp:ListItem Value="Office" Text="Office" />
                    <asp:ListItem Value="Plot" Text="Plot" />
                </asp:DropDownList>
            </div>

            <!-- Price in INR -->
            <div class="modal-field-group">
                <label class="modal-field-label">Price (in INR ₹) <span style="color:#dc2626;">*</span></label>
                <asp:TextBox ID="txtPropPrice" runat="server" CssClass="modal-text-input" Placeholder="e.g. 4250000" />
                <asp:RequiredFieldValidator ID="rfvPropPrice" runat="server"
                    ControlToValidate="txtPropPrice"
                    ErrorMessage="Price is required."
                    ValidationGroup="vgProp"
                    EnableClientScript="false"
                    CssClass="val-error-text"
                    Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revPropPrice" runat="server"
                    ControlToValidate="txtPropPrice"
                    ValidationExpression="^\d+$"
                    ErrorMessage="Price must contain digits only."
                    ValidationGroup="vgProp"
                    EnableClientScript="false"
                    CssClass="val-error-text"
                    Display="Dynamic" />
            </div>

            <!-- Status -->
            <div class="modal-field-group">
                <label class="modal-field-label">Status <span style="color:#dc2626;">*</span></label>
                <asp:DropDownList ID="ddlModalStatus" runat="server" CssClass="modal-text-input">
                    <asp:ListItem Value="Published" Text="Published" />
                    <asp:ListItem Value="Draft" Text="Draft" />
                    <asp:ListItem Value="Sold" Text="Sold" />
                </asp:DropDownList>
            </div>

            <!-- Actions -->
            <div class="modal-btn-row">
                <button type="button" class="btn-modal-cancel" style="height:36px; padding:0 14px; border:1px solid #d1d5db; background:#fff; border-radius:6px; cursor:pointer;" onclick="closePropModal();">Cancel</button>
                <asp:Button ID="btnSaveProperty" runat="server" Text="Save Property"
                    ValidationGroup="vgProp"
                    CausesValidation="true"
                    style="height:36px; padding:0 18px; border:none; background:#2563eb; color:#fff; border-radius:6px; font-weight:600; cursor:pointer;"
                    OnClick="btnSaveProperty_Click" />
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function openPropModal(id, name, location, category, price, status) {
            document.getElementById('<%= hfPropId.ClientID %>').value = id;
            document.getElementById('<%= txtPropName.ClientID %>').value = name;
            document.getElementById('<%= txtPropLocation.ClientID %>').value = location;
            document.getElementById('<%= ddlModalCategory.ClientID %>').value = category;
            document.getElementById('<%= txtPropPrice.ClientID %>').value = price;
            document.getElementById('<%= ddlModalStatus.ClientID %>').value = status;

            document.getElementById("modalTitle").innerText = (id == 0) ? "Add Property" : "Edit Property";
            var modal = document.getElementById("propModal");
            if (modal) modal.classList.add("active");
        }

        function closePropModal() {
            var modal = document.getElementById("propModal");
            if (modal) modal.classList.remove("active");
        }

        window.onclick = function (event) {
            var modal = document.getElementById("propModal");
            if (event.target === modal) closePropModal();
        };
    </script>
</asp:Content>
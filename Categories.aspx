<%@ Page Title="Categories" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="EstateX.Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
    <style>
        .category-page-container {
            max-width: 1180px;
            margin: 20px auto 60px auto;
            padding: 0 16px;
        }

        .category-top-bar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 24px;
        }

        .category-page-heading {
            font-size: 22px;
            font-weight: 800;
            color: #111827;
            margin: 0;
        }

        .btn-add-cat {
            background-color: #2563eb;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            padding: 9px 18px;
            font-size: 13.5px;
            font-weight: 600;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: background-color 0.15s ease;
            text-decoration: none;
        }

        .btn-add-cat:hover {
            background-color: #1d4ed8;
        }

        /* Card & Table */
        .category-table-card {
            background: #ffffff;
            border: 1px solid #f3f4f6;
            border-radius: 12px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.03);
            overflow: hidden;
        }

        .category-table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        .category-table th {
            background-color: #ffffff;
            padding: 16px 22px;
            font-size: 11px;
            font-weight: 700;
            color: #6b7280;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 1px solid #f3f4f6;
        }

        .category-table td {
            padding: 18px 22px;
            font-size: 13.5px;
            color: #4b5563;
            border-bottom: 1px solid #f3f4f6;
            vertical-align: middle;
        }

        .category-table tr:last-child td {
            border-bottom: none;
        }

        .cell-cat-name {
            font-weight: 700;
            color: #111827;
        }

        .cell-cat-desc {
            color: #6b7280;
            line-height: 1.4;
        }

        /* Actions */
        .cat-action-btn {
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            border-radius: 6px;
            padding: 6px 8px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            color: #6b7280;
            margin-left: 6px;
            transition: all 0.15s ease;
            text-decoration: none;
        }

        .cat-action-btn:hover {
            background-color: #f3f4f6;
            color: #111827;
        }

        .cat-action-btn.delete {
            color: #ef4444;
            background: #fff;
            border-color: #fee2e2;
        }

        .cat-action-btn.delete:hover {
            background-color: #fee2e2;
            border-color: #fca5a5;
        }

        /* Modal Overlay & Box */
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
            max-width: 460px;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
        }

        .modal-field {
            display: flex;
            flex-direction: column;
            gap: 5px;
            margin-bottom: 14px;
        }

        .modal-field label {
            font-size: 12px;
            font-weight: 600;
            color: #374151;
        }

        .modal-input {
            width: 100%;
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

        .val-error {
            color: #dc2626;
            font-size: 11.5px;
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

        .alert-box {
            padding: 12px 16px;
            border-radius: 8px;
            font-size: 13px;
            margin-bottom: 16px;
            background-color: #ecfdf5;
            color: #065f46;
            border: 1px solid #a7f3d0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminMainContent" runat="server">
    <div class="category-page-container">
        <!-- Top Bar -->
        <div class="category-top-bar">
            <h1 class="category-page-heading">Categories</h1>
            <asp:LinkButton ID="btnOpenAddCategory" runat="server" CssClass="btn-add-cat" OnClick="btnOpenAddCategory_Click" CausesValidation="false">
                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round">
                    <line x1="12" y1="5" x2="12" y2="19"></line>
                    <line x1="5" y1="12" x2="19" y2="12"></line>
                </svg>
                Add Category
            </asp:LinkButton>
        </div>

        <!-- Success/Info Alert -->
        <asp:Panel ID="pnlCategoryAlert" runat="server" Visible="false" CssClass="alert-box">
            <asp:Literal ID="litCategoryMsg" runat="server" />
        </asp:Panel>

        <!-- Categories Table Card -->
        <div class="category-table-card">
            <table class="category-table">
                <thead>
                    <tr>
                        <th style="width: 25%;">CATEGORY NAME</th>
                        <th style="width: 60%;">DESCRIPTION</th>
                        <th style="width: 15%; text-align: right;">ACTIONS</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptCategories" runat="server" OnItemCommand="rptCategories_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td class="cell-cat-name"><%# Eval("Name") %></td>
                                <td class="cell-cat-desc"><%# Eval("Description") %></td>
                                <td style="text-align: right;">
                                    <!-- Edit Action -->
                                    <asp:LinkButton ID="btnEdit" runat="server" CssClass="cat-action-btn"
                                        CommandName="EditCategory" CommandArgument='<%# Eval("Id") %>' CausesValidation="false" title="Edit Category">
                                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                        </svg>
                                    </asp:LinkButton>

                                    <!-- Delete Action -->
                                    <asp:LinkButton ID="btnDelete" runat="server" CssClass="cat-action-btn delete"
                                        CommandName="DeleteCategory" CommandArgument='<%# Eval("Id") %>' CausesValidation="false" title="Delete Category"
                                        OnClientClick="return confirm('Are you sure you want to delete this category?');">
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
        </div>
    </div>

    <!-- Category Modal (Add / Edit) with pure .NET Validation -->
    <div id="categoryModal" class="modal-overlay">
        <div class="modal-box">
            <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:16px; border-bottom:1px solid #f3f4f6; padding-bottom:10px;">
                <h3 style="font-size:17px; font-weight:700; color:#111827; margin:0;">
                    <asp:Literal ID="litModalTitle" runat="server" Text="Add New Category" />
                </h3>
                <button type="button" style="background:none; border:none; font-size:22px; cursor:pointer; color:#9ca3af;" onclick="closeCategoryModal();">&times;</button>
            </div>

            <asp:HiddenField ID="hfCategoryId" runat="server" Value="0" />

            <!-- Category Name Field -->
            <div class="modal-field">
                <label>Category Name <span style="color:#dc2626;">*</span></label>
                <asp:TextBox ID="txtCategoryName" runat="server" CssClass="modal-input" Placeholder="e.g. Apartment, Villa, Plot" MaxLength="50" />
                
                <asp:RequiredFieldValidator ID="rfvCategoryName" runat="server"
                    ControlToValidate="txtCategoryName"
                    ErrorMessage="Category Name is required."
                    ValidationGroup="vgCategory"
                    Display="Dynamic"
                    CssClass="val-error" />

                <asp:RegularExpressionValidator ID="revCategoryName" runat="server"
                    ControlToValidate="txtCategoryName"
                    ValidationExpression="^[a-zA-Z0-9\s\-]{2,50}$"
                    ErrorMessage="Category Name must be 2 to 50 characters (letters, numbers, hyphens only)."
                    ValidationGroup="vgCategory"
                    Display="Dynamic"
                    CssClass="val-error" />

                <asp:CustomValidator ID="cvCategoryNameUnique" runat="server"
                    ControlToValidate="txtCategoryName"
                    OnServerValidate="cvCategoryNameUnique_ServerValidate"
                    ErrorMessage="A category with this name already exists."
                    ValidationGroup="vgCategory"
                    Display="Dynamic"
                    CssClass="val-error" />
            </div>

            <!-- Description Field -->
            <div class="modal-field">
                <label>Description <span style="color:#dc2626;">*</span></label>
                <asp:TextBox ID="txtCategoryDesc" runat="server" TextMode="MultiLine" Rows="3" CssClass="modal-input" Placeholder="Brief summary of properties in this category..." MaxLength="250" />

                <asp:RequiredFieldValidator ID="rfvCategoryDesc" runat="server"
                    ControlToValidate="txtCategoryDesc"
                    ErrorMessage="Description is required."
                    ValidationGroup="vgCategory"
                    Display="Dynamic"
                    CssClass="val-error" />

                <asp:RegularExpressionValidator ID="revCategoryDesc" runat="server"
                    ControlToValidate="txtCategoryDesc"
                    ValidationExpression="^[\s\S]{5,250}$"
                    ErrorMessage="Description must be between 5 and 250 characters."
                    ValidationGroup="vgCategory"
                    Display="Dynamic"
                    CssClass="val-error" />
            </div>

            <!-- Modal Action Buttons -->
            <div class="modal-actions">
                <button type="button" style="height:36px; padding:0 14px; border:1px solid #d1d5db; background:#fff; border-radius:6px; cursor:pointer;" onclick="closeCategoryModal();">Cancel</button>
                <asp:Button ID="btnSaveCategory" runat="server" Text="Save Category"
                    ValidationGroup="vgCategory"
                    CausesValidation="true"
                    OnClick="btnSaveCategory_Click"
                    style="height:36px; padding:0 18px; border:none; background:#2563eb; color:#fff; border-radius:6px; font-weight:600; cursor:pointer;" />
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function openCategoryModal() {
            var m = document.getElementById("categoryModal");
            if (m) m.classList.add("active");
        }

        function closeCategoryModal() {
            var m = document.getElementById("categoryModal");
            if (m) m.classList.remove("active");
        }

        window.onclick = function (e) {
            var m = document.getElementById("categoryModal");
            if (e.target === m) closeCategoryModal();
        };
    </script>
</asp:Content>
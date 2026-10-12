<%@ Page Title="Visit Requests" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="VisitRequests.aspx.cs" Inherits="EstateX.VisitRequests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
    <style>
        .visits-container {
            max-width: 1180px;
            margin: 20px auto 60px auto;
            padding: 0 16px;
        }

        .visits-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 24px;
        }

        .visits-title {
            font-size: 22px;
            font-weight: 800;
            color: #111827;
            margin: 0;
        }

        .visits-filter-bar {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }

        .visit-search-box {
            position: relative;
            width: 250px;
        }

        .visit-search-box svg {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            stroke: #9ca3af;
            width: 15px;
            height: 15px;
        }

        .visit-search-input {
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

        .status-dropdown {
            height: 38px;
            padding: 6px 14px;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            color: #374151;
            background-color: #ffffff;
            outline: none;
            cursor: pointer;
        }

        /* Table Card */
        .visits-card {
            background: #ffffff;
            border: 1px solid #f3f4f6;
            border-radius: 12px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.03);
            overflow: hidden;
        }

        .visits-table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        .visits-table th {
            background-color: #f9fafb;
            padding: 14px 20px;
            font-size: 11px;
            font-weight: 700;
            color: #6b7280;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 1px solid #e5e7eb;
        }

        .visits-table td {
            padding: 16px 20px;
            font-size: 13px;
            color: #374151;
            border-bottom: 1px solid #f3f4f6;
            vertical-align: middle;
        }

        .visits-table tr:last-child td {
            border-bottom: none;
        }

        .customer-name {
            font-weight: 700;
            color: #111827;
        }

        /* Status Pills matching UI */
        .status-badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 11.5px;
            font-weight: 600;
        }

        .status-badge.pending {
            background-color: #fffbeb;
            color: #d97706;
        }

        .status-badge.approved {
            background-color: #ecfdf5;
            color: #059669;
        }

        .status-badge.rejected {
            background-color: #fef2f2;
            color: #dc2626;
        }

        /* Action Buttons */
        .btn-action-approve {
            background-color: #eff6ff;
            color: #2563eb;
            border: 1px solid #bfdbfe;
            border-radius: 6px;
            padding: 5px 12px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: all 0.15s ease;
        }

        .btn-action-approve:hover {
            background-color: #2563eb;
            color: #ffffff;
        }

        .btn-action-reject {
            background-color: #fef2f2;
            color: #ef4444;
            border: 1px solid #fecaca;
            border-radius: 6px;
            padding: 5px 12px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            margin-left: 6px;
            transition: all 0.15s ease;
        }

        .btn-action-reject:hover {
            background-color: #ef4444;
            color: #ffffff;
        }

        .btn-action-view {
            background: none;
            border: none;
            cursor: pointer;
            color: #9ca3af;
            padding: 4px 6px;
            display: inline-flex;
            align-items: center;
            vertical-align: middle;
            margin-left: 6px;
            border-radius: 4px;
        }

        .btn-action-view:hover {
            color: #111827;
            background-color: #f3f4f6;
        }

        .visits-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 16px 20px;
            border-top: 1px solid #f3f4f6;
            font-size: 12px;
            color: #6b7280;
        }

        .visits-pages {
            display: flex;
            gap: 6px;
        }

        .visits-page-btn {
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

        .visits-page-btn.active {
            background-color: #2563eb;
            color: #ffffff;
            border-color: #2563eb;
        }

        /* Confirmation / Edit Modal */
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

        .modal-field input, .modal-field textarea {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 13px;
            box-sizing: border-box;
            outline: none;
        }

        .modal-field input:focus, .modal-field textarea:focus {
            border-color: #2563eb;
        }

        .validation-error {
            color: #dc2626;
            font-size: 11px;
            font-weight: 500;
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

        .alert-box {
            padding: 12px 16px;
            border-radius: 8px;
            font-size: 13px;
            margin-bottom: 16px;
            background-color: #ecfdf5;
            color: #065f46;
            border: 1px solid #a7f3d0;
        }
        /* Ensure the action table header and cell have enough width and right alignment */
.visits-table th:last-child,
.visits-table td:last-child {
    text-align: right;
    min-width: 175px; /* Gives enough room so buttons never wrap */
    white-space: nowrap;
}

/* Flex container to keep Approve, Reject, and Eye in a straight line */
.actions-cell-wrapper {
    display: inline-flex;
    align-items: center;
    justify-content: flex-end;
    gap: 8px;
    white-space: nowrap;
}

/* Approve Button */
.btn-action-approve {
    background-color: #eff6ff;
    color: #2563eb;
    border: 1px solid #bfdbfe;
    border-radius: 6px;
    padding: 6px 12px;
    font-size: 12px;
    font-weight: 600;
    cursor: pointer;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    line-height: 1;
    transition: all 0.15s ease;
}

.btn-action-approve:hover {
    background-color: #2563eb;
    color: #ffffff;
}

/* Reject Button */
.btn-action-reject {
    background-color: #fef2f2;
    color: #ef4444;
    border: 1px solid #fecaca;
    border-radius: 6px;
    padding: 6px 12px;
    font-size: 12px;
    font-weight: 600;
    cursor: pointer;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    line-height: 1;
    transition: all 0.15s ease;
}

.btn-action-reject:hover {
    background-color: #ef4444;
    color: #ffffff;
}

/* View (Eye) Button */
.btn-action-view {
    background: none;
    border: none;
    cursor: pointer;
    color: #9ca3af;
    padding: 6px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    border-radius: 4px;
    transition: all 0.15s ease;
}

.btn-action-view:hover {
    color: #111827;
    background-color: #f3f4f6;
}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminMainContent" runat="server">
    <div class="visits-container">
        <div class="visits-header">
            <h1 class="visits-title">Visit Requests</h1>
        </div>

        <asp:Panel ID="pnlAlert" runat="server" Visible="false" CssClass="alert-box">
            <asp:Literal ID="litAlertMsg" runat="server" />
        </asp:Panel>

        <!-- Search and Status Filter Row -->
        <div class="visits-filter-bar">
            <div class="visit-search-box">
                <svg viewBox="0 0 24 24" fill="none" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="11" cy="11" r="8"></circle>
                    <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                </svg>
                <asp:TextBox ID="txtSearchVisits" runat="server" CssClass="visit-search-input" Placeholder="Search visit requests..." AutoPostBack="true" OnTextChanged="FilterVisits" />
            </div>

            <asp:DropDownList ID="ddlStatusFilter" runat="server" CssClass="status-dropdown" AutoPostBack="true" OnSelectedIndexChanged="FilterVisits">
                <asp:ListItem Value="All" Text="All Status" />
                <asp:ListItem Value="Pending" Text="Pending" />
                <asp:ListItem Value="Approved" Text="Approved" />
                <asp:ListItem Value="Rejected" Text="Rejected" />
            </asp:DropDownList>
        </div>

        <!-- Table Card -->
        <div class="visits-card">
            <table class="visits-table">
                <thead>
                    <tr>
                        <th style="width: 22%;">CUSTOMER</th>
                        <th style="width: 25%;">PROPERTY</th>
                        <th style="width: 23%;">VISIT DATE</th>
                        <th style="width: 14%;">STATUS</th>
                        <th style="width: 16%; text-align: right;">ACTIONS</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptVisits" runat="server" OnItemCommand="rptVisits_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td class="customer-name"><%# Eval("Customer") %></td>
                                <td><%# Eval("Property") %></td>
                                <td><%# Eval("VisitDate") %></td>
                                <td>
                                    <span class='status-badge <%# Eval("Status").ToString().ToLower() %>'>
                                        <%# Eval("Status") %>
                                    </span>
                                </td>
                                <td style="text-align: right;">
                                    <%-- Only show Approve / Reject buttons when Pending --%>
                                    <asp:PlaceHolder ID="phPendingActions" runat="server" Visible='<%# Eval("Status").ToString() == "Pending" %>'>
                                        <asp:LinkButton ID="btnApprove" runat="server" CssClass="btn-action-approve"
                                            CommandName="OpenConfirmModal" CommandArgument='<%# Eval("Id") %>' CausesValidation="false">Approve</asp:LinkButton>
                                        <asp:LinkButton ID="btnReject" runat="server" CssClass="btn-action-reject"
                                            CommandName="RejectVisit" CommandArgument='<%# Eval("Id") %>' CausesValidation="false"
                                            OnClientClick="return confirm('Are you sure you want to reject this visit request?');">Reject</asp:LinkButton>
                                    </asp:PlaceHolder>

                                    <!-- View Details Action -->
                                    <asp:LinkButton ID="btnViewVisit" runat="server" CssClass="btn-action-view"
                                        CommandName="ViewVisit" CommandArgument='<%# Eval("Id") %>' CausesValidation="false" title="View Details">
                                        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>

            <div class="visits-footer">
                <div>Showing 1–4 of 57 requests</div>
                <div class="visits-pages">
                    <span class="visits-page-btn active">1</span>
                    <span class="visits-page-btn">2</span>
                    <span class="visits-page-btn">3</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Confirm Visit Modal with .NET Validation -->
    <div id="confirmModal" class="modal-overlay">
        <div class="modal-box">
            <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:16px; border-bottom:1px solid #f3f4f6; padding-bottom:10px;">
                <h3 style="font-size:17px; font-weight:700; color:#111827; margin:0;">Confirm & Schedule Visit</h3>
                <button type="button" style="background:none; border:none; font-size:22px; cursor:pointer; color:#9ca3af;" onclick="closeConfirmModal();">&times;</button>
            </div>

            <asp:HiddenField ID="hfSelectedVisitId" runat="server" />

            <div class="modal-field">
                <label>Customer Name</label>
                <asp:TextBox ID="txtConfirmCustomer" runat="server" ReadOnly="true" BackColor="#f9fafb" />
            </div>

            <div class="modal-field">
                <label>Property</label>
                <asp:TextBox ID="txtConfirmProperty" runat="server" ReadOnly="true" BackColor="#f9fafb" />
            </div>

            <!-- Scheduled Date with RequiredFieldValidator -->
            <div class="modal-field">
                <label>Confirmed Date & Time <span style="color:#dc2626;">*</span></label>
                <asp:TextBox ID="txtConfirmedDate" runat="server" Placeholder="e.g. 08 Aug 2026, 11:00 AM" />
                <asp:RequiredFieldValidator ID="rfvVisitDate" runat="server"
                    ControlToValidate="txtConfirmedDate"
                    ErrorMessage="Visit date and time is required."
                    ValidationGroup="vgConfirmVisit"
                    Display="Dynamic"
                    CssClass="validation-error" />
            </div>

            <!-- Agent Assigned with RequiredFieldValidator -->
            <div class="modal-field">
                <label>Assign Broker / Agent <span style="color:#dc2626;">*</span></label>
                <asp:TextBox ID="txtAssignedAgent" runat="server" Placeholder="e.g. Ramesh Patel" />
                <asp:RequiredFieldValidator ID="rfvAgent" runat="server"
                    ControlToValidate="txtAssignedAgent"
                    ErrorMessage="Please assign an agent for the visit."
                    ValidationGroup="vgConfirmVisit"
                    Display="Dynamic"
                    CssClass="validation-error" />
            </div>

            <!-- Optional Agent Notes -->
            <div class="modal-field">
                <label>Instructions / Remarks for Customer</label>
                <asp:TextBox ID="txtVisitNotes" runat="server" TextMode="MultiLine" Rows="2" Placeholder="Enter any entry guidelines or instructions..." />
            </div>

            <div class="modal-btn-row">
                <button type="button" style="height:36px; padding:0 14px; border:1px solid #d1d5db; background:#fff; border-radius:6px; cursor:pointer;" onclick="closeConfirmModal();">Cancel</button>
                <asp:Button ID="btnSubmitConfirm" runat="server" Text="Confirm & Approve Visit"
                    ValidationGroup="vgConfirmVisit"
                    CausesValidation="true"
                    OnClick="btnSubmitConfirm_Click"
                    style="height:36px; padding:0 18px; border:none; background:#2563eb; color:#fff; border-radius:6px; font-weight:600; cursor:pointer;" />
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function openConfirmModal() {
            var m = document.getElementById("confirmModal");
            if (m) m.classList.add("active");
        }

        function closeConfirmModal() {
            var m = document.getElementById("confirmModal");
            if (m) m.classList.remove("active");
        }

        window.onclick = function (e) {
            var m = document.getElementById("confirmModal");
            if (e.target === m) closeConfirmModal();
        };
    </script>
</asp:Content>
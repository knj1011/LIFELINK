<%@ Page Title="Manage Requests" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Requests.aspx.cs" Inherits="Lifelink.Admin.Requests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .requests-container {
            padding: 25px;
            background: #F8F9FF;
            min-height: 80vh;
        }

        .page-title {
            color: #204077;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .page-description {
            color: #6B7280;
            margin-bottom: 25px;
        }

        .requests-card {
            background: #FFFFFF;
            border: 1px solid #DCE6F5;
            border-radius: 12px;
            padding: 22px;
            box-shadow: 0 3px 12px rgba(32, 64, 119, 0.06);
        }

        .search-box {
            padding: 10px 12px;
            width: 260px;
            max-width: 100%;
            border: 1px solid #DCE6F5;
            border-radius: 6px;
            margin: 0 8px 10px 0;
        }

        .admin-button {
            background: #0066D9;
            color: white;
            border: none;
            padding: 10px 16px;
            border-radius: 6px;
            cursor: pointer;
            margin: 0 6px 10px 0;
        }

        .admin-button:hover {
            background: #0055B8;
        }

        .message {
            display: block;
            margin: 12px 0;
            color: #204077;
        }

        .requests-grid {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        .requests-grid th {
            background: #204077;
            color: white;
            padding: 12px 10px;
            text-align: left;
        }

        .requests-grid td {
            padding: 11px 10px;
            border-bottom: 1px solid #DCE6F5;
        }

        .requests-grid tr:nth-child(even) {
            background: #F8F9FF;
        }

        .table-scroll {
            overflow-x: auto;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="requests-container">
        <div class="page-title">Manage Service Requests</div>
        <div class="page-description">
            View and search blood, food assistance, emergency, and volunteer requests.
        </div>

        <div class="requests-card">
            <asp:TextBox ID="txtSearch" runat="server"
                CssClass="search-box"
                placeholder="Search by requester, type, or status">
            </asp:TextBox>

            <asp:Button ID="btnSearch" runat="server"
                Text="Search"
                CssClass="admin-button"
                OnClick="btnSearch_Click" />

            <asp:Button ID="btnShowAll" runat="server"
                Text="Show All"
                CssClass="admin-button"
                CausesValidation="false"
                OnClick="btnShowAll_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

            <asp:Label ID="lblRequestCount" runat="server"
                Font-Bold="true"
                ForeColor="#204077">
            </asp:Label>

            <div class="table-scroll">
                <asp:GridView ID="gvRequests" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="requests-grid"
                    GridLines="None"
                    EmptyDataText="No service requests found."
                    AllowPaging="true"
                    PageSize="10"
                    OnPageIndexChanging="gvRequests_PageIndexChanging">

                    <Columns>
                        <asp:BoundField DataField="RequestID" HeaderText="Request ID" />
                        <asp:BoundField DataField="RequesterName" HeaderText="Requester" />
                        <asp:BoundField DataField="RequestType" HeaderText="Request Type" />
                        <asp:BoundField DataField="ContactNumber" HeaderText="Contact Number" />
                        <asp:BoundField DataField="RequestDetails" HeaderText="Details" />
                        <asp:BoundField DataField="RequestStatus" HeaderText="Status" />
                        <asp:BoundField DataField="SubmittedDate" HeaderText="Submitted Date"
                            DataFormatString="{0:dd-MMM-yyyy}" />
                    </Columns>

                    <PagerStyle HorizontalAlign="Center" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>


<%@ Page Title="User Management"
    Language="C#"
    MasterPageFile="~/Admin/Admin.Master"
    AutoEventWireup="true"
    CodeBehind="Users.aspx.cs"
    Inherits="Lifelink.Admin.Users" %>

<asp:Content ID="HeadContent"
    ContentPlaceHolderID="head"
    runat="server">

    <style>
        .users-page {
            padding: 25px;
        }

        .users-title {
            color: #204077;
            font-size: 28px;
            margin: 0 0 8px;
        }

        .users-description {
            color: #6B7280;
            margin-bottom: 22px;
        }

        .users-toolbar {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .users-search {
            padding: 11px 12px;
            width: 300px;
            max-width: 100%;
            border: 1px solid #DCE6F5;
            border-radius: 8px;
            font-size: 14px;
        }

        .users-button {
            padding: 11px 18px;
            background: #0066D9;
            color: #FFFFFF;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        .users-button:hover {
            background: #0055B8;
        }

        .users-table-wrapper {
            overflow-x: auto;
            background: #FFFFFF;
            border: 1px solid #DCE6F5;
            border-radius: 10px;
        }

        .users-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 850px;
        }

        .users-table th {
            background: #EFF4FF;
            color: #204077;
            padding: 13px;
            text-align: left;
            white-space: nowrap;
        }

        .users-table td {
            padding: 12px;
            border-top: 1px solid #DCE6F5;
            color: #1E1E1E;
        }

        .users-table tr:hover td {
            background: #F8F9FF;
        }

        .users-message {
            display: block;
            margin: 15px 0;
            color: #B42318;
        }

        .users-count {
            color: #6B7280;
            margin-bottom: 12px;
        }
    </style>

</asp:Content>

<asp:Content ID="MainContent"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="users-page">

        <h1 class="users-title">User Management</h1>

        <p class="users-description">
            View and search registered LifeLink users.
        </p>

        <div class="users-toolbar">

            <asp:TextBox ID="txtSearch"
                runat="server"
                CssClass="users-search"
                MaxLength="150"
                placeholder="Search by name or email" />

            <asp:Button ID="btnSearch"
                runat="server"
                Text="Search"
                CssClass="users-button"
                CausesValidation="false"
                OnClick="btnSearch_Click" />

            <asp:Button ID="btnShowAll"
                runat="server"
                Text="Show All"
                CssClass="users-button"
                CausesValidation="false"
                OnClick="btnShowAll_Click" />

        </div>

        <asp:Label ID="lblUserCount"
            runat="server"
            CssClass="users-count" />

        <asp:Label ID="lblMessage"
            runat="server"
            CssClass="users-message"
            EnableViewState="false" />

        <div class="users-table-wrapper">

            <asp:GridView ID="gvUsers"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="users-table"
                GridLines="None"
                EmptyDataText="No users found."
                UseAccessibleHeader="true">

                <Columns>

                    <asp:BoundField
                        DataField="UserID"
                        HeaderText="User ID" />

                    <asp:BoundField
                        DataField="FullName"
                        HeaderText="Full Name" />

                    <asp:BoundField
                        DataField="Email"
                        HeaderText="Email Address" />

                    <asp:BoundField
                        DataField="ContactNumber"
                        HeaderText="Contact Number" />

                    <asp:BoundField
                        DataField="Role"
                        HeaderText="Role" />

                    <asp:BoundField
                        DataField="AccountStatus"
                        HeaderText="Account Status" />

                    <asp:BoundField
                        DataField="CreatedDate"
                        HeaderText="Registration Date"
                        DataFormatString="{0:dd MMM yyyy}"
                        HtmlEncode="false" />

                </Columns>

            </asp:GridView>

        </div>

    </div>

</asp:Content>

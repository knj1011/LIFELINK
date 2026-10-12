<%@ Page Title="Donor Management"
    Language="C#"
    MasterPageFile="~/Admin/Admin.Master"
    AutoEventWireup="true"
    CodeBehind="Donors.aspx.cs"
    Inherits="Lifelink.Admin.Donors" %>

<asp:Content ID="HeadContent"
    ContentPlaceHolderID="head"
    runat="server">

    <style>
        .donors-page {
            padding: 25px;
        }

        .donors-title {
            color: #204077;
            font-size: 28px;
            margin: 0 0 8px;
        }

        .donors-description {
            color: #6B7280;
            margin-bottom: 22px;
        }

        .donors-toolbar {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .donors-search {
            width: 300px;
            max-width: 100%;
            padding: 11px 12px;
            border: 1px solid #DCE6F5;
            border-radius: 8px;
            font-size: 14px;
        }

        .donors-button {
            padding: 11px 18px;
            background: #0066D9;
            color: #FFFFFF;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        .donors-button:hover {
            background: #0055B8;
        }

        .donors-table-wrapper {
            overflow-x: auto;
            background: #FFFFFF;
            border: 1px solid #DCE6F5;
            border-radius: 10px;
        }

        .donors-table {
            width: 100%;
            min-width: 500px;
            border-collapse: collapse;
        }

        .donors-table th {
            background: #EFF4FF;
            color: #204077;
            padding: 13px;
            text-align: left;
        }

        .donors-table td {
            padding: 12px;
            border-top: 1px solid #DCE6F5;
        }

        .donors-table tr:hover td {
            background: #F8F9FF;
        }

        .donors-count {
            display: block;
            color: #6B7280;
            margin-bottom: 12px;
        }

        .donors-message {
            display: block;
            color: #B42318;
            margin: 12px 0;
        }
    </style>

</asp:Content>

<asp:Content ID="MainContent"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="donors-page">

        <h1 class="donors-title">Donor Management</h1>

        <p class="donors-description">
            View and search registered blood donors.
        </p>

        <div class="donors-toolbar">

            <asp:TextBox ID="txtSearch"
                runat="server"
                CssClass="donors-search"
                MaxLength="150"
                placeholder="Search by name, blood group or contact" />

            <asp:Button ID="btnSearch"
                runat="server"
                Text="Search"
                CssClass="donors-button"
                CausesValidation="false"
                OnClick="btnSearch_Click" />

            <asp:Button ID="btnShowAll"
                runat="server"
                Text="Show All"
                CssClass="donors-button"
                CausesValidation="false"
                OnClick="btnShowAll_Click" />

        </div>

        <asp:Label ID="lblDonorCount"
            runat="server"
            CssClass="donors-count" />

        <asp:Label ID="lblMessage"
            runat="server"
            CssClass="donors-message"
            EnableViewState="false" />

        <div class="donors-table-wrapper">

            <asp:GridView ID="gvDonors"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="donors-table"
                GridLines="None"
                EmptyDataText="No donors found."
                UseAccessibleHeader="true">

                <Columns>
                    <asp:BoundField
                        DataField="FullName"
                        HeaderText="Donor Name" />

                    <asp:BoundField
                        DataField="BloodGroup"
                        HeaderText="Blood Group" />

                    <asp:BoundField
                        DataField="ContactNumber"
                        HeaderText="Contact Number" />
                </Columns>

            </asp:GridView>

        </div>

    </div>

</asp:Content>


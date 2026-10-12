<%@ Page Title="Resource Search" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResourceSearch.aspx.cs" Inherits="Lifelink.ResourceSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="resource-page">

        <div class="resource-header">
            <h1>Find Community Resources</h1>
            <p>Search for support and resources available in your community.</p>
        </div>

        <div class="resource-search-card">
            <h2>Search Resources</h2>

            <div class="resource-form-grid">

                <div class="resource-field">
                    <asp:Label ID="lblKeyword" runat="server"
                        AssociatedControlID="txtKeyword"
                        Text="Resource Name or Keyword" />

                    <asp:TextBox ID="txtKeyword" runat="server"
                        CssClass="resource-input"
                        MaxLength="100"
                        placeholder="e.g. food, medical help, shelter" />
                </div>

                <div class="resource-field">
                    <asp:Label ID="lblCategory" runat="server"
                        AssociatedControlID="ddlCategory"
                        Text="Resource Category" />

                    <asp:DropDownList ID="ddlCategory" runat="server"
                        CssClass="resource-input">
                        <asp:ListItem Text="All Categories" Value="" />
                        <asp:ListItem Text="Food Assistance" Value="Food Assistance" />
                        <asp:ListItem Text="Medical Assistance" Value="Medical Assistance" />
                        <asp:ListItem Text="Blood Assistance" Value="Blood Assistance" />
                        <asp:ListItem Text="Emergency Help" Value="Emergency Help" />
                        <asp:ListItem Text="Shelter" Value="Shelter" />
                        <asp:ListItem Text="Other" Value="Other" />
                    </asp:DropDownList>
                </div>

                <div class="resource-field resource-full-width">
                    <asp:Label ID="lblLocation" runat="server"
                        AssociatedControlID="txtLocation"
                        Text="City or Location" />

                    <asp:TextBox ID="txtLocation" runat="server"
                        CssClass="resource-input"
                        MaxLength="100"
                        placeholder="Enter city or location" />
                </div>

            </div>

            <asp:Button ID="btnSearch" runat="server"
                Text="Search Resources"
                CssClass="resource-search-button"
                OnClick="btnSearch_Click" />

            <asp:Label ID="lblMessage" runat="server"
                CssClass="resource-message"
                EnableViewState="false" />
        </div>

        <div class="resource-results-card">
            <h2>Available Resources</h2>

            <asp:GridView ID="gvResources" runat="server"
                AutoGenerateColumns="False"
                CssClass="resource-table"
                GridLines="None"
                Width="100%"
                EmptyDataText="No resources to display. Enter search details and click Search Resources.">

                <Columns>
                    <asp:BoundField DataField="ResourceName"
                        HeaderText="Resource Name" />

                    <asp:BoundField DataField="Category"
                        HeaderText="Category" />

                    <asp:BoundField DataField="Description"
                        HeaderText="Description" />

                    <asp:BoundField DataField="Location"
                        HeaderText="Location" />

                    <asp:BoundField DataField="ContactNumber"
                        HeaderText="Contact Number" />
                </Columns>

            </asp:GridView>
        </div>

    </div>

    <style>
        .resource-page {
            max-width: 1100px;
            margin: 35px auto;
            padding: 0 20px;
            color: #1E1E1E;
        }

        .resource-header {
            margin-bottom: 25px;
        }

        .resource-header h1 {
            color: #204077;
            font-size: 32px;
            margin-bottom: 8px;
        }

        .resource-header p {
            color: #6B7280;
            margin: 0;
        }

        .resource-search-card,
        .resource-results-card {
            background: #FFFFFF;
            border: 1px solid #DCE6F5;
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 4px 15px rgba(32, 64, 119, 0.05);
        }

        .resource-search-card h2,
        .resource-results-card h2 {
            color: #204077;
            font-size: 21px;
            margin: 0 0 20px;
        }

        .resource-form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 20px;
        }

        .resource-field label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .resource-full-width {
            grid-column: 1 / -1;
        }

        .resource-input {
            box-sizing: border-box;
            width: 100%;
            padding: 12px;
            border: 1px solid #DCE6F5;
            border-radius: 7px;
            background: #F8F9FF;
            font-size: 15px;
        }

        .resource-input:focus {
            outline: none;
            border-color: #0066D9;
        }

        .resource-search-button {
            margin-top: 22px;
            padding: 12px 24px;
            border: none;
            border-radius: 7px;
            background: #0066D9;
            color: #FFFFFF;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
        }

        .resource-search-button:hover {
            background: #0055B8;
        }

        .resource-message {
            display: block;
            margin-top: 15px;
        }

        .resource-table {
            border-collapse: collapse;
        }

        .resource-table th {
            background: #EFF4FF;
            color: #204077;
            text-align: left;
            padding: 13px;
        }

        .resource-table td {
            padding: 13px;
            border-bottom: 1px solid #DCE6F5;
            overflow-wrap: anywhere;
        }

        @media (max-width: 650px) {
            .resource-form-grid {
                grid-template-columns: 1fr;
            }

            .resource-full-width {
                grid-column: auto;
            }

            .resource-search-card,
            .resource-results-card {
                padding: 16px;
            }

            .resource-header h1 {
                font-size: 26px;
            }
        }
    </style>

</asp:Content>


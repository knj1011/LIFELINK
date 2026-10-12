<%@ Page Title="Find Blood Donors" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FindBloodDonor.aspx.cs" Inherits="Lifelink.FindBloodDonor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="donor-page">

        <div class="donor-header">
            <h1>Find Blood Donors</h1>
            <p>Search for blood donors by blood group and location.</p>
        </div>

        <div class="donor-search-card">
            <h2>Search for a Donor</h2>

            <div class="donor-form-grid">

                <div class="donor-field">
                    <asp:Label ID="lblBloodGroup" runat="server"
                        AssociatedControlID="ddlBloodGroup"
                        Text="Blood Group" />

                    <asp:DropDownList ID="ddlBloodGroup" runat="server"
                        CssClass="donor-input">
                        <asp:ListItem Text="Select blood group" Value="" />
                        <asp:ListItem Text="A+" Value="A+" />
                        <asp:ListItem Text="A-" Value="A-" />
                        <asp:ListItem Text="B+" Value="B+" />
                        <asp:ListItem Text="B-" Value="B-" />
                        <asp:ListItem Text="AB+" Value="AB+" />
                        <asp:ListItem Text="AB-" Value="AB-" />
                        <asp:ListItem Text="O+" Value="O+" />
                        <asp:ListItem Text="O-" Value="O-" />
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ID="rfvBloodGroup"
                        runat="server"
                        ControlToValidate="ddlBloodGroup"
                        InitialValue=""
                        ErrorMessage="Please select a blood group."
                        CssClass="field-error"
                        Display="Dynamic"
                        ValidationGroup="DonorSearch" />
                </div>

                <div class="donor-field">
                    <asp:Label ID="lblLocation" runat="server"
                        AssociatedControlID="txtLocation"
                        Text="City or Location" />

                    <asp:TextBox ID="txtLocation" runat="server"
                        CssClass="donor-input"
                        MaxLength="100"
                        placeholder="Enter city or location" />

                    <asp:RequiredFieldValidator ID="rfvLocation"
                        runat="server"
                        ControlToValidate="txtLocation"
                        ErrorMessage="Please enter a location."
                        CssClass="field-error"
                        Display="Dynamic"
                        ValidationGroup="DonorSearch" />
                </div>

            </div>

            <asp:Button ID="btnSearch" runat="server"
                Text="Search Donors"
                CssClass="donor-search-button"
                OnClick="btnSearch_Click"
                ValidationGroup="DonorSearch" />

            <asp:Label ID="lblMessage" runat="server"
                CssClass="donor-message"
                EnableViewState="false" />
        </div>

        <div class="donor-results-card">
            <h2>Search Results</h2>

            <asp:GridView ID="gvDonors" runat="server"
                AutoGenerateColumns="False"
                CssClass="donor-table"
                GridLines="None"
                EmptyDataText="No donors to display. Select a blood group and location to search."
                Width="100%">

                <Columns>
                    <asp:BoundField DataField="FullName"
                        HeaderText="Donor Name" />

                    <asp:BoundField DataField="BloodGroup"
                        HeaderText="Blood Group" />

                    <asp:BoundField DataField="ContactNumber"
                        HeaderText="Contact Number" />

                    <asp:BoundField DataField="City"
                        HeaderText="Location" />
                </Columns>

            </asp:GridView>
        </div>

    </div>

    <style>
        .donor-page {
            max-width: 1100px;
            margin: 35px auto;
            padding: 0 20px;
            color: #1E1E1E;
        }

        .donor-header {
            margin-bottom: 25px;
        }

        .donor-header h1 {
            color: #204077;
            font-size: 32px;
            margin-bottom: 8px;
        }

        .donor-header p {
            color: #6B7280;
            margin: 0;
        }

        .donor-search-card,
        .donor-results-card {
            background: #FFFFFF;
            border: 1px solid #DCE6F5;
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 4px 15px rgba(32, 64, 119, 0.05);
        }

        .donor-search-card h2,
        .donor-results-card h2 {
            color: #204077;
            font-size: 21px;
            margin: 0 0 20px;
        }

        .donor-form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 20px;
        }

        .donor-field label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .donor-input {
            box-sizing: border-box;
            width: 100%;
            padding: 12px;
            border: 1px solid #DCE6F5;
            border-radius: 7px;
            background: #F8F9FF;
            font-size: 15px;
        }

        .donor-input:focus {
            outline: none;
            border-color: #0066D9;
        }

        .field-error {
            display: block;
            color: #C62828;
            font-size: 13px;
            margin-top: 5px;
        }

        .donor-search-button {
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

        .donor-search-button:hover {
            background: #0055B8;
        }

        .donor-message {
            display: block;
            margin-top: 15px;
        }

        .donor-table {
            border-collapse: collapse;
        }

        .donor-table th {
            background: #EFF4FF;
            color: #204077;
            text-align: left;
            padding: 13px;
        }

        .donor-table td {
            padding: 13px;
            border-bottom: 1px solid #DCE6F5;
            overflow-wrap: anywhere;
        }

        @media (max-width: 650px) {
            .donor-form-grid {
                grid-template-columns: 1fr;
            }

            .donor-search-card,
            .donor-results-card {
                padding: 16px;
            }

            .donor-header h1 {
                font-size: 26px;
            }
        }
    </style>

</asp:Content>


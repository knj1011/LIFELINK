<%@ Page Title="Manage Volunteers" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Volunteers.aspx.cs" Inherits="Lifelink.Admin.Volunteers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .volunteers-container {
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

        .volunteers-card {
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

        .volunteers-grid {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        .volunteers-grid th {
            background: #204077;
            color: white;
            padding: 12px 10px;
            text-align: left;
        }

        .volunteers-grid td {
            padding: 11px 10px;
            border-bottom: 1px solid #DCE6F5;
        }

        .volunteers-grid tr:nth-child(even) {
            background: #F8F9FF;
        }

        .table-scroll {
            overflow-x: auto;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="volunteers-container">
        <div class="page-title">Manage Volunteers</div>

        <div class="page-description">
            View registered volunteers, their activities, availability, and registration status.
        </div>

        <div class="volunteers-card">
            <asp:TextBox ID="txtSearch" runat="server"
                CssClass="search-box"
                placeholder="Search by name, email, or activity">
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

            <asp:Label ID="lblMessage" runat="server"
                CssClass="message">
            </asp:Label>

            <asp:Label ID="lblVolunteerCount" runat="server"
                Font-Bold="true"
                ForeColor="#204077">
            </asp:Label>

            <div class="table-scroll">
                <asp:GridView ID="gvVolunteers" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="volunteers-grid"
                    GridLines="None"
                    EmptyDataText="No volunteer registrations found."
                    AllowPaging="true"
                    PageSize="10"
                    OnPageIndexChanging="gvVolunteers_PageIndexChanging">

                    <Columns>
                        <asp:BoundField DataField="VolunteerID" HeaderText="ID" />
                        <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="ContactNumber" HeaderText="Contact Number" />
                        <asp:BoundField DataField="VolunteerActivity" HeaderText="Activity" />
                        <asp:BoundField DataField="Availability" HeaderText="Availability" />
                        <asp:BoundField DataField="RegistrationStatus" HeaderText="Status" />
                        <asp:BoundField DataField="RegisteredDate" HeaderText="Registered Date"
                            DataFormatString="{0:dd-MMM-yyyy}" />
                    </Columns>

                    <PagerStyle HorizontalAlign="Center" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>


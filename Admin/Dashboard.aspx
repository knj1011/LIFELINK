<%@ Page Title="Admin Dashboard"
    Language="C#"
    MasterPageFile="~/Admin/Admin.Master"
    AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs"
    Inherits="Lifelink.Admin.Dashboard" %>

<asp:Content ID="HeadContent"
    ContentPlaceHolderID="head"
    runat="server">

    <style>
        .dashboard-page {
            padding: 25px;
            color: #1E1E1E;
        }

        .dashboard-title {
            color: #204077;
            margin: 0 0 8px;
            font-size: 28px;
        }

        .dashboard-description {
            color: #6B7280;
            margin-bottom: 25px;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(190px, 1fr));
            gap: 20px;
            margin-top: 25px;
        }

        .stat-card {
            background: #FFFFFF;
            border: 1px solid #DCE6F5;
            border-radius: 12px;
            padding: 22px;
            box-shadow: 0 4px 14px rgba(32, 64, 119, 0.05);
        }

        .stat-card h3 {
            color: #6B7280;
            font-size: 14px;
            font-weight: normal;
            margin: 0 0 15px;
        }

        .stat-number {
            display: block;
            color: #204077;
            font-size: 30px;
            font-weight: bold;
        }

        .dashboard-message {
            display: block;
            color: #B42318;
            margin-top: 18px;
        }

        .quick-links {
            margin-top: 30px;
            padding: 22px;
            background: #FFFFFF;
            border: 1px solid #DCE6F5;
            border-radius: 12px;
        }

        .quick-links h2 {
            color: #204077;
            font-size: 20px;
            margin-top: 0;
        }

        .quick-links a {
            display: inline-block;
            margin: 8px 12px 8px 0;
            padding: 10px 14px;
            color: #0066D9;
            background: #EFF4FF;
            border-radius: 7px;
            text-decoration: none;
        }

        .quick-links a:hover {
            background: #D3E4FE;
        }
    </style>

</asp:Content>

<asp:Content ID="MainContent"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="dashboard-page">

        <h1 class="dashboard-title">Admin Dashboard</h1>

        <p class="dashboard-description">
            Welcome to the LifeLink Administration Panel.
            View an overview of users, requests, and volunteers.
        </p>

        <div class="dashboard-grid">

            <div class="stat-card">
                <h3>Total Users</h3>
                <asp:Label ID="lblTotalUsers"
                    runat="server"
                    CssClass="stat-number"
                    Text="0" />
            </div>

            <div class="stat-card">
                <h3>Total Service Requests</h3>
                <asp:Label ID="lblTotalRequests"
                    runat="server"
                    CssClass="stat-number"
                    Text="0" />
            </div>

            <div class="stat-card">
                <h3>Blood Requests</h3>
                <asp:Label ID="lblBloodRequests"
                    runat="server"
                    CssClass="stat-number"
                    Text="0" />
            </div>

            <div class="stat-card">
                <h3>Volunteer Registrations</h3>
                <asp:Label ID="lblVolunteers"
                    runat="server"
                    CssClass="stat-number"
                    Text="0" />
            </div>

        </div>

        <asp:Label ID="lblMessage"
            runat="server"
            CssClass="dashboard-message"
            EnableViewState="false" />

        <div class="quick-links">
            <h2>Quick Access</h2>

            <a href="Users.aspx">Manage Users</a>
            <a href="Requests.aspx">Manage Requests</a>
            <a href="Donors.aspx">Manage Donors</a>
            <a href="Volunteers.aspx">Manage Volunteers</a>
            <a href="Feedback.aspx">View Feedback</a>
            <a href="AdminProfile.aspx">Admin Profile</a>
        </div>

    </div>

</asp:Content>


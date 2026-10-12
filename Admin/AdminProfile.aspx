<%@ Page Title="Admin Profile" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminProfile.aspx.cs" Inherits="Lifelink.Admin.AdminProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .profile-container {
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

        .profile-card {
            max-width: 750px;
            background: #FFFFFF;
            border: 1px solid #DCE6F5;
            border-radius: 12px;
            padding: 28px;
            box-shadow: 0 3px 12px rgba(32, 64, 119, 0.06);
        }

        .profile-header {
            display: flex;
            align-items: center;
            gap: 18px;
            padding-bottom: 22px;
            margin-bottom: 20px;
            border-bottom: 1px solid #DCE6F5;
        }

        .profile-icon {
            width: 72px;
            height: 72px;
            border-radius: 50%;
            background: #EFF4FF;
            color: #0066D9;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            font-weight: bold;
        }

        .profile-name {
            color: #204077;
            font-size: 23px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .profile-role {
            color: #6B7280;
            font-size: 14px;
        }

        .profile-row {
            display: grid;
            grid-template-columns: 190px 1fr;
            gap: 15px;
            padding: 15px 0;
            border-bottom: 1px solid #EDF1F8;
        }

        .profile-label {
            color: #6B7280;
            font-weight: 600;
        }

        .profile-value {
            color: #1E1E1E;
            overflow-wrap: anywhere;
        }

        .message {
            display: block;
            margin-top: 18px;
            color: #204077;
        }

        @media (max-width: 600px) {
            .profile-container {
                padding: 15px;
            }

            .profile-card {
                padding: 18px;
            }

            .profile-row {
                grid-template-columns: 1fr;
                gap: 6px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="profile-container">
        <div class="page-title">Admin Profile</div>

        <div class="page-description">
            View your administrator account information.
        </div>

        <div class="profile-card">
            <div class="profile-header">
                <div class="profile-icon">A</div>

                <div>
                    <div class="profile-name">
                        <asp:Label ID="lblFullName" runat="server" Text="Administrator" />
                    </div>

                    <div class="profile-role">
                        <asp:Label ID="lblRole" runat="server" />
                    </div>
                </div>
            </div>

            <div class="profile-row">
                <div class="profile-label">Admin ID</div>
                <div class="profile-value">
                    <asp:Label ID="lblAdminID" runat="server" />
                </div>
            </div>

            <div class="profile-row">
                <div class="profile-label">Full Name</div>
                <div class="profile-value">
                    <asp:Label ID="lblNameDetails" runat="server" />
                </div>
            </div>

            <div class="profile-row">
                <div class="profile-label">Email Address</div>
                <div class="profile-value">
                    <asp:Label ID="lblEmail" runat="server" />
                </div>
            </div>

            <div class="profile-row">
                <div class="profile-label">Contact Number</div>
                <div class="profile-value">
                    <asp:Label ID="lblContactNumber" runat="server" />
                </div>
            </div>

            <div class="profile-row">
                <div class="profile-label">Account Status</div>
                <div class="profile-value">
                    <asp:Label ID="lblAccountStatus" runat="server" />
                </div>
            </div>

            <div class="profile-row">
                <div class="profile-label">Account Created</div>
                <div class="profile-value">
                    <asp:Label ID="lblCreatedDate" runat="server" />
                </div>
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="message" />
        </div>
    </div>
</asp:Content>


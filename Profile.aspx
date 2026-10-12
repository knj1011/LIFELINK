
<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Profile.aspx.cs"
    Inherits="Lifelink.Profile" %>

<!DOCTYPE html>
<html lang="en">

<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0" />

    <title>My Profile - LifeLink</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: #F8F9FF;
            color: #1E1E1E;
        }

        .profile-wrapper {
            min-height: 100vh;
            padding: 50px 20px;
        }

        .profile-container {
            max-width: 850px;
            margin: 0 auto;
        }

        .profile-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .logo {
            font-size: 28px;
            font-weight: 700;
            color: #204077;
            margin-bottom: 15px;
        }

        .logo span {
            color: #0066D9;
        }

        .profile-title {
            font-size: 30px;
            color: #204077;
            margin: 0 0 8px;
        }

        .profile-subtitle {
            color: #6B7280;
            font-size: 14px;
        }

        .profile-card {
            background: #FFFFFF;
            border: 1px solid #DCE6F5;
            border-radius: 12px;
            padding: 35px;
            box-shadow: 0 8px 25px rgba(32, 64, 119, 0.08);
        }

        .profile-message {
            display: block;
            text-align: center;
            color: #0066D9;
            font-size: 14px;
            margin-bottom: 20px;
        }

        .profile-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 22px;
        }

        .profile-field {
            background: #F8F9FF;
            border: 1px solid #DCE6F5;
            border-radius: 8px;
            padding: 16px;
        }

        .profile-field.full-width {
            grid-column: 1 / -1;
        }

        .field-label {
            display: block;
            font-size: 12px;
            font-weight: 700;
            color: #6B7280;
            margin-bottom: 7px;
            text-transform: uppercase;
            letter-spacing: 0.4px;
        }

        .field-value {
            display: block;
            font-size: 15px;
            color: #204077;
            font-weight: 600;
            word-break: break-word;
        }

        .profile-actions {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 15px;
            margin-top: 30px;
        }

        .action-button {
            display: inline-block;
            padding: 12px 24px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            text-align: center;
        }

        .edit-button {
            background: #0066D9;
            color: #FFFFFF;
        }

        .edit-button:hover {
            background: #0055B8;
        }

        .password-button {
            background: #EFF4FF;
            color: #0066D9;
            border: 1px solid #D3E4FE;
        }

        .password-button:hover {
            background: #D3E4FE;
        }

        .requests-button {
            background: #204077;
            color: #FFFFFF;
            border: 1px solid #204077;
        }

        .requests-button:hover {
            background: #17325F;
        }

        .logout-button {
            background: #FFF0F0;
            color: #C62828;
            border: 1px solid #F2CACA;
        }

        .logout-button:hover {
            background: #FFE0E0;
        }

        .back-button {
            display: block;
            text-align: center;
            margin-top: 22px;
            color: #0066D9;
            text-decoration: none;
            font-size: 14px;
        }

        .back-button:hover {
            text-decoration: underline;
        }

        @media (max-width: 650px) {
            .profile-wrapper {
                padding: 30px 15px;
            }

            .profile-card {
                padding: 25px 20px;
            }

            .profile-grid {
                grid-template-columns: 1fr;
            }

            .profile-field.full-width {
                grid-column: auto;
            }

            .profile-actions {
                flex-direction: column;
            }

            .action-button {
                width: 100%;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="profile-wrapper">
            <div class="profile-container">

                <div class="profile-header">
                    <div class="logo">
                        Life<span>Link</span>
                    </div>

                    <h1 class="profile-title">My Profile</h1>

                    <p class="profile-subtitle">
                        View your LifeLink account information.
                    </p>
                </div>

                <div class="profile-card">

                    <asp:Label
                        ID="lblMessage"
                        runat="server"
                        CssClass="profile-message">
                    </asp:Label>

                    <div class="profile-grid">

                        <div class="profile-field">
                            <span class="field-label">Full Name</span>
                            <asp:Label ID="lblFullName"
                                runat="server"
                                CssClass="field-value">
                            </asp:Label>
                        </div>

                        <div class="profile-field">
                            <span class="field-label">Email</span>
                            <asp:Label ID="lblEmail"
                                runat="server"
                                CssClass="field-value">
                            </asp:Label>
                        </div>

                        <div class="profile-field">
                            <span class="field-label">Contact Number</span>
                            <asp:Label ID="lblContactNumber"
                                runat="server"
                                CssClass="field-value">
                            </asp:Label>
                        </div>

                        <div class="profile-field">
                            <span class="field-label">Gender</span>
                            <asp:Label ID="lblGender"
                                runat="server"
                                CssClass="field-value">
                            </asp:Label>
                        </div>

                        <div class="profile-field full-width">
                            <span class="field-label">Address</span>
                            <asp:Label ID="lblAddress"
                                runat="server"
                                CssClass="field-value">
                            </asp:Label>
                        </div>

                        <div class="profile-field">
                            <span class="field-label">Role</span>
                            <asp:Label ID="lblRole"
                                runat="server"
                                CssClass="field-value">
                            </asp:Label>
                        </div>

                        <div class="profile-field">
                            <span class="field-label">Account Status</span>
                            <asp:Label ID="lblAccountStatus"
                                runat="server"
                                CssClass="field-value">
                            </asp:Label>
                        </div>

                    </div>

                    <div class="profile-actions">

                        <a href="EditProfile.aspx"
                           class="action-button edit-button">
                            Edit Profile
                        </a>

                        <a href="UpdatePassword.aspx"
                           class="action-button password-button">
                            Update Password
                        </a>

                        <a href="MyRequests.aspx"
                           class="action-button requests-button">
                            My Requests
                        </a>

                        <a href="Logout.aspx"
                           class="action-button logout-button">
                            Logout
                        </a>

                    </div>

                    <a href="Home.aspx" class="back-button">
                        Back to Home
                    </a>

                </div>
            </div>
        </div>

    </form>
</body>
</html>
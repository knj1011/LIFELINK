<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="UpdatePassword.aspx.cs"
    Inherits="Lifelink.UpdatePassword" %>

<!DOCTYPE html>

<html lang="en">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0" />

    <title>Update Password - LifeLink</title>

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

        .update-wrapper {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px 20px;
        }

        .update-card {
            width: 100%;
            max-width: 430px;
            background: #FFFFFF;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 30px rgba(32, 64, 119, 0.10);
        }

        .logo {
            text-align: center;
            font-size: 28px;
            font-weight: 700;
            color: #204077;
            margin-bottom: 25px;
        }

        .logo span {
            color: #0066D9;
        }

        .title {
            text-align: center;
            font-size: 24px;
            font-weight: 700;
            color: #204077;
            margin-bottom: 10px;
        }

        .description {
            text-align: center;
            color: #6B7280;
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 28px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 8px;
            color: #204077;
        }

        .form-control {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #DCE6F5;
            border-radius: 6px;
            font-size: 14px;
            outline: none;
        }

        .form-control:focus {
            border-color: #0066D9;
        }

        .validation-error {
            display: block;
            color: #C62828;
            font-size: 12px;
            margin-top: 6px;
        }

        .message {
            display: block;
            color: #0066D9;
            font-size: 13px;
            margin-bottom: 15px;
            text-align: center;
        }

        .update-button {
            width: 100%;
            padding: 13px;
            border: none;
            border-radius: 6px;
            background: #0066D9;
            color: #FFFFFF;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
        }

        .update-button:hover {
            background: #0055B8;
        }

        .back-login {
            text-align: center;
            margin-top: 22px;
            font-size: 14px;
            color: #6B7280;
        }

        .back-login a {
            color: #0066D9;
            text-decoration: none;
            font-weight: 600;
        }

    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="update-wrapper">

            <div class="update-card">

                <div class="logo">
                    Life<span>Link</span>
                </div>

                <div class="title">
                    Update Password
                </div>

                <div class="description">
                    Enter your current password and create
                    a new password for your account.
                </div>

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="message">
                </asp:Label>

                <div class="form-group">

                    <asp:Label
                        ID="lblCurrentPassword"
                        runat="server"
                        AssociatedControlID="txtCurrentPassword"
                        Text="Current Password">
                    </asp:Label>

                    <asp:TextBox
                        ID="txtCurrentPassword"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Password">
                    </asp:TextBox>

                    <asp:RequiredFieldValidator
                        ID="rfvCurrentPassword"
                        runat="server"
                        ControlToValidate="txtCurrentPassword"
                        ErrorMessage="Current password is required."
                        CssClass="validation-error"
                        Display="Dynamic"
                        ValidationGroup="UpdatePasswordForm">
                    </asp:RequiredFieldValidator>

                </div>

                <div class="form-group">

                    <asp:Label
                        ID="lblNewPassword"
                        runat="server"
                        AssociatedControlID="txtNewPassword"
                        Text="New Password">
                    </asp:Label>

                    <asp:TextBox
                        ID="txtNewPassword"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Password">
                    </asp:TextBox>

                    <asp:RequiredFieldValidator
                        ID="rfvNewPassword"
                        runat="server"
                        ControlToValidate="txtNewPassword"
                        ErrorMessage="New password is required."
                        CssClass="validation-error"
                        Display="Dynamic"
                        ValidationGroup="UpdatePasswordForm">
                    </asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator
                        ID="revNewPassword"
                        runat="server"
                        ControlToValidate="txtNewPassword"
                        ErrorMessage="Password must contain at least 6 characters."
                        ValidationExpression="^.{6,}$"
                        CssClass="validation-error"
                        Display="Dynamic"
                        ValidationGroup="UpdatePasswordForm">
                    </asp:RegularExpressionValidator>

                </div>

                <div class="form-group">

                    <asp:Label
                        ID="lblConfirmPassword"
                        runat="server"
                        AssociatedControlID="txtConfirmPassword"
                        Text="Confirm New Password">
                    </asp:Label>

                    <asp:TextBox
                        ID="txtConfirmPassword"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Password">
                    </asp:TextBox>

                    <asp:RequiredFieldValidator
                        ID="rfvConfirmPassword"
                        runat="server"
                        ControlToValidate="txtConfirmPassword"
                        ErrorMessage="Please confirm your new password."
                        CssClass="validation-error"
                        Display="Dynamic"
                        ValidationGroup="UpdatePasswordForm">
                    </asp:RequiredFieldValidator>

                    <asp:CompareValidator
                        ID="cvPassword"
                        runat="server"
                        ControlToValidate="txtConfirmPassword"
                        ControlToCompare="txtNewPassword"
                        ErrorMessage="Passwords do not match."
                        CssClass="validation-error"
                        Display="Dynamic"
                        ValidationGroup="UpdatePasswordForm">
                    </asp:CompareValidator>

                </div>

                <asp:Button
                    ID="btnUpdate"
                    runat="server"
                    Text="Update Password"
                    CssClass="update-button"
                    ValidationGroup="UpdatePasswordForm"
                    CausesValidation="true"
                    OnClick="btnUpdate_Click" />

                <div class="back-login">

                    <a href="Login.aspx">
                        Back to Login
                    </a>

                </div>

            </div>

        </div>

    </form>

</body>

</html>
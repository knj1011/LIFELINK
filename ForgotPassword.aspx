<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="ForgotPassword.aspx.cs"
    Inherits="Lifelink.ForgotPassword" %>

<!DOCTYPE html>

<html lang="en">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0" />

    <title>Forgot Password - LifeLink</title>

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

        .forgot-wrapper {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px 20px;
        }

        .forgot-card {
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

        .forgot-button {
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

        .forgot-button:hover {
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

        <div class="forgot-wrapper">

            <div class="forgot-card">

                <div class="logo">
                    Life<span>Link</span>
                </div>

                <div class="title">
                    Forgot Password?
                </div>

                <div class="description">
                    Enter your registered email address
                    and we will help you reset your password.
                </div>

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="message">
                </asp:Label>

                <div class="form-group">

                    <asp:Label
                        ID="lblEmail"
                        runat="server"
                        AssociatedControlID="txtEmail"
                        Text="Email Address">
                    </asp:Label>

                    <asp:TextBox
                        ID="txtEmail"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Email">
                    </asp:TextBox>

                    <asp:RequiredFieldValidator
                        ID="rfvEmail"
                        runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Email address is required."
                        CssClass="validation-error"
                        Display="Dynamic"
                        ValidationGroup="ForgotPasswordForm">
                    </asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator
                        ID="revEmail"
                        runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Enter a valid email address."
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                        CssClass="validation-error"
                        Display="Dynamic"
                        ValidationGroup="ForgotPasswordForm">
                    </asp:RegularExpressionValidator>

                </div>

                <asp:Button
                    ID="btnContinue"
                    runat="server"
                    Text="Continue"
                    CssClass="forgot-button"
                    ValidationGroup="ForgotPasswordForm"
                    CausesValidation="true"
                    OnClick="btnContinue_Click" />

                <div class="back-login">

                    Remember your password?

                    <a href="Login.aspx">
                        Back to Login
                    </a>

                </div>

            </div>

        </div>

    </form>

</body>

</html>
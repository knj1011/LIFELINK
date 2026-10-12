<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AdminLogin.aspx.cs"
    Inherits="Lifelink.Admin.AdminLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>LifeLink Admin Login</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #F8F9FF;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .login-card {
            background: #FFFFFF;
            width: 100%;
            max-width: 430px;
            padding: 38px;
            border: 1px solid #DCE6F5;
            border-radius: 16px;
            box-shadow: 0 8px 30px rgba(32, 64, 119, 0.08);
        }

        .logo {
            text-align: center;
            font-size: 29px;
            font-weight: bold;
            color: #204077;
            margin-bottom: 8px;
        }

        .subtitle {
            text-align: center;
            color: #6B7280;
            font-size: 13px;
            margin-bottom: 30px;
        }

        h2 {
            color: #204077;
            font-size: 23px;
            margin: 0 0 8px;
        }

        .description {
            color: #6B7280;
            font-size: 14px;
            margin-bottom: 25px;
        }

        .field-label {
            display: block;
            color: #204077;
            font-size: 14px;
            font-weight: bold;
            margin: 17px 0 8px;
        }

        .input-field {
            width: 100%;
            padding: 12px;
            border: 1px solid #DCE6F5;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
        }

        .input-field:focus {
            border-color: #0066D9;
        }

        .validation {
            display: block;
            color: #B42318;
            font-size: 12px;
            margin-top: 5px;
        }

        .login-button {
            width: 100%;
            padding: 13px;
            margin-top: 24px;
            background: #0066D9;
            color: #FFFFFF;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
        }

        .login-button:hover {
            background: #0055B8;
        }

        .message {
            display: block;
            color: #B42318;
            font-size: 13px;
            margin-top: 15px;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 22px;
            color: #0066D9;
            text-decoration: none;
            font-size: 13px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="login-card">

            <div class="logo">♥ LifeLink</div>
            <div class="subtitle">ADMINISTRATION PORTAL</div>

            <h2>Admin Login</h2>
            <div class="description">
                Sign in with your administrator account.
            </div>

            <asp:Label ID="lblEmail" runat="server"
                CssClass="field-label"
                AssociatedControlID="txtEmail"
                Text="Email Address" />

            <asp:TextBox ID="txtEmail" runat="server"
                CssClass="input-field"
                TextMode="Email"
                MaxLength="150"
                placeholder="Enter admin email" />

            <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                ControlToValidate="txtEmail"
                ErrorMessage="Email is required."
                CssClass="validation"
                Display="Dynamic"
                ValidationGroup="AdminLogin" />

            <asp:RegularExpressionValidator ID="revEmail" runat="server"
                ControlToValidate="txtEmail"
                ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                ErrorMessage="Enter a valid email address."
                CssClass="validation"
                Display="Dynamic"
                ValidationGroup="AdminLogin" />

            <asp:Label ID="lblPassword" runat="server"
                CssClass="field-label"
                AssociatedControlID="txtPassword"
                Text="Password" />

            <asp:TextBox ID="txtPassword" runat="server"
                CssClass="input-field"
                TextMode="Password"
                MaxLength="128"
                placeholder="Enter your password" />

            <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                ControlToValidate="txtPassword"
                ErrorMessage="Password is required."
                CssClass="validation"
                Display="Dynamic"
                ValidationGroup="AdminLogin" />

            <asp:Button ID="btnLogin" runat="server"
                Text="Login to Dashboard"
                CssClass="login-button"
                ValidationGroup="AdminLogin"
                CausesValidation="true"
                OnClick="btnLogin_Click" />

            <asp:Label ID="lblMessage" runat="server"
                CssClass="message"
                EnableViewState="false" />

            <a class="back-link" href="../Home.aspx">
                ← Back to LifeLink Home
            </a>

        </div>
    </form>
</body>
</html>


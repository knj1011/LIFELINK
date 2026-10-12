<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs"
    Inherits="Lifelink.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0" />

    <title>Login - LifeLink</title>

    <link href="CSS/style.css"
          rel="stylesheet" />

    <style>

        .login-page {
            min-height: calc(100vh - 76px);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 60px 20px;
            background: linear-gradient(135deg, #EFF4FF 0%, #FFFFFF 100%);
        }

        .login-card {
            width: 100%;
            max-width: 430px;
            background: #FFFFFF;
            border: 1px solid #DCE6F5;
            border-radius: 14px;
            padding: 40px;
            box-shadow: 0 10px 35px rgba(32, 64, 119, 0.10);
        }

        .login-logo {
            text-align: center;
            margin-bottom: 25px;
        }

        .login-logo h1 {
            color: #0066D9;
            font-size: 32px;
            margin-bottom: 8px;
        }

        .login-logo h1 span {
            color: #204077;
        }

        .login-logo p {
            color: #6B7280;
            font-size: 14px;
        }

        .login-card h2 {
            text-align: center;
            color: #204077;
            font-size: 25px;
            margin-bottom: 28px;
        }

        .login-form-group {
            margin-bottom: 20px;
        }

        .login-form-group label {
            display: block;
            color: #204077;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .login-input {
            width: 100%;
            padding: 13px 14px;
            border: 1px solid #DCE6F5;
            border-radius: 6px;
            font-size: 14px;
            color: #1E1E1E;
            background: #FFFFFF;
        }

        .login-input:focus {
            outline: none;
            border-color: #0066D9;
            box-shadow: 0 0 0 3px rgba(0, 102, 217, 0.10);
        }

        .login-button {
            width: 100%;
            padding: 13px;
            background: #0066D9;
            color: #FFFFFF !important;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 5px;
        }

        .login-button:hover {
            background: #0054B3;
        }

        .login-links {
            text-align: center;
            margin-top: 22px;
        }

        .login-links a {
            color: #0066D9;
            text-decoration: none;
            font-size: 14px;
        }

        .login-links a:hover {
            text-decoration: underline;
        }

        .login-divider {
            margin: 18px 0;
            color: #DCE6F5;
        }

        .validation-error {
            display: block;
            color: #C62828;
            font-size: 12px;
            margin-top: 6px;
        }

        .login-message {
            display: block;
            text-align: center;
            color: #C62828;
            font-size: 13px;
            margin-bottom: 15px;
        }

        @media (max-width: 500px) {

            .login-card {
                padding: 30px 22px;
            }

        }

    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="login-page">

            <div class="login-card">

                <div class="login-logo">

                    <h1>
                        Life<span>Link</span>
                    </h1>

                    <p>
                        Connecting People • Creating Hope
                    </p>

                </div>


                <h2>
                    Welcome Back
                </h2>


                <!-- LOGIN MESSAGE -->

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="login-message">
                </asp:Label>


                <!-- EMAIL -->

                <div class="login-form-group">

                    <label for="txtEmail">
                        Email Address
                    </label>

                    <asp:TextBox
                        ID="txtEmail"
                        runat="server"
                        CssClass="login-input"
                        TextMode="Email"
                        placeholder="Enter your email">
                    </asp:TextBox>

                    <asp:RequiredFieldValidator
                        ID="rfvEmail"
                        runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Email address is required."
                        CssClass="validation-error"
                        Display="Dynamic"
                        ValidationGroup="LoginForm">
                    </asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator
                        ID="revEmail"
                        runat="server"
                        ControlToValidate="txtEmail"
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                        ErrorMessage="Please enter a valid email address."
                        CssClass="validation-error"
                        Display="Dynamic"
                        ValidationGroup="LoginForm">
                    </asp:RegularExpressionValidator>

                </div>


                <!-- PASSWORD -->

                <div class="login-form-group">

                    <label for="txtPassword">
                        Password
                    </label>

                    <asp:TextBox
                        ID="txtPassword"
                        runat="server"
                        CssClass="login-input"
                        TextMode="Password"
                        placeholder="Enter your password">
                    </asp:TextBox>

                    <asp:RequiredFieldValidator
                        ID="rfvPassword"
                        runat="server"
                        ControlToValidate="txtPassword"
                        ErrorMessage="Password is required."
                        CssClass="validation-error"
                        Display="Dynamic"
                        ValidationGroup="LoginForm">
                    </asp:RequiredFieldValidator>

                </div>


                <!-- LOGIN BUTTON -->

              <asp:Button
    ID="btnLogin"
    runat="server"
    Text="Login"
    CssClass="login-button"
    ValidationGroup="LoginForm"
    CausesValidation="true"
    OnClick="btnLogin_Click" />


                <div class="login-links">

                    <a href="ForgotPassword.aspx">
                        Forgot Password?
                    </a>

                    <div class="login-divider">
                        ─────────
                    </div>

                    <a href="Register.aspx">
                        Don't have an account? Create one
                    </a>

                </div>

            </div>

        </div>

    </form>

</body>

</html>
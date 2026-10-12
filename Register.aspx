<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs"
    Inherits="Lifelink.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0" />

    <title>Register - LifeLink</title>

    <link href="CSS/style.css"
          rel="stylesheet" />

    <style>

        .register-page {
            min-height: calc(100vh - 76px);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 55px 20px;
            background: linear-gradient(135deg, #EFF4FF 0%, #FFFFFF 100%);
        }

        .register-card {
            width: 100%;
            max-width: 650px;
            background: #FFFFFF;
            border: 1px solid #DCE6F5;
            border-radius: 14px;
            padding: 40px;
            box-shadow: 0 10px 35px rgba(32, 64, 119, 0.10);
        }

        .register-logo {
            text-align: center;
            margin-bottom: 25px;
        }

        .register-logo h1 {
            color: #0066D9;
            font-size: 32px;
            margin-bottom: 8px;
        }

        .register-logo h1 span {
            color: #204077;
        }

        .register-logo p {
            color: #6B7280;
            font-size: 14px;
        }

        .register-card h2 {
            text-align: center;
            color: #204077;
            font-size: 25px;
            margin-bottom: 28px;
        }

        .register-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .register-form-group {
            margin-bottom: 5px;
        }

        .register-form-group.full-width {
            grid-column: 1 / -1;
        }

        .register-form-group label {
            display: block;
            color: #204077;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .register-input {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #DCE6F5;
            border-radius: 6px;
            font-size: 14px;
            color: #1E1E1E;
            background: #FFFFFF;
        }

        .register-input:focus {
            outline: none;
            border-color: #0066D9;
            box-shadow: 0 0 0 3px rgba(0, 102, 217, 0.10);
        }

        .register-radio {
            color: #6B7280;
            font-size: 14px;
        }

        .register-radio input {
            margin-right: 6px;
        }

        .register-button {
            width: 100%;
            padding: 13px;
            background: #0066D9;
            color: #FFFFFF;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 25px;
        }

        .register-button:hover {
            background: #0054B3;
        }

        .validation-error {
            display: block;
            color: #C62828;
            font-size: 12px;
            margin-top: 6px;
        }

        .register-message {
            display: block;
            text-align: center;
            color: #C62828;
            font-size: 13px;
            margin-bottom: 15px;
        }

        .register-links {
            text-align: center;
            margin-top: 22px;
        }

        .register-links a {
            color: #0066D9;
            text-decoration: none;
            font-size: 14px;
        }

        .register-links a:hover {
            text-decoration: underline;
        }

        @media (max-width: 650px) {

            .register-card {
                padding: 30px 22px;
            }

            .register-grid {
                grid-template-columns: 1fr;
            }

            .register-form-group.full-width {
                grid-column: auto;
            }

        }

    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="register-page">

            <div class="register-card">

                <div class="register-logo">

                    <h1>
                        Life<span>Link</span>
                    </h1>

                    <p>
                        Connecting People • Creating Hope
                    </p>

                </div>


                <h2>
                    Create Your Account
                </h2>


                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="register-message">
                </asp:Label>


                <div class="register-grid">


                    <!-- FULL NAME -->

                    <div class="register-form-group">

                        <label for="txtFullName">
                            Full Name
                        </label>

                        <asp:TextBox
                            ID="txtFullName"
                            runat="server"
                            CssClass="register-input"
                            placeholder="Enter your full name">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="rfvFullName"
                            runat="server"
                            ControlToValidate="txtFullName"
                            ErrorMessage="Full Name is required."
                            CssClass="validation-error"
                            Display="Dynamic"
                            ValidationGroup="RegisterForm">
                        </asp:RequiredFieldValidator>

                    </div>


                    <!-- EMAIL -->

                    <div class="register-form-group">

                        <label for="txtEmail">
                            Email Address
                        </label>

                        <asp:TextBox
                            ID="txtEmail"
                            runat="server"
                            CssClass="register-input"
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
                            ValidationGroup="RegisterForm">
                        </asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator
                            ID="revEmail"
                            runat="server"
                            ControlToValidate="txtEmail"
                            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                            ErrorMessage="Please enter a valid email address."
                            CssClass="validation-error"
                            Display="Dynamic"
                            ValidationGroup="RegisterForm">
                        </asp:RegularExpressionValidator>

                    </div>


                    <!-- CONTACT NUMBER -->

                    <div class="register-form-group">

                        <label for="txtContactNumber">
                            Contact Number
                        </label>

                        <asp:TextBox
                            ID="txtContactNumber"
                            runat="server"
                            CssClass="register-input"
                            MaxLength="10"
                            placeholder="Enter 10 digit number">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="rfvContactNumber"
                            runat="server"
                            ControlToValidate="txtContactNumber"
                            ErrorMessage="Contact number is required."
                            CssClass="validation-error"
                            Display="Dynamic"
                            ValidationGroup="RegisterForm">
                        </asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator
                            ID="revContactNumber"
                            runat="server"
                            ControlToValidate="txtContactNumber"
                            ValidationExpression="^[0-9]{10}$"
                            ErrorMessage="Enter a valid 10 digit contact number."
                            CssClass="validation-error"
                            Display="Dynamic"
                            ValidationGroup="RegisterForm">
                        </asp:RegularExpressionValidator>

                    </div>


                    <!-- GENDER -->

                    <div class="register-form-group">

                        <label>
                            Gender
                        </label>

                        <asp:RadioButtonList
                            ID="rblGender"
                            runat="server"
                            RepeatDirection="Horizontal"
                            CssClass="register-radio">

                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>

                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>

                            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>

                        </asp:RadioButtonList>

                        <asp:RequiredFieldValidator
                            ID="rfvGender"
                            runat="server"
                            ControlToValidate="rblGender"
                            ErrorMessage="Please select your gender."
                            CssClass="validation-error"
                            Display="Dynamic"
                            ValidationGroup="RegisterForm">
                        </asp:RequiredFieldValidator>

                    </div>


                    <!-- ADDRESS -->

                    <div class="register-form-group full-width">

                        <label for="txtAddress">
                            Address
                        </label>

                        <asp:TextBox
                            ID="txtAddress"
                            runat="server"
                            CssClass="register-input"
                            TextMode="MultiLine"
                            Rows="3"
                            placeholder="Enter your address">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="rfvAddress"
                            runat="server"
                            ControlToValidate="txtAddress"
                            ErrorMessage="Address is required."
                            CssClass="validation-error"
                            Display="Dynamic"
                            ValidationGroup="RegisterForm">
                        </asp:RequiredFieldValidator>

                    </div>


                    <!-- PASSWORD -->

                    <div class="register-form-group">

                        <label for="txtPassword">
                            Password
                        </label>

                        <asp:TextBox
                            ID="txtPassword"
                            runat="server"
                            CssClass="register-input"
                            TextMode="Password"
                            placeholder="Enter password">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="rfvPassword"
                            runat="server"
                            ControlToValidate="txtPassword"
                            ErrorMessage="Password is required."
                            CssClass="validation-error"
                            Display="Dynamic"
                            ValidationGroup="RegisterForm">
                        </asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator
                            ID="revPassword"
                            runat="server"
                            ControlToValidate="txtPassword"
                            ValidationExpression="^.{6,}$"
                            ErrorMessage="Password must be at least 6 characters."
                            CssClass="validation-error"
                            Display="Dynamic"
                            ValidationGroup="RegisterForm">
                        </asp:RegularExpressionValidator>

                    </div>


                    <!-- CONFIRM PASSWORD -->

                    <div class="register-form-group">

                        <label for="txtConfirmPassword">
                            Confirm Password
                        </label>

                        <asp:TextBox
                            ID="txtConfirmPassword"
                            runat="server"
                            CssClass="register-input"
                            TextMode="Password"
                            placeholder="Confirm password">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="rfvConfirmPassword"
                            runat="server"
                            ControlToValidate="txtConfirmPassword"
                            ErrorMessage="Please confirm your password."
                            CssClass="validation-error"
                            Display="Dynamic"
                            ValidationGroup="RegisterForm">
                        </asp:RequiredFieldValidator>

                        <asp:CompareValidator
                            ID="cvPassword"
                            runat="server"
                            ControlToValidate="txtConfirmPassword"
                            ControlToCompare="txtPassword"
                            ErrorMessage="Passwords do not match."
                            CssClass="validation-error"
                            Display="Dynamic"
                            ValidationGroup="RegisterForm">
                        </asp:CompareValidator>

                    </div>

                </div>


                <!-- REGISTER BUTTON -->

                <asp:Button
                    ID="btnRegister"
                    runat="server"
                    Text="Create Account"
                    CssClass="register-button"
                    ValidationGroup="RegisterForm"
                    CausesValidation="true"
                    OnClick="btnRegister_Click" />


                <div class="register-links">

                    <a href="Login.aspx">
                        Already have an account? Login
                    </a>

                </div>

            </div>

        </div>

    </form>

</body>

</html>
<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="EditProfile.aspx.cs"
    Inherits="Lifelink.EditProfile" %>

<!DOCTYPE html>

<html lang="en">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0" />

    <title>Edit Profile - LifeLink</title>

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

        .edit-wrapper {
            min-height: 100vh;
            padding: 50px 20px;
        }

        .edit-container {
            max-width: 700px;
            margin: 0 auto;
        }

        .edit-header {
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

        .edit-title {
            font-size: 30px;
            color: #204077;
            margin: 0 0 8px;
        }

        .edit-subtitle {
            color: #6B7280;
            font-size: 14px;
        }

        .edit-card {
            background: #FFFFFF;
            border: 1px solid #DCE6F5;
            border-radius: 12px;
            padding: 35px;
            box-shadow: 0 8px 25px rgba(32, 64, 119, 0.08);
        }

        .message {
            display: block;
            text-align: center;
            color: #0066D9;
            font-size: 14px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #204077;
            margin-bottom: 7px;
        }

        .form-input,
        .form-select,
        .form-textarea {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #DCE6F5;
            border-radius: 6px;
            background: #FFFFFF;
            color: #1E1E1E;
            font-size: 14px;
            outline: none;
        }

        .form-input:focus,
        .form-select:focus,
        .form-textarea:focus {
            border-color: #0066D9;
            box-shadow: 0 0 0 3px rgba(0, 102, 217, 0.08);
        }

        .form-textarea {
            min-height: 100px;
            resize: vertical;
        }

        .gender-list {
            display: flex;
            gap: 25px;
            padding: 8px 0;
        }

        .gender-list label {
            margin-left: 5px;
            color: #1E1E1E;
            font-size: 14px;
        }

        .validation-error {
            display: block;
            color: #C62828;
            font-size: 12px;
            margin-top: 6px;
        }

        .edit-button {
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

        .edit-button:hover {
            background: #0055B8;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 22px;
            color: #0066D9;
            text-decoration: none;
            font-size: 14px;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 600px) {

            .edit-wrapper {
                padding: 30px 15px;
            }

            .edit-card {
                padding: 25px 20px;
            }

            .gender-list {
                flex-direction: column;
                gap: 10px;
            }

        }

    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="edit-wrapper">

            <div class="edit-container">

                <div class="edit-header">

                    <div class="logo">
                        Life<span>Link</span>
                    </div>

                    <h1 class="edit-title">
                        Edit Profile
                    </h1>

                    <p class="edit-subtitle">
                        Update your LifeLink account information.
                    </p>

                </div>

                <div class="edit-card">

                    <asp:Label
                        ID="lblMessage"
                        runat="server"
                        CssClass="message">
                    </asp:Label>

                    <div class="form-group">

                        <label class="form-label">
                            Full Name
                        </label>

                        <asp:TextBox
                            ID="txtFullName"
                            runat="server"
                            CssClass="form-input">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="rfvFullName"
                            runat="server"
                            ControlToValidate="txtFullName"
                            ErrorMessage="Full name is required."
                            CssClass="validation-error"
                            Display="Dynamic"
                            ValidationGroup="EditProfileForm">
                        </asp:RequiredFieldValidator>

                    </div>

                    <div class="form-group">

                        <label class="form-label">
                            Email
                        </label>

                        <asp:TextBox
                            ID="txtEmail"
                            runat="server"
                            CssClass="form-input">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="rfvEmail"
                            runat="server"
                            ControlToValidate="txtEmail"
                            ErrorMessage="Email is required."
                            CssClass="validation-error"
                            Display="Dynamic"
                            ValidationGroup="EditProfileForm">
                        </asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator
                            ID="revEmail"
                            runat="server"
                            ControlToValidate="txtEmail"
                            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                            ErrorMessage="Enter a valid email address."
                            CssClass="validation-error"
                            Display="Dynamic"
                            ValidationGroup="EditProfileForm">
                        </asp:RegularExpressionValidator>

                    </div>

                    <div class="form-group">

                        <label class="form-label">
                            Contact Number
                        </label>

                        <asp:TextBox
                            ID="txtContactNumber"
                            runat="server"
                            CssClass="form-input"
                            MaxLength="10">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="rfvContactNumber"
                            runat="server"
                            ControlToValidate="txtContactNumber"
                            ErrorMessage="Contact number is required."
                            CssClass="validation-error"
                            Display="Dynamic"
                            ValidationGroup="EditProfileForm">
                        </asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator
                            ID="revContactNumber"
                            runat="server"
                            ControlToValidate="txtContactNumber"
                            ValidationExpression="^[0-9]{10}$"
                            ErrorMessage="Enter a valid 10-digit contact number."
                            CssClass="validation-error"
                            Display="Dynamic"
                            ValidationGroup="EditProfileForm">
                        </asp:RegularExpressionValidator>

                    </div>

                    <div class="form-group">

                        <label class="form-label">
                            Gender
                        </label>

                        <asp:RadioButtonList
                            ID="rblGender"
                            runat="server"
                            CssClass="gender-list"
                            RepeatDirection="Horizontal">

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
                            ValidationGroup="EditProfileForm">
                        </asp:RequiredFieldValidator>

                    </div>

                    <div class="form-group">

                        <label class="form-label">
                            Address
                        </label>

                        <asp:TextBox
                            ID="txtAddress"
                            runat="server"
                            CssClass="form-textarea"
                            TextMode="MultiLine">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="rfvAddress"
                            runat="server"
                            ControlToValidate="txtAddress"
                            ErrorMessage="Address is required."
                            CssClass="validation-error"
                            Display="Dynamic"
                            ValidationGroup="EditProfileForm">
                        </asp:RequiredFieldValidator>

                    </div>

                    <asp:Button
                        ID="btnSave"
                        runat="server"
                        Text="Save Changes"
                        CssClass="edit-button"
                        ValidationGroup="EditProfileForm"
                        CausesValidation="true"
                        OnClick="btnSave_Click" />

                    <a href="Profile.aspx"
                       class="back-link">
                        Back to Profile
                    </a>

                </div>

            </div>

        </div>

    </form>

</body>

</html>
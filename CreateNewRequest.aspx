<%@ Page Title="Create New Request" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateNewRequest.aspx.cs" Inherits="Lifelink.CreateNewRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="create-request-page">

        <div class="request-header">
            <h1>Create a New Request</h1>
            <p>Select the type of assistance you need.</p>
        </div>

        <div class="request-card">

            <div class="request-icon">+</div>

            <h2>How can we help you?</h2>

            <p class="request-description">
                Choose a service below to open the appropriate
                request form and provide the required information.
            </p>

            <div class="request-field">

                <asp:Label ID="lblRequestType" runat="server"
                    AssociatedControlID="ddlRequestType"
                    Text="Request Type" />

                <asp:DropDownList ID="ddlRequestType" runat="server"
                    CssClass="request-input">

                    <asp:ListItem Text="Select a request type" Value="" />
                    <asp:ListItem Text="Blood Assistance" Value="Blood" />
                    <asp:ListItem Text="Food Assistance" Value="Food" />
                    <asp:ListItem Text="Emergency Help" Value="Emergency" />
                    <asp:ListItem Text="Volunteer Support" Value="Volunteer" />

                </asp:DropDownList>

                <asp:RequiredFieldValidator ID="rfvRequestType"
                    runat="server"
                    ControlToValidate="ddlRequestType"
                    InitialValue=""
                    ErrorMessage="Please select a request type."
                    CssClass="request-error"
                    Display="Dynamic"
                    ValidationGroup="RequestForm" />

            </div>

            <asp:Button ID="btnContinue" runat="server"
                Text="Continue to Request Form"
                CssClass="request-button"
                OnClick="btnContinue_Click"
                ValidationGroup="RequestForm" />

            <asp:Label ID="lblMessage" runat="server"
                CssClass="request-message"
                EnableViewState="false" />

        </div>

        <div class="request-info">

            <h3>Available Assistance</h3>

            <div class="request-option">
                <div class="option-symbol">+</div>
                <div>
                    <h4>Blood Assistance</h4>
                    <p>Submit a request for a required blood group.</p>
                </div>
            </div>

            <div class="request-option">
                <div class="option-symbol">&#9829;</div>
                <div>
                    <h4>Food Assistance</h4>
                    <p>Request food supplies for yourself or your family.</p>
                </div>
            </div>

            <div class="request-option">
                <div class="option-symbol">!</div>
                <div>
                    <h4>Emergency Help</h4>
                    <p>Provide details about an emergency situation.</p>
                </div>
            </div>

            <div class="request-option">
                <div class="option-symbol">&#10003;</div>
                <div>
                    <h4>Volunteer Support</h4>
                    <p>Request help from community volunteers.</p>
                </div>
            </div>

        </div>

    </div>

    <style>
        .create-request-page {
            max-width: 1000px;
            margin: 35px auto;
            padding: 0 20px;
            color: #1E1E1E;
        }

        .request-header {
            margin-bottom: 25px;
        }

        .request-header h1 {
            color: #204077;
            font-size: 32px;
            margin-bottom: 8px;
        }

        .request-header p {
            color: #6B7280;
            margin: 0;
        }

        .request-card {
            max-width: 650px;
            margin: 0 auto 30px;
            padding: 30px;
            background: #FFFFFF;
            border: 1px solid #DCE6F5;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(32, 64, 119, 0.05);
        }

        .request-icon {
            width: 55px;
            height: 55px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            background: #EFF4FF;
            color: #0066D9;
            font-size: 32px;
            margin-bottom: 18px;
        }

        .request-card h2 {
            color: #204077;
            font-size: 23px;
            margin: 0 0 10px;
        }

        .request-description {
            color: #6B7280;
            line-height: 1.6;
            margin-bottom: 25px;
        }

        .request-field label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .request-input {
            box-sizing: border-box;
            width: 100%;
            padding: 13px;
            border: 1px solid #DCE6F5;
            border-radius: 7px;
            background: #F8F9FF;
            font-size: 15px;
        }

        .request-input:focus {
            outline: none;
            border-color: #0066D9;
        }

        .request-error {
            display: block;
            color: #C62828;
            font-size: 13px;
            margin-top: 6px;
        }

        .request-button {
            margin-top: 22px;
            width: 100%;
            padding: 13px 20px;
            border: none;
            border-radius: 7px;
            background: #0066D9;
            color: #FFFFFF;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
        }

        .request-button:hover {
            background: #0055B8;
        }

        .request-message {
            display: block;
            margin-top: 12px;
            color: #C62828;
        }

        .request-info {
            padding: 25px;
            background: #F8F9FF;
            border: 1px solid #DCE6F5;
            border-radius: 12px;
        }

        .request-info h3 {
            color: #204077;
            margin: 0 0 20px;
        }

        .request-option {
            display: flex;
            gap: 15px;
            align-items: flex-start;
            padding: 15px 0;
            border-bottom: 1px solid #DCE6F5;
        }

        .request-option:last-child {
            border-bottom: none;
        }

        .option-symbol {
            flex-shrink: 0;
            width: 38px;
            height: 38px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 8px;
            background: #FFFFFF;
            color: #0066D9;
            font-size: 21px;
            font-weight: 700;
        }

        .request-option h4 {
            color: #204077;
            margin: 0 0 5px;
        }

        .request-option p {
            color: #6B7280;
            margin: 0;
            line-height: 1.5;
        }

        @media (max-width: 600px) {
            .request-header h1 {
                font-size: 26px;
            }

            .request-card,
            .request-info {
                padding: 20px;
            }
        }
    </style>

</asp:Content>


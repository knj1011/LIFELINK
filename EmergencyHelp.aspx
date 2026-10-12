<%@ Page Title="Emergency Help" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="EmergencyHelp.aspx.cs"
    Inherits="Lifelink.EmergencyHelp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .emergency-page {
            background: #F8F9FF;
            padding: 45px 20px 60px;
            min-height: 75vh;
        }

        .emergency-container {
            max-width: 850px;
            margin: 0 auto;
        }

        .emergency-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .emergency-header .label {
            color: #0066D9;
            font-weight: 700;
            letter-spacing: 2px;
            font-size: 13px;
        }

        .emergency-header h1 {
            color: #204077;
            font-size: 34px;
            margin: 12px 0;
        }

        .emergency-header p {
            color: #6B7280;
            line-height: 1.7;
        }

        .emergency-card {
            background: #FFFFFF;
            border: 1px solid #DCE6F5;
            border-radius: 16px;
            padding: 32px;
            box-shadow: 0 8px 25px rgba(32, 64, 119, 0.07);
        }

        .emergency-card h2 {
            color: #204077;
            font-size: 21px;
            margin: 0 0 25px;
        }

        .emergency-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .emergency-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
            min-width: 0;
        }

        .emergency-group.full-width {
            grid-column: 1 / -1;
        }

        .emergency-group label {
            color: #204077;
            font-weight: 600;
            font-size: 14px;
        }

        .emergency-input {
            width: 100%;
            box-sizing: border-box;
            padding: 12px 13px;
            border: 1px solid #DCE6F5;
            border-radius: 8px;
            font-size: 14px;
            background: #FFFFFF;
            color: #1E1E1E;
            font-family: inherit;
        }

        .emergency-input:focus {
            outline: none;
            border-color: #0066D9;
            box-shadow: 0 0 0 3px rgba(0, 102, 217, 0.1);
        }

        .emergency-validation {
            color: #C62828;
            font-size: 12px;
            line-height: 1.4;
        }

        .emergency-submit {
            background: #0066D9;
            color: #FFFFFF;
            border: none;
            border-radius: 8px;
            padding: 14px 25px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 25px;
        }

        .emergency-submit:hover {
            background: #0055B8;
        }

        .emergency-message {
            display: block;
            margin-top: 18px;
            font-weight: 600;
            line-height: 1.6;
        }

        @media (max-width: 650px) {
            .emergency-grid {
                grid-template-columns: 1fr;
            }

            .emergency-group.full-width {
                grid-column: auto;
            }

            .emergency-card {
                padding: 22px 18px;
            }

            .emergency-header h1 {
                font-size: 28px;
            }
        }
    </style>

    <section class="emergency-page">
        <div class="emergency-container">

            <div class="emergency-header">
                <span class="label">URGENT COMMUNITY SUPPORT</span>
                <h1>Emergency Help</h1>
                <p>
                    Submit an emergency assistance request with your contact
                    details and location so your request can be recorded by LifeLink.
                </p>
            </div>

            <div class="emergency-card">
                <h2>Emergency Request Form</h2>

                <div class="emergency-grid">

                    <div class="emergency-group">
                        <asp:Label runat="server"
                            AssociatedControlID="txtRequesterName"
                            Text="Your Name *" />

                        <asp:TextBox ID="txtRequesterName" runat="server"
                            CssClass="emergency-input"
                            MaxLength="100"
                            placeholder="Enter your full name" />

                        <asp:RequiredFieldValidator ID="rfvRequesterName"
                            runat="server"
                            ControlToValidate="txtRequesterName"
                            ErrorMessage="Your name is required."
                            ValidationGroup="EmergencyForm"
                            CssClass="emergency-validation"
                            Display="Dynamic" />
                    </div>

                    <div class="emergency-group">
                        <asp:Label runat="server"
                            AssociatedControlID="txtContactNumber"
                            Text="Contact Number *" />

                        <asp:TextBox ID="txtContactNumber" runat="server"
                            CssClass="emergency-input"
                            TextMode="Phone"
                            MaxLength="10"
                            placeholder="10-digit mobile number" />

                        <asp:RequiredFieldValidator ID="rfvContactNumber"
                            runat="server"
                            ControlToValidate="txtContactNumber"
                            ErrorMessage="Contact number is required."
                            ValidationGroup="EmergencyForm"
                            CssClass="emergency-validation"
                            Display="Dynamic" />

                        <asp:RegularExpressionValidator ID="revContactNumber"
                            runat="server"
                            ControlToValidate="txtContactNumber"
                            ValidationExpression="^[6-9][0-9]{9}$"
                            ErrorMessage="Enter a valid 10-digit Indian mobile number."
                            ValidationGroup="EmergencyForm"
                            CssClass="emergency-validation"
                            Display="Dynamic" />
                    </div>

                    <div class="emergency-group">
                        <asp:Label runat="server"
                            AssociatedControlID="ddlEmergencyType"
                            Text="Emergency Type *" />

                        <asp:DropDownList ID="ddlEmergencyType" runat="server"
                            CssClass="emergency-input">
                            <asp:ListItem Text="Select emergency type"
                                Value="" />
                            <asp:ListItem Text="Medical Emergency"
                                Value="Medical Emergency" />
                            <asp:ListItem Text="Accident"
                                Value="Accident" />
                            <asp:ListItem Text="Natural Disaster"
                                Value="Natural Disaster" />
                            <asp:ListItem Text="Shelter Assistance"
                                Value="Shelter Assistance" />
                            <asp:ListItem Text="Other"
                                Value="Other" />
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ID="rfvEmergencyType"
                            runat="server"
                            ControlToValidate="ddlEmergencyType"
                            InitialValue=""
                            ErrorMessage="Please select an emergency type."
                            ValidationGroup="EmergencyForm"
                            CssClass="emergency-validation"
                            Display="Dynamic" />
                    </div>

                    <div class="emergency-group">
                        <asp:Label runat="server"
                            AssociatedControlID="txtLocation"
                            Text="Emergency Location *" />

                        <asp:TextBox ID="txtLocation" runat="server"
                            CssClass="emergency-input"
                            MaxLength="250"
                            placeholder="Enter the complete location" />

                        <asp:RequiredFieldValidator ID="rfvLocation"
                            runat="server"
                            ControlToValidate="txtLocation"
                            ErrorMessage="Emergency location is required."
                            ValidationGroup="EmergencyForm"
                            CssClass="emergency-validation"
                            Display="Dynamic" />
                    </div>

                    <div class="emergency-group full-width">
                        <asp:Label runat="server"
                            AssociatedControlID="txtEmergencyDetails"
                            Text="Emergency Details *" />

                        <asp:TextBox ID="txtEmergencyDetails" runat="server"
                            CssClass="emergency-input"
                            TextMode="MultiLine"
                            Rows="5"
                            MaxLength="2000"
                            placeholder="Explain what happened and what assistance is needed." />

                        <asp:RequiredFieldValidator ID="rfvEmergencyDetails"
                            runat="server"
                            ControlToValidate="txtEmergencyDetails"
                            ErrorMessage="Please describe the emergency."
                            ValidationGroup="EmergencyForm"
                            CssClass="emergency-validation"
                            Display="Dynamic" />
                    </div>

                </div>

                <asp:Button ID="btnSubmit" runat="server"
                    Text="Submit Emergency Request"
                    CssClass="emergency-submit"
                    ValidationGroup="EmergencyForm"
                    CausesValidation="true"
                    OnClick="btnSubmit_Click" />

                <asp:Label ID="lblMessage" runat="server"
                    CssClass="emergency-message"
                    EnableViewState="false" />

            </div>
        </div>
    </section>

</asp:Content>
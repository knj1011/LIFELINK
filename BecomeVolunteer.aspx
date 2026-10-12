<%@ Page Title="Become a Volunteer" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BecomeVolunteer.aspx.cs" Inherits="Lifelink.BecomeVolunteer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style type="text/css">
        .volunteer-page {
            background: #F8F9FF;
            padding: 45px 20px 60px;
            min-height: 75vh;
        }

        .volunteer-container {
            max-width: 850px;
            margin: 0 auto;
        }

        .volunteer-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .volunteer-header .label {
            color: #0066D9;
            font-size: 13px;
            font-weight: 700;
            letter-spacing: 2px;
        }

        .volunteer-header h1 {
            color: #204077;
            font-size: 34px;
            margin: 12px 0;
        }

        .volunteer-header p {
            color: #6B7280;
            line-height: 1.7;
        }

        .volunteer-card {
            background: #FFFFFF;
            border: 1px solid #DCE6F5;
            border-radius: 16px;
            padding: 32px;
            box-shadow: 0 8px 25px rgba(32, 64, 119, 0.07);
        }

        .volunteer-card h2 {
            color: #204077;
            font-size: 21px;
            margin: 0 0 25px;
        }

        .volunteer-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .volunteer-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
            min-width: 0;
        }

        .volunteer-group.full-width {
            grid-column: 1 / -1;
        }

        .volunteer-group label {
            color: #204077;
            font-weight: 600;
            font-size: 14px;
        }

        .volunteer-input {
            display: block;
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

        .volunteer-input:focus {
            outline: none;
            border-color: #0066D9;
            box-shadow: 0 0 0 3px rgba(0, 102, 217, 0.1);
        }

        .volunteer-validation {
            color: #C62828;
            font-size: 12px;
            line-height: 1.4;
        }

        .volunteer-submit {
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

        .volunteer-submit:hover {
            background: #0055B8;
        }

        .volunteer-message {
            display: block;
            margin-top: 18px;
            font-weight: 600;
            line-height: 1.6;
        }

        @media (max-width: 650px) {
            .volunteer-grid {
                grid-template-columns: 1fr;
            }

            .volunteer-group.full-width {
                grid-column: auto;
            }

            .volunteer-card {
                padding: 22px 18px;
            }

            .volunteer-header h1 {
                font-size: 28px;
            }
        }
    </style>

    <section class="volunteer-page">
        <div class="volunteer-container">

            <div class="volunteer-header">
                <span class="label">MAKE A DIFFERENCE</span>
                <h1>Become a Volunteer</h1>
                <p>
                    Join the LifeLink community and share your time and skills
                    to help people in need.
                </p>
            </div>

            <div class="volunteer-card">
                <h2>Volunteer Registration Form</h2>

                <div class="volunteer-grid">

                    <!-- Full Name -->
                    <div class="volunteer-group">
                        <asp:Label ID="lblFullName" runat="server"
                            AssociatedControlID="txtFullName"
                            Text="Full Name *" />

                        <asp:TextBox ID="txtFullName" runat="server"
                            CssClass="volunteer-input"
                            MaxLength="100"
                            placeholder="Enter your full name" />

                        <asp:RequiredFieldValidator ID="rfvFullName"
                            runat="server"
                            ControlToValidate="txtFullName"
                            ErrorMessage="Full name is required."
                            ValidationGroup="VolunteerForm"
                            CssClass="volunteer-validation"
                            Display="Dynamic" />
                    </div>

                    <!-- Contact Number -->
                    <div class="volunteer-group">
                        <asp:Label ID="lblContactNumber" runat="server"
                            AssociatedControlID="txtContactNumber"
                            Text="Contact Number *" />

                        <asp:TextBox ID="txtContactNumber" runat="server"
                            CssClass="volunteer-input"
                            TextMode="Phone"
                            MaxLength="10"
                            placeholder="10-digit mobile number" />

                        <asp:RequiredFieldValidator ID="rfvContactNumber"
                            runat="server"
                            ControlToValidate="txtContactNumber"
                            ErrorMessage="Contact number is required."
                            ValidationGroup="VolunteerForm"
                            CssClass="volunteer-validation"
                            Display="Dynamic" />

                        <asp:RegularExpressionValidator ID="revContactNumber"
                            runat="server"
                            ControlToValidate="txtContactNumber"
                            ValidationExpression="^[6-9][0-9]{9}$"
                            ErrorMessage="Enter a valid 10-digit Indian mobile number."
                            ValidationGroup="VolunteerForm"
                            CssClass="volunteer-validation"
                            Display="Dynamic" />
                    </div>

                    <!-- Email -->
                    <div class="volunteer-group">
                        <asp:Label ID="lblEmail" runat="server"
                            AssociatedControlID="txtEmail"
                            Text="Email Address *" />

                        <asp:TextBox ID="txtEmail" runat="server"
                            CssClass="volunteer-input"
                            TextMode="Email"
                            MaxLength="150"
                            placeholder="Enter your email address" />

                        <asp:RequiredFieldValidator ID="rfvEmail"
                            runat="server"
                            ControlToValidate="txtEmail"
                            ErrorMessage="Email address is required."
                            ValidationGroup="VolunteerForm"
                            CssClass="volunteer-validation"
                            Display="Dynamic" />

                        <asp:RegularExpressionValidator ID="revEmail"
                            runat="server"
                            ControlToValidate="txtEmail"
                            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                            ErrorMessage="Enter a valid email address."
                            ValidationGroup="VolunteerForm"
                            CssClass="volunteer-validation"
                            Display="Dynamic" />
                    </div>

                    <!-- Volunteer Activity -->
                    <div class="volunteer-group">
                        <asp:Label ID="lblActivity" runat="server"
                            AssociatedControlID="ddlActivity"
                            Text="Preferred Volunteer Activity *" />

                        <asp:DropDownList ID="ddlActivity" runat="server"
                            CssClass="volunteer-input">
                            <asp:ListItem Text="Select an activity" Value="" />
                            <asp:ListItem Text="Food Distribution" Value="Food Distribution" />
                            <asp:ListItem Text="Blood Donation Support" Value="Blood Donation Support" />
                            <asp:ListItem Text="Medical Assistance" Value="Medical Assistance" />
                            <asp:ListItem Text="Emergency Support" Value="Emergency Support" />
                            <asp:ListItem Text="Community Service" Value="Community Service" />
                            <asp:ListItem Text="Other" Value="Other" />
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ID="rfvActivity"
                            runat="server"
                            ControlToValidate="ddlActivity"
                            InitialValue=""
                            ErrorMessage="Please select a volunteer activity."
                            ValidationGroup="VolunteerForm"
                            CssClass="volunteer-validation"
                            Display="Dynamic" />
                    </div>

                    <!-- Availability -->
                    <div class="volunteer-group">
                        <asp:Label ID="lblAvailability" runat="server"
                            AssociatedControlID="ddlAvailability"
                            Text="Availability *" />

                        <asp:DropDownList ID="ddlAvailability" runat="server"
                            CssClass="volunteer-input">
                            <asp:ListItem Text="Select your availability" Value="" />
                            <asp:ListItem Text="Weekdays" Value="Weekdays" />
                            <asp:ListItem Text="Weekends" Value="Weekends" />
                            <asp:ListItem Text="Morning" Value="Morning" />
                            <asp:ListItem Text="Afternoon" Value="Afternoon" />
                            <asp:ListItem Text="Evening" Value="Evening" />
                            <asp:ListItem Text="Flexible" Value="Flexible" />
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ID="rfvAvailability"
                            runat="server"
                            ControlToValidate="ddlAvailability"
                            InitialValue=""
                            ErrorMessage="Please select your availability."
                            ValidationGroup="VolunteerForm"
                            CssClass="volunteer-validation"
                            Display="Dynamic" />
                    </div>

                    <!-- Additional Information -->
                    <div class="volunteer-group full-width">
                        <asp:Label ID="lblSkills" runat="server"
                            AssociatedControlID="txtSkills"
                            Text="Additional Information (Optional)" />

                        <asp:TextBox ID="txtSkills" runat="server"
                            CssClass="volunteer-input"
                            TextMode="MultiLine"
                            Rows="4"
                            MaxLength="500"
                            placeholder="Describe your skills or relevant experience." />
                    </div>

                </div>

                <asp:Button ID="btnSubmit" runat="server"
                    Text="Register as Volunteer"
                    CssClass="volunteer-submit"
                    ValidationGroup="VolunteerForm"
                    CausesValidation="true"
                    OnClick="btnSubmit_Click" />

                <asp:Label ID="lblMessage" runat="server"
                    CssClass="volunteer-message"
                    EnableViewState="false" />

            </div>
        </div>
    </section>

</asp:Content>


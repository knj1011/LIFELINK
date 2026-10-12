<%@ Page Title="Food Assistance" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="FoodAssistance.aspx.cs"
    Inherits="Lifelink.FoodAssistance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .food-request-page {
            background: #F8F9FF;
            padding: 45px 20px 60px;
            min-height: 75vh;
        }

        .food-request-container {
            max-width: 850px;
            margin: 0 auto;
        }

        .food-request-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .food-request-header .label {
            color: #0066D9;
            font-weight: 700;
            letter-spacing: 2px;
            font-size: 13px;
        }

        .food-request-header h1 {
            color: #204077;
            font-size: 34px;
            margin: 12px 0;
        }

        .food-request-header p {
            color: #6B7280;
            line-height: 1.7;
        }

        .food-request-card {
            background: #FFFFFF;
            border: 1px solid #DCE6F5;
            border-radius: 16px;
            padding: 32px;
            box-shadow: 0 8px 25px rgba(32, 64, 119, 0.07);
        }

        .food-request-card h2 {
            color: #204077;
            font-size: 21px;
            margin: 0 0 25px;
        }

        .food-form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .food-form-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
            min-width: 0;
        }

        .food-form-group.full-width {
            grid-column: 1 / -1;
        }

        .food-form-group label {
            color: #204077;
            font-weight: 600;
            font-size: 14px;
        }

        .food-input {
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

        .food-input:focus {
            outline: none;
            border-color: #0066D9;
            box-shadow: 0 0 0 3px rgba(0, 102, 217, 0.1);
        }

        .food-validation {
            color: #C62828;
            font-size: 12px;
            line-height: 1.4;
        }

        .food-submit-button {
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

        .food-submit-button:hover {
            background: #0055B8;
        }

        .food-message {
            display: block;
            margin-top: 18px;
            font-weight: 600;
            line-height: 1.6;
        }

        @media (max-width: 650px) {
            .food-form-grid {
                grid-template-columns: 1fr;
            }

            .food-form-group.full-width {
                grid-column: auto;
            }

            .food-request-card {
                padding: 22px 18px;
            }

            .food-request-header h1 {
                font-size: 28px;
            }
        }
    </style>

    <section class="food-request-page">
        <div class="food-request-container">

            <div class="food-request-header">
                <span class="label">COMMUNITY SUPPORT</span>
                <h1>Food Assistance</h1>
                <p>
                    Request food support for yourself or your family.
                    Provide the details below so your request can be recorded by LifeLink.
                </p>
            </div>

            <div class="food-request-card">
                <h2>Food Assistance Request Form</h2>

                <div class="food-form-grid">

                    <!-- Requester Name -->
                    <div class="food-form-group">
                        <asp:Label runat="server"
                            AssociatedControlID="txtRequesterName"
                            Text="Requester Name *" />

                        <asp:TextBox ID="txtRequesterName" runat="server"
                            CssClass="food-input"
                            MaxLength="100"
                            placeholder="Enter your full name" />

                        <asp:RequiredFieldValidator
                            ID="rfvRequesterName"
                            runat="server"
                            ControlToValidate="txtRequesterName"
                            ErrorMessage="Requester name is required."
                            ValidationGroup="FoodForm"
                            CssClass="food-validation"
                            Display="Dynamic" />
                    </div>

                    <!-- Contact Number -->
                    <div class="food-form-group">
                        <asp:Label runat="server"
                            AssociatedControlID="txtContactNumber"
                            Text="Contact Number *" />

                        <asp:TextBox ID="txtContactNumber" runat="server"
                            CssClass="food-input"
                            TextMode="Phone"
                            MaxLength="10"
                            placeholder="10-digit mobile number" />

                        <asp:RequiredFieldValidator
                            ID="rfvContactNumber"
                            runat="server"
                            ControlToValidate="txtContactNumber"
                            ErrorMessage="Contact number is required."
                            ValidationGroup="FoodForm"
                            CssClass="food-validation"
                            Display="Dynamic" />

                        <asp:RegularExpressionValidator
                            ID="revContactNumber"
                            runat="server"
                            ControlToValidate="txtContactNumber"
                            ValidationExpression="^[6-9][0-9]{9}$"
                            ErrorMessage="Enter a valid 10-digit Indian mobile number."
                            ValidationGroup="FoodForm"
                            CssClass="food-validation"
                            Display="Dynamic" />
                    </div>

                    <!-- Food Requirements -->
                    <div class="food-form-group full-width">
                        <asp:Label runat="server"
                            AssociatedControlID="txtFoodRequirements"
                            Text="Food Requirements *" />

                        <asp:TextBox ID="txtFoodRequirements" runat="server"
                            CssClass="food-input"
                            TextMode="MultiLine"
                            Rows="4"
                            MaxLength="1000"
                            placeholder="Describe the food needed, quantity, number of people, and any dietary requirements." />

                        <asp:RequiredFieldValidator
                            ID="rfvFoodRequirements"
                            runat="server"
                            ControlToValidate="txtFoodRequirements"
                            ErrorMessage="Please describe your food requirements."
                            ValidationGroup="FoodForm"
                            CssClass="food-validation"
                            Display="Dynamic" />
                    </div>

                    <!-- Address -->
                    <div class="food-form-group full-width">
                        <asp:Label runat="server"
                            AssociatedControlID="txtAddress"
                            Text="Delivery Address *" />

                        <asp:TextBox ID="txtAddress" runat="server"
                            CssClass="food-input"
                            TextMode="MultiLine"
                            Rows="3"
                            MaxLength="250"
                            placeholder="Enter the complete address where assistance is needed." />

                        <asp:RequiredFieldValidator
                            ID="rfvAddress"
                            runat="server"
                            ControlToValidate="txtAddress"
                            ErrorMessage="Address is required."
                            ValidationGroup="FoodForm"
                            CssClass="food-validation"
                            Display="Dynamic" />
                    </div>

                </div>

                <!-- Submit Button -->
                <asp:Button ID="btnSubmit" runat="server"
                    Text="Submit Food Request"
                    CssClass="food-submit-button"
                    ValidationGroup="FoodForm"
                    CausesValidation="true"
                    OnClick="btnSubmit_Click" />

                <!-- Success or error message -->
                <asp:Label ID="lblMessage" runat="server"
                    CssClass="food-message"
                    EnableViewState="false" />

            </div>
        </div>
    </section>

</asp:Content>


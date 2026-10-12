<%@ Page Title="Blood Request" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="BloodRequest.aspx.cs"
    Inherits="Lifelink.BloodRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .blood-request-page {
            background: #F8F9FF;
            padding: 45px 20px 60px;
            min-height: 75vh;
        }

        .blood-request-container {
            max-width: 850px;
            margin: 0 auto;
        }

        .blood-request-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .blood-request-header .label {
            color: #0066D9;
            font-weight: 700;
            letter-spacing: 2px;
            font-size: 13px;
        }

        .blood-request-header h1 {
            color: #204077;
            font-size: 34px;
            margin: 12px 0;
        }

        .blood-request-header p {
            color: #6B7280;
            line-height: 1.7;
        }

        .blood-request-card {
            background: #FFFFFF;
            border: 1px solid #DCE6F5;
            border-radius: 16px;
            padding: 32px;
            box-shadow: 0 8px 25px rgba(32, 64, 119, 0.07);
        }

        .blood-request-card h2 {
            color: #204077;
            font-size: 21px;
            margin: 0 0 25px;
        }

        .blood-form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .blood-form-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
            min-width: 0;
        }

        .blood-form-group.full-width {
            grid-column: 1 / -1;
        }

        .blood-form-group label {
            color: #204077;
            font-weight: 600;
            font-size: 14px;
        }

        .blood-input {
            width: 100%;
            box-sizing: border-box;
            padding: 12px 13px;
            border: 1px solid #DCE6F5;
            border-radius: 8px;
            font-size: 14px;
            background: #FFFFFF;
            color: #1E1E1E;
        }

        .blood-input:focus {
            outline: none;
            border-color: #0066D9;
            box-shadow: 0 0 0 3px rgba(0, 102, 217, 0.1);
        }

        .blood-validation {
            color: #C62828;
            font-size: 12px;
            line-height: 1.4;
        }

        .blood-submit-button {
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

        .blood-submit-button:hover {
            background: #0055B8;
        }

        .blood-message {
            display: block;
            margin-top: 18px;
            font-weight: 600;
            line-height: 1.6;
        }

        @media (max-width: 650px) {
            .blood-form-grid {
                grid-template-columns: 1fr;
            }

            .blood-form-group.full-width {
                grid-column: auto;
            }

            .blood-request-card {
                padding: 22px 18px;
            }

            .blood-request-header h1 {
                font-size: 28px;
            }
        }
    </style>

    <section class="blood-request-page">
        <div class="blood-request-container">

            <div class="blood-request-header">
                <span class="label">BLOOD ASSISTANCE</span>
                <h1>Request Blood</h1>
                <p>
                    Submit your blood requirement details so your request
                    can be recorded by the LifeLink community support platform.
                </p>
            </div>

            <div class="blood-request-card">
                <h2>Patient and Blood Requirement Details</h2>

                <div class="blood-form-grid">

                    <!-- Patient Name -->
                    <div class="blood-form-group">
                        <asp:Label runat="server"
                            AssociatedControlID="txtPatientName"
                            Text="Patient Name *" />

                        <asp:TextBox ID="txtPatientName" runat="server"
                            CssClass="blood-input"
                            MaxLength="100"
                            placeholder="Enter patient's full name" />

                        <asp:RequiredFieldValidator
                            ID="rfvPatientName"
                            runat="server"
                            ControlToValidate="txtPatientName"
                            ErrorMessage="Patient name is required."
                            ValidationGroup="BloodForm"
                            CssClass="blood-validation"
                            Display="Dynamic" />
                    </div>

                    <!-- Blood Group -->
                    <div class="blood-form-group">
                        <asp:Label runat="server"
                            AssociatedControlID="ddlBloodGroup"
                            Text="Blood Group *" />

                        <asp:DropDownList ID="ddlBloodGroup" runat="server"
                            CssClass="blood-input">
                            <asp:ListItem Text="Select blood group" Value="" />
                            <asp:ListItem Text="A+" Value="A+" />
                            <asp:ListItem Text="A-" Value="A-" />
                            <asp:ListItem Text="B+" Value="B+" />
                            <asp:ListItem Text="B-" Value="B-" />
                            <asp:ListItem Text="AB+" Value="AB+" />
                            <asp:ListItem Text="AB-" Value="AB-" />
                            <asp:ListItem Text="O+" Value="O+" />
                            <asp:ListItem Text="O-" Value="O-" />
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator
                            ID="rfvBloodGroup"
                            runat="server"
                            ControlToValidate="ddlBloodGroup"
                            InitialValue=""
                            ErrorMessage="Please select a blood group."
                            ValidationGroup="BloodForm"
                            CssClass="blood-validation"
                            Display="Dynamic" />
                    </div>

                    <!-- Contact Number -->
                    <div class="blood-form-group">
                        <asp:Label runat="server"
                            AssociatedControlID="txtContactNumber"
                            Text="Contact Number *" />

                        <asp:TextBox ID="txtContactNumber" runat="server"
                            CssClass="blood-input"
                            MaxLength="10"
                            TextMode="Phone"
                            placeholder="10-digit mobile number" />

                        <asp:RequiredFieldValidator
                            ID="rfvContactNumber"
                            runat="server"
                            ControlToValidate="txtContactNumber"
                            ErrorMessage="Contact number is required."
                            ValidationGroup="BloodForm"
                            CssClass="blood-validation"
                            Display="Dynamic" />

                        <asp:RegularExpressionValidator
                            ID="revContactNumber"
                            runat="server"
                            ControlToValidate="txtContactNumber"
                            ValidationExpression="^[6-9][0-9]{9}$"
                            ErrorMessage="Enter a valid 10-digit Indian mobile number."
                            ValidationGroup="BloodForm"
                            CssClass="blood-validation"
                            Display="Dynamic" />
                    </div>

                    <!-- Hospital Name -->
                    <div class="blood-form-group">
                        <asp:Label runat="server"
                            AssociatedControlID="txtHospitalName"
                            Text="Hospital Name *" />

                        <asp:TextBox ID="txtHospitalName" runat="server"
                            CssClass="blood-input"
                            MaxLength="150"
                            placeholder="Enter hospital name" />

                        <asp:RequiredFieldValidator
                            ID="rfvHospitalName"
                            runat="server"
                            ControlToValidate="txtHospitalName"
                            ErrorMessage="Hospital name is required."
                            ValidationGroup="BloodForm"
                            CssClass="blood-validation"
                            Display="Dynamic" />
                    </div>

                    <!-- Required Units -->
                    <div class="blood-form-group">
                        <asp:Label runat="server"
                            AssociatedControlID="txtRequiredUnits"
                            Text="Required Units *" />

                        <asp:TextBox ID="txtRequiredUnits" runat="server"
                            CssClass="blood-input"
                            TextMode="Number"
                            placeholder="Enter number of units" />

                        <asp:RequiredFieldValidator
                            ID="rfvRequiredUnits"
                            runat="server"
                            ControlToValidate="txtRequiredUnits"
                            ErrorMessage="Required units are needed."
                            ValidationGroup="BloodForm"
                            CssClass="blood-validation"
                            Display="Dynamic" />

                        <asp:RangeValidator
                            ID="rvRequiredUnits"
                            runat="server"
                            ControlToValidate="txtRequiredUnits"
                            MinimumValue="1"
                            MaximumValue="100"
                            Type="Integer"
                            ErrorMessage="Enter a whole number from 1 to 100."
                            ValidationGroup="BloodForm"
                            CssClass="blood-validation"
                            Display="Dynamic" />
                    </div>

                    <!-- Required Date -->
                    <div class="blood-form-group">
                        <asp:Label runat="server"
                            AssociatedControlID="txtRequiredDate"
                            Text="Required Date *" />

                        <asp:TextBox ID="txtRequiredDate" runat="server"
                            CssClass="blood-input"
                            TextMode="Date" />

                        <asp:RequiredFieldValidator
                            ID="rfvRequiredDate"
                            runat="server"
                            ControlToValidate="txtRequiredDate"
                            ErrorMessage="Required date is needed."
                            ValidationGroup="BloodForm"
                            CssClass="blood-validation"
                            Display="Dynamic" />
                    </div>

                    <!-- Additional Details -->
                    <div class="blood-form-group full-width">
                        <asp:Label runat="server"
                            AssociatedControlID="txtAdditionalDetails"
                            Text="Additional Details (Optional)" />

                        <asp:TextBox ID="txtAdditionalDetails" runat="server"
                            CssClass="blood-input"
                            TextMode="MultiLine"
                            Rows="4"
                            MaxLength="1000"
                            placeholder="Add any other relevant information..." />
                    </div>

                </div>

                <!-- Submit Button -->
                <asp:Button ID="btnSubmit" runat="server"
                    Text="Submit Blood Request"
                    CssClass="blood-submit-button"
                    ValidationGroup="BloodForm"
                    CausesValidation="true"
                    OnClick="btnSubmit_Click" />

                <!-- Success or server-side error message -->
                <asp:Label ID="lblMessage" runat="server"
                    CssClass="blood-message"
                    EnableViewState="false" />

            </div>
        </div>
    </section>

</asp:Content>


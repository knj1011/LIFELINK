<%@ Page Title="Feedback" Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Feedback.aspx.cs"
    Inherits="Lifelink.Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .feedback-page {
        background: #F8F9FF;
        padding: 40px 4%;
        min-height: 75vh;
        color: #204077;
        box-sizing: border-box;
    }

    .feedback-heading {
        font-size: 36px;
        font-weight: 700;
        margin: 0 0 10px;
        color: #204077;
    }

    .feedback-intro {
        color: #64748B;
        font-size: 15px;
        line-height: 1.7;
        max-width: 720px;
        margin-bottom: 28px;
    }

    .feedback-layout {
        display: grid;
        grid-template-columns: minmax(0, 2fr) minmax(240px, .9fr);
        gap: 24px;
        align-items: start;
    }

    .feedback-card {
        background: #FFFFFF;
        border: 1px solid #DCE6F5;
        border-radius: 12px;
        padding: 26px;
        box-shadow: 0 3px 12px rgba(32,64,119,.05);
    }

    .feedback-fields {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 22px 18px;
    }

    .feedback-field {
        min-width: 0;
    }

    .feedback-field.full-width {
        grid-column: 1 / -1;
    }

    .feedback-label {
        display: block;
        font-size: 14px;
        font-weight: 600;
        color: #204077;
        margin-bottom: 9px;
    }

    .feedback-input {
        display: block;
        width: 100%;
        box-sizing: border-box;
        padding: 12px 13px;
        border: 1px solid #DCE6F5;
        border-radius: 7px;
        background: #F8F9FF;
        color: #1E1E1E;
        font-family: inherit;
        font-size: 14px;
        outline: none;
    }

    .feedback-input:focus {
        border-color: #0066D9;
        box-shadow: 0 0 0 3px rgba(0,102,217,.10);
        background: #FFFFFF;
    }

    textarea.feedback-input {
        min-height: 140px;
        resize: vertical;
    }

    /* Interactive five-star rating */
    .rating-options {
        display: inline-flex;
        flex-direction: row;
        gap: 5px;
        align-items: center;
    }

    .rating-options input[type="radio"] {
        position: absolute;
        opacity: 0;
        width: 1px;
        height: 1px;
        margin: 0;
    }

    .rating-options label {
        color: #C4CBDC;
        font-size: 29px;
        line-height: 1.3;
        cursor: pointer;
        padding: 0;
        transition: color .15s ease;
    }

    .rating-options label:hover {
        color: #F5A800;
    }

    /* Gold stars for the selected rating and all lower ratings */
    .rating-options:has(input:nth-of-type(1):checked) label:nth-of-type(1),
    .rating-options:has(input:nth-of-type(2):checked) label:nth-of-type(-n+2),
    .rating-options:has(input:nth-of-type(3):checked) label:nth-of-type(-n+3),
    .rating-options:has(input:nth-of-type(4):checked) label:nth-of-type(-n+4),
    .rating-options:has(input:nth-of-type(5):checked) label:nth-of-type(-n+5) {
        color: #F5A800;
    }

    .rating-options input:focus-visible + label {
        outline: 2px solid #0066D9;
        outline-offset: 3px;
        border-radius: 3px;
    }

    .feedback-actions {
        display: flex;
        flex-wrap: wrap;
        gap: 12px;
        border-top: 1px solid #E8EDF7;
        margin-top: 24px;
        padding-top: 20px;
    }

    .feedback-submit,
    .feedback-cancel {
        display: inline-block;
        padding: 12px 22px;
        border-radius: 7px;
        font-size: 14px;
        font-weight: 600;
        text-decoration: none;
        cursor: pointer;
    }

    .feedback-submit {
        background: #0066D9;
        color: #FFFFFF;
        border: 1px solid #0066D9;
    }

    .feedback-submit:hover {
        background: #0055B8;
    }

    .feedback-cancel {
        background: #FFFFFF;
        color: #0066D9;
        border: 1px solid #0066D9;
    }

    .feedback-cancel:hover {
        background: #EFF4FF;
    }

    .feedback-validation {
        display: block;
        color: #C62828;
        font-size: 13px;
        margin-top: 6px;
    }

    .feedback-message {
        display: block;
        margin-top: 16px;
        font-weight: 600;
        line-height: 1.5;
    }

    .feedback-help {
        background: #0753CC;
        color: #FFFFFF;
        padding: 24px 20px;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0,65,160,.12);
    }

    .feedback-help h3 {
        color: #FFFFFF;
        font-size: 23px;
        margin: 0 0 12px;
    }

    .feedback-help p {
        color: #E5EEFF;
        font-size: 14px;
        line-height: 1.7;
        margin-bottom: 20px;
    }

    .feedback-help-link {
        display: block;
        background: rgba(255,255,255,.13);
        color: #FFFFFF;
        padding: 15px;
        border-radius: 8px;
        margin-top: 12px;
        text-decoration: none;
        font-weight: 600;
    }

    .feedback-help-link:hover {
        background: rgba(255,255,255,.23);
        color: #FFFFFF;
    }

    .feedback-help-link small {
        display: block;
        font-size: 12px;
        font-weight: 400;
        margin-top: 5px;
        color: #E5EEFF;
    }

    @media (max-width: 800px) {
        .feedback-layout {
            grid-template-columns: 1fr;
        }

        .feedback-heading {
            font-size: 30px;
        }
    }

    @media (max-width: 520px) {
        .feedback-page {
            padding: 25px 14px;
        }

        .feedback-card {
            padding: 18px 15px;
        }

        .feedback-fields {
            grid-template-columns: 1fr;
        }

        .feedback-field.full-width {
            grid-column: auto;
        }
    }
</style>

<div class="feedback-page">

    <h1 class="feedback-heading">Share Your Feedback</h1>

    <p class="feedback-intro">
        Help us improve LifeLink community support services.
        Your feedback helps us connect people with the assistance they need.
    </p>

    <div class="feedback-layout">

        <div class="feedback-card">

            <div class="feedback-fields">

                <div class="feedback-field">
                    <asp:Label ID="lblCategory" runat="server"
                        AssociatedControlID="ddlCategory"
                        CssClass="feedback-label"
                        Text="Feedback Category *" />

                    <asp:DropDownList ID="ddlCategory" runat="server"
                        CssClass="feedback-input">
                        <asp:ListItem Value="">Select a category...</asp:ListItem>
                        <asp:ListItem Value="Blood Donation">Blood Donation</asp:ListItem>
                        <asp:ListItem Value="Food Assistance">Food Assistance</asp:ListItem>
                        <asp:ListItem Value="Emergency Help">Emergency Help</asp:ListItem>
                        <asp:ListItem Value="Volunteer Support">Volunteer Support</asp:ListItem>
                        <asp:ListItem Value="General Feedback">General Feedback</asp:ListItem>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ID="valCategory" runat="server"
                        ControlToValidate="ddlCategory"
                        InitialValue=""
                        ErrorMessage="Please select a category."
                        CssClass="feedback-validation"
                        Display="Dynamic" />
                </div>

                <div class="feedback-field">
                    <asp:Label ID="lblSubject" runat="server"
                        AssociatedControlID="txtSubject"
                        CssClass="feedback-label"
                        Text="Subject (Optional)" />

                    <asp:TextBox ID="txtSubject" runat="server"
                        CssClass="feedback-input"
                        MaxLength="100"
                        placeholder="Brief summary of your feedback" />
                </div>

                <div class="feedback-field full-width">
                    <asp:Label ID="lblRating" runat="server"
                        CssClass="feedback-label"
                        Text="Experience Rating *" />

                    <asp:RadioButtonList ID="rblRating" runat="server"
                        RepeatDirection="Horizontal"
                        RepeatLayout="Flow"
                        CssClass="rating-options">
                        <asp:ListItem Value="1" Text="★" />
                        <asp:ListItem Value="2" Text="★" />
                        <asp:ListItem Value="3" Text="★" />
                        <asp:ListItem Value="4" Text="★" />
                        <asp:ListItem Value="5" Text="★" />
                    </asp:RadioButtonList>

                    <asp:RequiredFieldValidator ID="valRating" runat="server"
                        ControlToValidate="rblRating"
                        ErrorMessage="Please select a star rating."
                        CssClass="feedback-validation"
                        Display="Dynamic" />
                </div>

                <div class="feedback-field full-width">
                    <asp:Label ID="lblComments" runat="server"
                        AssociatedControlID="txtComments"
                        CssClass="feedback-label"
                        Text="Detailed Feedback *" />

                    <asp:TextBox ID="txtComments" runat="server"
                        TextMode="MultiLine"
                        Rows="6"
                        MaxLength="1000"
                        CssClass="feedback-input"
                        placeholder="Tell us about your experience or suggestions..." />

                    <asp:RequiredFieldValidator ID="valComments" runat="server"
                        ControlToValidate="txtComments"
                        ErrorMessage="Please enter your feedback."
                        CssClass="feedback-validation"
                        Display="Dynamic" />
                </div>

            </div>

            <div class="feedback-actions">

                <asp:HyperLink ID="lnkCancel" runat="server"
                    NavigateUrl="~/Home.aspx"
                    CssClass="feedback-cancel"
                    Text="Cancel" />

                <asp:Button ID="btnSubmit" runat="server"
                    Text="Submit Feedback"
                    CssClass="feedback-submit"
                    OnClick="btnSubmit_Click"
                    CausesValidation="true" />

            </div>

            <asp:Label ID="lblMessage" runat="server"
                CssClass="feedback-message"
                EnableViewState="false" />

        </div>

        <aside class="feedback-help">

            <h3>Need Urgent Help?</h3>

            <p>
                For urgent assistance, visit our emergency help
                service or contact the LifeLink team.
            </p>

            <asp:HyperLink ID="lnkEmergency" runat="server"
                NavigateUrl="~/EmergencyHelp.aspx"
                CssClass="feedback-help-link">
                Emergency Help
                <small>Open the Emergency Help page →</small>
            </asp:HyperLink>

            <asp:HyperLink ID="lnkContact" runat="server"
                NavigateUrl="~/Contact.aspx"
                CssClass="feedback-help-link">
                Contact LifeLink
                <small>Visit the Contact page →</small>
            </asp:HyperLink>

        </aside>

    </div>
</div>

</asp:Content>
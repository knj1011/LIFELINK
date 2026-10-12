<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Contact.aspx.cs"
    Inherits="Lifelink.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section class="contact-hero">

        <div class="contact-container">

            <div class="contact-hero-content">

                <span class="contact-label">CONTACT US</span>

                <h1>
                    We're Here<br />
                    <span>To Help.</span>
                </h1>

                <p>
                    Have a question, suggestion, or need assistance?
                    Get in touch with the LifeLink team.
                </p>

            </div>

        </div>

    </section>


    <section class="contact-section">

        <div class="contact-container">

            <div class="contact-grid">

                <!-- CONTACT INFORMATION -->

                <div class="contact-info">

                    <span class="contact-label">GET IN TOUCH</span>

                    <h2>We'd Love to Hear From You</h2>

                    <p>
                        Whether you have a question about LifeLink,
                        need help using the platform, or want to
                        share your feedback, you can contact us.
                    </p>

                    <div class="contact-info-item">

                        <div class="contact-info-icon">
                            ✉
                        </div>

                        <div>
                            <h3>Email</h3>
                            <p>support@lifelink.com</p>
                        </div>

                    </div>

                    <div class="contact-info-item">

                        <div class="contact-info-icon">
                            ☎
                        </div>

                        <div>
                            <h3>Phone</h3>
                            <p>+91 00000 00000</p>
                        </div>

                    </div>

                    <div class="contact-info-item">

                        <div class="contact-info-icon">
                            📍
                        </div>

                        <div>
                            <h3>Address</h3>
                            <p>India</p>
                        </div>

                    </div>

                </div>


                <!-- CONTACT FORM -->

                <div class="contact-form-card">

                    <h2>Send Us a Message</h2>


                    <!-- FULL NAME -->

                    <div class="contact-form-group">

                        <label for="txtName">
                            Full Name
                        </label>

                        <asp:TextBox
                            ID="txtName"
                            runat="server"
                            CssClass="contact-input"
                            placeholder="Enter your name">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="rfvName"
                            runat="server"
                            ControlToValidate="txtName"
                            ErrorMessage="Full Name is required."
                            CssClass="validation-error"
                            Display="Dynamic"
                            ValidationGroup="ContactForm">
                        </asp:RequiredFieldValidator>

                    </div>


                    <!-- EMAIL -->

                    <div class="contact-form-group">

                        <label for="txtEmail">
                            Email Address
                        </label>

                        <asp:TextBox
                            ID="txtEmail"
                            runat="server"
                            CssClass="contact-input"
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
                            ValidationGroup="ContactForm">
                        </asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator
                            ID="revEmail"
                            runat="server"
                            ControlToValidate="txtEmail"
                            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                            ErrorMessage="Please enter a valid email address."
                            CssClass="validation-error"
                            Display="Dynamic"
                            ValidationGroup="ContactForm">
                        </asp:RegularExpressionValidator>

                    </div>


                    <!-- SUBJECT -->

                    <div class="contact-form-group">

                        <label for="txtSubject">
                            Subject
                        </label>

                        <asp:TextBox
                            ID="txtSubject"
                            runat="server"
                            CssClass="contact-input"
                            placeholder="Enter subject">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="rfvSubject"
                            runat="server"
                            ControlToValidate="txtSubject"
                            ErrorMessage="Subject is required."
                            CssClass="validation-error"
                            Display="Dynamic"
                            ValidationGroup="ContactForm">
                        </asp:RequiredFieldValidator>

                    </div>


                    <!-- MESSAGE -->

                    <div class="contact-form-group">

                        <label for="txtMessage">
                            Message
                        </label>

                        <asp:TextBox
                            ID="txtMessage"
                            runat="server"
                            CssClass="contact-input contact-message"
                            TextMode="MultiLine"
                            Rows="5"
                            placeholder="Write your message">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="rfvMessage"
                            runat="server"
                            ControlToValidate="txtMessage"
                            ErrorMessage="Message is required."
                            CssClass="validation-error"
                            Display="Dynamic"
                            ValidationGroup="ContactForm">
                        </asp:RequiredFieldValidator>

                    </div>


                    <!-- SEND BUTTON -->

                    <asp:Button
                        ID="btnSend"
                        runat="server"
                        Text="Send Message"
                        CssClass="primary-btn"
                        ValidationGroup="ContactForm"
                        CausesValidation="true" />

                </div>

            </div>

        </div>

    </section>

</asp:Content>
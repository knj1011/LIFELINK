<%@ Page Title="Find Help" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="FindHelp.aspx.cs"
    Inherits="Lifelink.FindHelp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section class="find-help-hero">

        <div class="find-help-container">

            <div class="find-help-hero-content">

                <span class="find-help-label">
                    FIND HELP
                </span>

                <h1>
                    We're Here to<br />
                    <span>Help You.</span>
                </h1>

                <p>
                    Find the support you need through LifeLink.
                    Choose a service below to get started.
                </p>

            </div>

        </div>

    </section>


    <section class="find-help-services">

        <div class="find-help-container">

            <div class="find-help-heading">

                <span class="find-help-label">
                    GET SUPPORT
                </span>

                <h2>
                    What Do You Need Help With?
                </h2>

                <p>
                    Select a service to find the right support
                    for your situation.
                </p>

            </div>


            <div class="find-help-grid">

                <div class="find-help-card">

                    <div class="find-help-icon">
                        🩸
                    </div>

                    <h3>
                        Blood Assistance
                    </h3>

                    <p>
                        Need blood for yourself or someone you care about?
                        Submit a blood request or find a donor.
                    </p>

                    <div class="find-help-links">

                        <a href="BloodRequest.aspx">
                            Request Blood →
                        </a>

                        <a href="FindBloodDonor.aspx">
                            Find a Donor →
                        </a>

                    </div>

                </div>


                <div class="find-help-card">

                    <div class="find-help-icon">
                        🍲
                    </div>

                    <h3>
                        Food Assistance
                    </h3>

                    <p>
                        Get connected with food assistance and
                        available community resources.
                    </p>

                    <div class="find-help-links">

                        <a href="FoodAssistance.aspx">
                            Get Food Help →
                        </a>

                    </div>

                </div>


                <div class="find-help-card">

                    <div class="find-help-icon">
                        🚨
                    </div>

                    <h3>
                        Emergency Help
                    </h3>

                    <p>
                        Need urgent community support?
                        Submit an emergency request.
                    </p>

                    <div class="find-help-links">

                        <a href="EmergencyHelp.aspx">
                            Get Emergency Help →
                        </a>

                    </div>

                </div>


                <div class="find-help-card">

                    <div class="find-help-icon">
                        🤝
                    </div>

                    <h3>
                        Volunteer Support
                    </h3>

                    <p>
                        Find volunteer assistance or connect
                        with opportunities to help others.
                    </p>

                    <div class="find-help-links">

                        <a href="VolunteerHelp.aspx">
                            Volunteer Help →
                        </a>

                        <a href="VolunteerRequest.aspx">
                            View Requests →
                        </a>

                    </div>

                </div>


                <div class="find-help-card">

                    <div class="find-help-icon">
                        🔎
                    </div>

                    <h3>
                        Community Resources
                    </h3>

                    <p>
                        Search for useful community resources
                        and available support.
                    </p>

                    <div class="find-help-links">

                        <a href="ResourceSearch.aspx">
                            Search Resources →
                        </a>

                    </div>

                </div>


                <div class="find-help-card">

                    <div class="find-help-icon">
                        📝
                    </div>

                    <h3>
                        Create a Request
                    </h3>

                    <p>
                        Can't find what you need? Create a request
                        and let the community know how they can help.
                    </p>

                    <div class="find-help-links">

                        <a href="CreateNewRequest.aspx">
                            Create Request →
                        </a>

                    </div>

                </div>

            </div>

        </div>

    </section>

</asp:Content>
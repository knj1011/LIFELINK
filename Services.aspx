<%@ Page Title="Services" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Services.aspx.cs"
    Inherits="Lifelink.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- ================= SERVICES HERO ================= -->

    <section class="services-hero">

        <div class="services-container">

            <div class="services-hero-content">

                <span class="services-label">
                    OUR SERVICES
                </span>

                <h1>
                    Support When<br />
                    <span>You Need It Most.</span>
                </h1>

                <p>
                    LifeLink connects people with essential community
                    support services through one simple platform.
                </p>

            </div>

        </div>

    </section>


    <!-- ================= SERVICES ================= -->

    <section class="services-list">

        <div class="services-container">

            <div class="services-heading">

                <span class="services-label">
                    HOW WE HELP
                </span>

                <h2>
                    Community Support Services
                </h2>

                <p>
                    Choose the service you need and connect with
                    the right kind of support.
                </p>

            </div>


            <div class="services-grid">

                <!-- Blood Assistance -->

                <div class="services-card">

                    <div class="services-icon">
                        🩸
                    </div>

                    <h3>
                        Blood Assistance
                    </h3>

                    <p>
                        Request blood or find suitable blood donors
                        when someone needs urgent blood support.
                    </p>

                    <a href="BloodRequest.aspx">
                        Request Blood →
                    </a>

                </div>


                <!-- Food Assistance -->

                <div class="services-card">

                    <div class="services-icon">
                        🍲
                    </div>

                    <h3>
                        Food Assistance
                    </h3>

                    <p>
                        Request food assistance and connect with
                        available community support.
                    </p>

                    <a href="FoodAssistance.aspx">
                        Get Food Help →
                    </a>

                </div>


                <!-- Emergency Help -->

                <div class="services-card">

                    <div class="services-icon">
                        🚨
                    </div>

                    <h3>
                        Emergency Help
                    </h3>

                    <p>
                        Submit an emergency request when immediate
                        community assistance is required.
                    </p>

                    <a href="EmergencyHelp.aspx">
                        Get Emergency Help →
                    </a>

                </div>


                <!-- Volunteer Support -->

                <div class="services-card">

                    <div class="services-icon">
                        🤝
                    </div>

                    <h3>
                        Volunteer Support
                    </h3>

                    <p>
                        Become a volunteer and help people who need
                        support in your community.
                    </p>

                    <a href="BecomeVolunteer.aspx">
                        Become a Volunteer →
                    </a>

                </div>


                <!-- Find Blood Donor -->

                <div class="services-card">

                    <div class="services-icon">
                        🔎
                    </div>

                    <h3>
                        Find Blood Donor
                    </h3>

                    <p>
                        Search for available blood donors according
                        to the required blood group.
                    </p>

                    <a href="FindBloodDonor.aspx">
                        Find a Donor →
                    </a>

                </div>


                <!-- Volunteer Requests -->

                <div class="services-card">

                    <div class="services-icon">
                        🙋
                    </div>

                    <h3>
                        Volunteer Requests
                    </h3>

                    <p>
                        View opportunities where volunteers can
                        provide support to people in need.
                    </p>

                    <a href="VolunteerRequest.aspx">
                        View Requests →
                    </a>

                </div>


                <!-- Resource Search -->

                <div class="services-card">

                    <div class="services-icon">
                        📋
                    </div>

                    <h3>
                        Resource Search
                    </h3>

                    <p>
                        Search for useful community resources and
                        available assistance.
                    </p>

                    <a href="ResourceSearch.aspx">
                        Search Resources →
                    </a>

                </div>


                <!-- Create Request -->

                <div class="services-card">

                    <div class="services-icon">
                        📝
                    </div>

                    <h3>
                        Create a Request
                    </h3>

                    <p>
                        Create a support request and let the LifeLink
                        community know how they can help.
                    </p>

                    <a href="CreateNewRequest.aspx">
                        Create Request →
                    </a>

                </div>

            </div>

        </div>

    </section>

</asp:Content>
<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Home.aspx.cs"
    Inherits="Lifelink.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- ================= HERO SECTION ================= -->

    <section class="home-hero">

        <div class="hero-container">

            <div class="hero-content">

                <div class="hero-badge">
                    Together, We Can Make a Difference
                </div>

                <h1>
                    Connecting People,<br />
                    <span>Creating Hope.</span>
                </h1>

                <p>
                    LifeLink connects people who need support with people
                    who are ready to help. Find assistance, raise a request,
                    or become a volunteer and make a difference in your community.
                </p>

                <div class="hero-buttons">

                    <a href="FindHelp.aspx" class="primary-btn">
                        Find Help
                    </a>

                    <a href="BecomeVolunteer.aspx" class="secondary-btn">
                        Become a Volunteer
                    </a>

                </div>

            </div>


            <div class="hero-visual">

                <div class="hero-card">

                    <div class="hero-icon">
                        ♥
                    </div>

                    <h3>
                        Help. Connect. Care.
                    </h3>

                    <p>
                        One platform for community support.
                    </p>

                </div>

            </div>

        </div>

    </section>


    <!-- ================= QUICK SERVICES ================= -->

    <section class="quick-services">

        <div class="home-container">

            <div class="section-heading">

                <span>OUR SERVICES</span>

                <h2>
                    How LifeLink Can Help
                </h2>

                <p>
                    Access essential community support services
                    through one simple platform.
                </p>

            </div>


            <div class="service-grid">

                <!-- Blood -->

                <div class="service-card">

                    <div class="service-icon blood-icon">
                        🩸
                    </div>

                    <h3>
                        Blood Assistance
                    </h3>

                    <p>
                        Request blood or connect with available
                        blood donors when someone needs help.
                    </p>

                    <a href="BloodRequest.aspx">
                        Request Blood →
                    </a>

                </div>


                <!-- Food -->

                <div class="service-card">

                    <div class="service-icon food-icon">
                        🍲
                    </div>

                    <h3>
                        Food Assistance
                    </h3>

                    <p>
                        Find or request food assistance and
                        connect with available community support.
                    </p>

                    <a href="FoodAssistance.aspx">
                        Get Food Help →
                    </a>

                </div>


                <!-- Emergency -->

                <div class="service-card">

                    <div class="service-icon emergency-icon">
                        🚨
                    </div>

                    <h3>
                        Emergency Help
                    </h3>

                    <p>
                        Submit an emergency request and get
                        connected with people who can help.
                    </p>

                    <a href="EmergencyHelp.aspx">
                        Get Emergency Help →
                    </a>

                </div>


                <!-- Volunteer -->

                <div class="service-card">

                    <div class="service-icon volunteer-icon">
                        🤝
                    </div>

                    <h3>
                        Volunteer Support
                    </h3>

                    <p>
                        Become a volunteer and help people
                        in your community.
                    </p>

                    <a href="BecomeVolunteer.aspx">
                        Become a Volunteer →
                    </a>

                </div>

            </div>

        </div>

    </section>

  
</asp:Content>
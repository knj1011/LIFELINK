<%@ Page Title="Manage Feedback" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="Lifelink.Admin.Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .feedback-container {
            padding: 25px;
            background: #F8F9FF;
            min-height: 80vh;
        }

        .page-title {
            color: #204077;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .page-description {
            color: #6B7280;
            margin-bottom: 25px;
        }

        .feedback-card {
            background: #FFFFFF;
            border: 1px solid #DCE6F5;
            border-radius: 12px;
            padding: 22px;
            box-shadow: 0 3px 12px rgba(32, 64, 119, 0.06);
        }

        .search-box {
            padding: 10px 12px;
            width: 260px;
            max-width: 100%;
            border: 1px solid #DCE6F5;
            border-radius: 6px;
            margin: 0 8px 10px 0;
        }

        .admin-button {
            background: #0066D9;
            color: white;
            border: none;
            padding: 10px 16px;
            border-radius: 6px;
            cursor: pointer;
            margin: 0 6px 10px 0;
        }

        .admin-button:hover {
            background: #0055B8;
        }

        .feedback-grid {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        .feedback-grid th {
            background: #204077;
            color: white;
            padding: 12px 10px;
            text-align: left;
        }

        .feedback-grid td {
            padding: 11px 10px;
            border-bottom: 1px solid #DCE6F5;
            overflow-wrap: anywhere;
            vertical-align: top;
        }

        .feedback-grid tr:nth-child(even) {
            background: #F8F9FF;
        }

        .table-scroll {
            overflow-x: auto;
        }

        .message {
            display: block;
            margin: 12px 0;
            color: #204077;
        }

        .feedback-stars {
            color: #F5A623;
            font-size: 18px;
            white-space: nowrap;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="feedback-container">

        <div class="page-title">User Feedback</div>

        <div class="page-description">
            View and search feedback submitted by LifeLink users.
        </div>

        <div class="feedback-card">

            <asp:TextBox ID="txtSearch" runat="server"
                CssClass="search-box"
                placeholder="Search feedback or user ID">
            </asp:TextBox>

            <asp:Button ID="btnSearch" runat="server"
                Text="Search"
                CssClass="admin-button"
                OnClick="btnSearch_Click" />

            <asp:Button ID="btnShowAll" runat="server"
                Text="Show All"
                CssClass="admin-button"
                CausesValidation="false"
                OnClick="btnShowAll_Click" />

            <asp:Label ID="lblMessage" runat="server"
                CssClass="message">
            </asp:Label>

            <asp:Label ID="lblFeedbackCount" runat="server"
                Font-Bold="true"
                ForeColor="#204077">
            </asp:Label>

            <div class="table-scroll">

                <asp:GridView ID="gvFeedback" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="feedback-grid"
                    GridLines="None"
                    EmptyDataText="No feedback records found."
                    AllowPaging="true"
                    PageSize="10"
                    OnPageIndexChanging="gvFeedback_PageIndexChanging">

                    <Columns>

                        <asp:BoundField
                            DataField="FeedbackID"
                            HeaderText="Feedback ID" />

                        <asp:BoundField
                            DataField="UserID"
                            HeaderText="User ID" />

                        <asp:BoundField
                            DataField="Subject"
                            HeaderText="Subject" />

                        <asp:BoundField
                            DataField="FeedbackMessage"
                            HeaderText="Feedback Message" />

                        <asp:TemplateField HeaderText="Rating">
                            <ItemTemplate>
                                <span class="feedback-stars"><%# new string('★', Math.Max(0, Math.Min(5, Convert.ToInt32(Eval("Rating"))))) %><%# new string('☆', 5 - Math.Max(0, Math.Min(5, Convert.ToInt32(Eval("Rating"))))) %></span>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                    <PagerStyle HorizontalAlign="Center" />

                </asp:GridView>

            </div>
        </div>
    </div>
</asp:Content>



<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyRequests.aspx.cs" Inherits="Lifelink.MyRequests" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Requests - LifeLink</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #F8F9FF;
            color: #1E1E1E;
        }

        .page-container {
            width: 92%;
            max-width: 1150px;
            margin: 45px auto;
        }

        .page-heading {
            margin-bottom: 25px;
        }

        .page-heading h1 {
            color: #204077;
            margin: 0 0 10px;
            font-size: 30px;
        }

        .page-heading p {
            color: #6B7280;
            margin: 0;
            line-height: 1.6;
        }

        .requests-card {
            background: #FFFFFF;
            padding: 25px;
            border: 1px solid #DCE6F5;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(32, 64, 119, 0.06);
        }

        .message {
            display: block;
            margin-bottom: 18px;
            color: #204077;
            line-height: 1.6;
        }

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }

        .requests-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 650px;
        }

        .requests-table th {
            background: #204077;
            color: #FFFFFF;
            text-align: left;
            padding: 14px 12px;
            font-size: 14px;
        }

        .requests-table td {
            padding: 14px 12px;
            border-bottom: 1px solid #DCE6F5;
            font-size: 14px;
            line-height: 1.5;
        }

        .requests-table tr:nth-child(even) td {
            background: #F8F9FF;
        }

        .status {
            color: #204077;
            font-weight: bold;
        }

        .back-link {
            display: inline-block;
            margin-top: 22px;
            padding: 11px 20px;
            background: #0066D9;
            color: #FFFFFF;
            text-decoration: none;
            border-radius: 6px;
        }

        .back-link:hover {
            background: #0055B8;
        }

        @media (max-width: 600px) {
            .page-container {
                width: 94%;
                margin: 25px auto;
            }

            .requests-card {
                padding: 15px;
            }

            .page-heading h1 {
                font-size: 25px;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <main class="page-container">

            <div class="page-heading">
                <h1>My Requests</h1>
                <p>View the service requests you have submitted through LifeLink.</p>
            </div>

            <section class="requests-card">

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="message"
                    EnableViewState="false">
                </asp:Label>

                <div class="table-wrapper">

                    <asp:GridView
                        ID="gvMyRequests"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="requests-table"
                        GridLines="None"
                        EmptyDataText="No requests found.">

                        <Columns>
                            <asp:BoundField
                                DataField="RequestID"
                                HeaderText="Request ID" />

                            <asp:BoundField
                                DataField="RequestType"
                                HeaderText="Request Type" />

                            <asp:BoundField
                                DataField="Description"
                                HeaderText="Details" />

                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <span class="status">
                                        <%#: Eval("RequestStatus") %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField
                                DataField="SubmittedDate"
                                HeaderText="Submitted Date" />
                        </Columns>

                    </asp:GridView>

                </div>

                <a href="Profile.aspx" class="back-link">
                    Back to Profile
                </a>

            </section>

        </main>

    </form>
</body>
</html>
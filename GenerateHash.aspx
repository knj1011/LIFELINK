<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="GenerateHash.aspx.cs"
    Inherits="Lifelink.GenerateHash" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Generate Admin Password Hash</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Generate Admin Password Hash</h2>

        <asp:Label ID="lblPassword" runat="server"
            Text="Enter your admin password:" />

        <br /><br />

        <asp:TextBox ID="txtPassword" runat="server"
            TextMode="Password" />

        <br /><br />

        <asp:Button ID="btnGenerate" runat="server"
            Text="Generate Hash"
            OnClick="btnGenerate_Click" />

        <br /><br />

        <asp:Label ID="lblHash" runat="server" />

    </form>
</body>
</html>


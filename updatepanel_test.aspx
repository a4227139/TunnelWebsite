<%@ Page Language="C#" AutoEventWireup="true" CodeFile="updatepanel_test.aspx.cs" Inherits="updatepanel_test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    </div>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="True">
            <ContentTemplate>
                <asp:Label ID="Label2" runat="server" Text="Label2"></asp:Label>
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
         <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Label ID="Label3" runat="server" Text="Label3"></asp:Label>
                <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick">
                </asp:Timer>
                <br />
            </ContentTemplate>
             <Triggers >
                 <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
             </Triggers>
        </asp:UpdatePanel>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    </form>
</body>
</html>

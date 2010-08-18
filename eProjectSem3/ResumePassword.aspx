<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResumePassword.aspx.cs" Inherits="eProjectSem3_ResumePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td align="center" colspan="2">
                    <asp:Label ID="lbIntro" runat="server" Font-Bold="True" 
                        Text="Resume The Password"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="Label2" runat="server" Text="User Name:"></asp:Label>
                </td>
                <td align="center">
                    <asp:TextBox ID="txtUserName" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                        style="height: 26px" Text="Submit" />
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Label ID="lbInfo" runat="server" Text="..."></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

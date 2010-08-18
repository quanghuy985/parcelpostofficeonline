<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCustomer.aspx.cs" Inherits="AddCustomer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 154px;
        }
        .style2
        {
            width: 154px;
            height: 26px;
        }
        .style3
        {
            height: 26px;
            width: 361px;
        }
        .style4
        {
            width: 361px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="style1">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txtUsername" runat="server" Width="325px"></asp:TextBox>
                </td>
                <td>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtUsername" ErrorMessage="Ko dc de trong"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblMss" runat="server"></asp:Label>
                
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txtPassword" runat="server" Width="325px"></asp:TextBox>
                </td>
                <td>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtPassword" ErrorMessage="Ko dc de trong"></asp:RequiredFieldValidator>
                
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label3" runat="server" Text="Fullname"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txtFullname" runat="server" Width="325px"></asp:TextBox>
                </td>
                <td>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtFullname" ErrorMessage="Ko dc de trong"></asp:RequiredFieldValidator>
                
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label4" runat="server" Text="Address"></asp:Label>
                </td>
                <td class="style3">
                    <asp:TextBox ID="txtAddress" runat="server" Width="325px"></asp:TextBox>
                </td>
                <td>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtAddress" ErrorMessage="Ko dc de trong"></asp:RequiredFieldValidator>
                
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label5" runat="server" Text="Email"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txtEmail" runat="server" Width="325px"></asp:TextBox>
                </td>
                <td>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Ko dc de trong"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Email must be right format" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="Label6" runat="server" Text="Ok" onclick="Label6_Click"></asp:Button>
                    <asp:Button ID="TextBox1" runat="server" Text="Cancel"></asp:Button>
                </td>               
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

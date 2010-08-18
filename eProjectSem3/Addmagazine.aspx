<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Addmagazine.aspx.cs" Inherits="Addmagazine" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
        }
        .style2
        {
            width: 172px;
            height: 92px;
        }
        .style3
        {
            height: 92px;
        }
        #filMyFile
        {
            width: 226px;
        }
        .style4
        {
            height: 58px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 51%;">
            <tr>
                <td align="center" colspan="2" style="color: #0000FF; font-size: x-large">
                    Add Magazine Daily</td>
            </tr>
            <tr>
                <td class="style1">
                    MagaZine Name</td>
                <td>
                    <asp:TextBox ID="txtmagaName" runat="server" Width="211px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtmagaName" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    MagaZine Description</td>
                <td class="style3">
                    <asp:TextBox ID="txtMagaDescrip" runat="server" Height="91px" TextMode="MultiLine" 
                        Width="207px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtMagaDescrip" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    MagaZine Imgae</td>
                <td>
                     <asp:FileUpload ID="FileUpload1" runat="server" /></td>
            </tr>
            <tr>
                <td class="style4" align="center" colspan="2">
                    <asp:Button ID="btnSumit" runat="server" onclick="btnSumit_Click" 
                        Text="Submit" />
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

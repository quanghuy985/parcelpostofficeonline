<%@ Page Language="C#" AutoEventWireup="true" CodeFile="checkOutMagazine.aspx.cs" Inherits="checkOutMagazine" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
        }
        .style3
        {
            width: 43px;
        }
        .style4
        {
            width: 100px;
            height: 36px;
        }
        .style5
        {
            height: 36px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 50%; height: 98px;">
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td align="center">
                    Thong tin khach hang</td>
                <td class="style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    Service Detail</td>
                <td colspan="2" class="style5">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Adress</td>
                <td colspan="2" style="color: #FF0000">
                    <asp:TextBox ID="txtadress" runat="server" Width="210px"></asp:TextBox>
                    <br />
                    please insert full infomation<br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="you "></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style1" align="center" colspan="3">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit" />
                </td>
            </tr>
            </table>
    
    </div>
    </form>
</body>
</html>

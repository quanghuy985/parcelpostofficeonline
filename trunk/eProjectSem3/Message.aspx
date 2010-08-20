<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Message.aspx.cs" Inherits="Message" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 270px;
        }
        .style2
        {
            width: 512px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style2" align="left">
                  <p style="font-family:Arial; font-style:oblique"> <li>Parcel Post Office Online Message :</li></p></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style2" align="left">
                    <p style="font-family:Times New Roman;font-style:italic">Thank you with your reliability. </p>
                    <p style="font-family:Times New Roman;font-style:italic">Your Order is : 
                        <asp:Label ID="lbOrder" runat="server" Text="" Font-Bold="true"></asp:Label></p>
                        <p style="font-family:Times New Roman;font-style:italic"> We will reply for you as soon as we can. And you can check status of parcel through personal page.</p>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="revenue.aspx.cs" Inherits="Adminstrator_revenue" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 155px;
        }
        .style2
        {
            width: 253px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Panel ID="Panel1" runat="server" GroupingText="All Order">
        <table style="width:100%;">
            <tr>
                <td class="style1">
                    Total Order</td>
                <td class="style2">
                    <asp:LinkButton ID="lbltatalorder" runat="server">Total Order</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Total Order Avalible</td>
                <td class="style2">
                    <asp:LinkButton ID="lblorderavailable" runat="server">Order available</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Total Order Finnish</td>
                <td class="style2">
                    <asp:LinkButton ID="lblorderfinsh" runat="server">Order finnish</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Total Renvue</td>
                <td class="style2">
                    <asp:LinkButton ID="lblrevence" runat="server">Revence</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <asp:Panel ID="Panel3" runat="server">
    </asp:Panel>
  
    <asp:Panel ID="Panel2" runat="server" GroupingText="Parcel Order" 
        ToolTip="Parcel Order">
        <table style="width:100%;">
            <tr>
                <td>
                    Total Parcel Available</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Total Parcel Need confirm</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Total parcel Sending</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Total parcel Delivey</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Total revence Parcel</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <asp:Panel ID="Panel4" runat="server" GroupingText="Magazine Order">
        <table style="width:100%;">
            <tr>
                <td>
                    Total Revence Magazine</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    </form>
</body>
</html>

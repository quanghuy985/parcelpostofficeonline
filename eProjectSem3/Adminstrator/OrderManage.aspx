<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Adminstrator/MasterPage.master"
    CodeFile="OrderManage.aspx.cs" Inherits="Adminstrator_OrderManage" %>

<asp:Content ID="cntContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table width="100%">
            <tr>
                <td style="width: 40%" align="center">
                    <asp:Label ID="lbReport" runat="server" Text="Report" Font-Bold="true" Font-Italic="true"></asp:Label>
                </td>
                <td style="width: 40%" align="center">
                    <asp:Label ID="lbNumber" runat="server" Text="Number" Font-Bold="true" Font-Italic="true"></asp:Label>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 40%">
                    <asp:Label ID="lbTotalOrderAvailable" runat="server" Text="Order Available :"></asp:Label>
                </td>
                <td align="center">
                    <asp:LinkButton ID="lbtSumOrderAvailable" runat="server" OnCommand="lbtSumOrderAvailableComand" CommandArgument=''>
                        <asp:Label ID="lbSumOrderAvailable" runat="server" Text=""></asp:Label></asp:LinkButton>
                    
                </td>
            </tr>
            <tr>
                <td style="width: 40%">
                    <asp:Label ID="lbOrderNeedConfirm" runat="server" Text="Order Confirm :"></asp:Label>
                </td>
                <td align="center">
                   <asp:LinkButton ID="lbtSumOrderNeedConfirm" runat="server" OnCommand="lbtSumOrderNeedConfirmComand" CommandArgument=''>
                        <asp:Label ID="lbSumOrderNeedConfirm" runat="server" Text=""></asp:Label></asp:LinkButton>
                    
                </td>
            </tr>
            <tr>
                <td style="width: 40%">
                    <asp:Label ID="lbOrderSending" runat="server" Text="Order Sending :"></asp:Label>
                </td>
                <td align="center">
                    <asp:LinkButton ID="lbtSumOrderSending" runat="server" OnCommand="lbSumOrderSendingComand" CommandArgument=''>
                        <asp:Label ID="lbSumOrderSending" runat="server" Text=""></asp:Label>
                    </asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td style="width: 40%">
                    <asp:Label ID="lbOrderDelivery" runat="server" Text="Order Delivery :"></asp:Label>
                </td>
                <td align="center">
                     <asp:LinkButton ID="lbtSumOrderDelivery" runat="server" OnCommand="lbSumOrderDeliveryComand" CommandArgument=''>
                        <asp:Label ID="lbSumOrderDelivery" runat="server" Text=""></asp:Label>
                    </asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td style="width: 40%">
                    <asp:Label ID="lbOrderDeny" runat="server" Text="Order Deny :"></asp:Label>
                </td>
                <td align="center">
                    <asp:LinkButton ID="lbtSumOrderDeny" runat="server" OnCommand="lbSumOrderDenyComand" CommandArgument=''>
                        <asp:Label ID="lbSumOrderDeny" runat="server" Text=""></asp:Label>
                    </asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

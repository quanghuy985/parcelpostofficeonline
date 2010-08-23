<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Adminstrator/MasterPage1.master"
    CodeFile="UpdateOrder.aspx.cs" Inherits="Adminstrator_UpdateOrder" %>

<asp:Content ID="cntContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table width="100%" style="font-family: Times New Roman; font-style: italic">
            <tr>
                <td style="width: 150px">
                    Order Detail ID :
                </td>
                <td style="width: 500px">
                    <asp:Label ID="lbOrderDetailID" runat="server" Text=""></asp:Label>
                </td>
                <td style="width:30%">
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    Customer Name :
                </td>
                <td>
                    <asp:Label ID="lbCustomerName" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    Service Detail Name :
                </td>
                <td>
                    <asp:Label ID="lbServiceDetailName" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    Parcel Post Name :
                </td>
                <td>
                    <asp:Label ID="lbParcelPostName" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    From Address :
                </td>
                <td>
                    <asp:Label ID="lbParcelFromAddress" runat="server" Text=""></asp:Label>
                &nbsp;, District :
                    <asp:Label ID="lbParcelFromDistrict" runat="server" Text=""></asp:Label>
                &nbsp;,&nbsp;City :
                <asp:Label ID="lbParcelFromCity" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    To Address :
                </td>
                <td>
                    <asp:Label ID="lbParcelToAddress" runat="server" Text=""></asp:Label>
                &nbsp;, District :
                    <asp:Label ID="lbParcelToDistrict" runat="server" Text=""></asp:Label>
                &nbsp;,&nbsp;City :
                    <asp:Label ID="lbParcelToCity" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    Weight :</td>
                <td>
                    <asp:TextBox ID="txtWeight" runat="server" Width="161px" 
                        ontextchanged="txtWeight_TextChanged"></asp:TextBox>
                    <asp:Label ID="Label4" runat="server" ForeColor="#00CCFF" Text="KG"></asp:Label>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="Weight must be number" ValidationExpression="^[0-9]*$" ControlToValidate="txtWeight">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    Post Price :</td>
                <td>
                    <asp:Label ID="lbParcelPostPrice" runat="server" Text=""></asp:Label>
                    <asp:Label ID="Label5" runat="server" ForeColor="#00CCFF" Text="USD/KG"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    Additional Fee :</td>
                <td>
                    <asp:TextBox ID="txtAdditionalFee" runat="server" Width="161px" 
                        ontextchanged="txtAdditionalFee_TextChanged"></asp:TextBox>
                    <asp:Label ID="Label3" runat="server" ForeColor="#00CCFF" Text="USD"></asp:Label>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ErrorMessage="Weight must be number" ValidationExpression="^[0-9]*$" 
                        ControlToValidate="txtAdditionalFee">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    Discount Name :</td>
                <td>
                    <asp:Label ID="lbDiscountName" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    Discount Price:</td>
                <td>
                    <asp:TextBox ID="txtDiscount" runat="server" Width="161px" 
                        ontextchanged="txtDiscount_TextChanged"></asp:TextBox>
                    <asp:Label ID="Label2" runat="server" ForeColor="#00CCFF" Text="USD"></asp:Label>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ErrorMessage="Weight must be number" ValidationExpression="^[0-9]*$" 
                        ControlToValidate="txtDiscount">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    Total Amount :</td>
                <td>
                    <asp:Label ID="lbTotalAmount" runat="server" Text=""></asp:Label>
                    <asp:Label ID="Label1" runat="server" ForeColor="#00CCFF" Text="USD"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    Date Order :</td>
                <td>
                    <asp:Label ID="lbDateOrder" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    Date Treat :</td>
                <td>
                    <asp:Label ID="lbDateTreat" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    Status :</td>
                <td>
                    <asp:DropDownList ID="ddlStatus" runat="server">
                        <asp:ListItem Value="0">Available</asp:ListItem>
                        <asp:ListItem Value="1">Pending</asp:ListItem>
                        <asp:ListItem Value="2">Sending</asp:ListItem>
                        <asp:ListItem Value="3">Delivery</asp:ListItem>
                        <asp:ListItem Value="4">Deny</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    &nbsp;</td>
                <td>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        HeaderText="List Error :" />
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btSubmit" runat="server" Text="Submit" 
                        onclick="btSubmit_Click" />
                    <asp:Button ID="btCancel" runat="server" Text="Cancel" 
                        onclick="btCancel_Click" />
                </td>
            </tr>
            </table>
    </div>
</asp:Content>

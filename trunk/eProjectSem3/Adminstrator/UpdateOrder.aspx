<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateOrder.aspx.cs" Inherits="Adminstrator_UpdateOrder" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Dashboard - Admin Template</title>
    <link rel="stylesheet" type="text/css" href="css/theme.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />

    <script>
        var StyleFile = "theme" + document.cookie.charAt(6) + ".css";
        document.writeln('<link rel="stylesheet" type="text/css" href="css/' + StyleFile + '">');
    </script>


    <script src="../js/jquery-1.4.2.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
        var $j = jQuery.noConflict();
        $j(document).ready(function() {
            $j("#txtWeight").blur(function() {

                $j.ajax({
                    type: "POST",
                    url: "UpdateOrder.aspx/txtWeightChanged",
                    data: "{type:'huyhcker','parcelWeight':'" + document.getElementById("txtWeight").value + "','parcelPostPrice':'" + $j("#lbParcelPostPrice").text() + "','addFee':'" + document.getElementById("txtAdditionalFee").value + "','discountPrice':'" + document.getElementById("txtDiscount").value + "'}",

                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(message) {
                    $j("#lbTotalAmount").text(message.d);
                    }
                });
            });

            $j("#txtAdditionalFee").change(function() {
                $j.ajax({
                    type: "POST",
                    url: "UpdateOrder.aspx/txtWeightChanged",

                    data: "{type:'huyhcker','parcelWeight':'" + document.getElementById("txtWeight").value + "','parcelPostPrice':'" + $j("#lbParcelPostPrice").text() + "','addFee':'" + document.getElementById("txtAdditionalFee").value + "','discountPrice':'" + document.getElementById("txtDiscount").value + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(message) {
                    $j("#lbTotalAmount").text(message.d);
                    }
                });

            });
            $j("#txtDiscount").change(function() {
                $j.ajax({
                    type: "POST",
                    url: "UpdateOrder.aspx/txtWeightChanged",

                    data: "{type:'huyhcker','parcelWeight':'" + document.getElementById("txtWeight").value + "','parcelPostPrice':'" + $j("#lbParcelPostPrice").text() + "','addFee':'" + document.getElementById("txtAdditionalFee").value + "','discountPrice':'" + document.getElementById("txtDiscount").value + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(message) {
                    $j("#lbTotalAmount").text(message.d);
                    }
                });
            });

            $j("#btSubmit").click(function() {
                $j.ajax({
                    type: "POST",
                    url: "UpdateOrder.aspx/btSubmitClick",

                    data: "{type:'huyhcker','parcelWeight':'" + document.getElementById("txtWeight").value + "','status':'" + $j("#<%=ddlStatus.ClientID%>").val() + "','addFee':'" + document.getElementById("txtAdditionalFee").value + "','discountPrice':'" + document.getElementById("txtDiscount").value + "','orderDetailID':'" + $j("#lbOrderDetailID").text() + "','orderID':'" + $j("#lbOrderID").text() + "','empUserName':'" + $j("#lbEmpUserName").text() + "','totalAmount':'" + $j("#lbTotalAmount").text() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(message) {
                        $j("#lbOutPut").text(message.d);
                    }
                });
            });

        });
    </script>

</head>
<body>
    <div id="container">
        <div id="header">
            <h2>
                My eCommerce Admin area</h2>
            <div id="topmenu">
                <ul>
                    <li><a href="revenue.aspx">Home</a></li>
                    <li><a href="newmanager.aspx">News Manage</a></li>
                    <li><a href="FeedBackManage.aspx">FeedBack</a></li>
                    <li><a href="MagazineManager.aspx">Magazine Manage</a></li>
                    <li><a href="ServiceDetailManage.aspx">Service Manage</a></li>
                    <li><a href="OrderManage.aspx">Parcel Order</a></li>
                    <li><a href="revenue.aspx">Revenue Manage</a></li>
                    <li><a href="Login.aspx">Login</a></li>
                </ul>
            </div>
        </div>
        <div id="top-panel">
            <div id="panel">
                <table>
                    <tr>
                        <td>
                            Welcome :
                            <asp:Label ID="lbUser" runat="server" Text=""></asp:Label>! Have A Nice Day...
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="wrapper">
            <div id="content">
                <form id="Form1" runat="server">
    <div>
        <table style="font-family: Times New Roman; font-style: italic">
            <tr>
                <td style="width: 150px">
                    Order Detail ID :
                </td>
                <td style="width: 500px">
                    <asp:Label ID="lbOrderDetailID" runat="server" Text=""></asp:Label>
                </td>
                <td style="width: 30%">
                    WelCome :
                    <asp:Label ID="lbEmpUserName" runat="server" Text=""></asp:Label>
                    ! Have A Nice Day
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    Order ID :
                </td>
                <td style="width: 500px">
                    <asp:Label ID="lbOrderID" runat="server" Text=""></asp:Label>
                </td>
                <td style="width: 30%">
                    &nbsp;
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
                    Weight :
                </td>
                <td>
                    <asp:TextBox ID="txtWeight" runat="server" Width="161px"></asp:TextBox>
                    <asp:Label ID="Label4" runat="server" ForeColor="#00CCFF" Text="KG"></asp:Label>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Weight must be number"
                        ValidationExpression="^[0-9]*$" ControlToValidate="txtWeight">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    Post Price :
                </td>
                <td>
                    <asp:Label ID="lbParcelPostPrice" runat="server" Text=""></asp:Label>
                    <asp:Label ID="Label5" runat="server" ForeColor="#00CCFF" Text="USD/KG"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    Additional Fee :
                </td>
                <td>
                    <asp:TextBox ID="txtAdditionalFee" runat="server" Width="161px"></asp:TextBox>
                    <asp:Label ID="Label3" runat="server" ForeColor="#00CCFF" Text="USD"></asp:Label>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Weight must be number"
                        ValidationExpression="^[0-9]*$" ControlToValidate="txtAdditionalFee">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    Discount Name :
                </td>
                <td>
                    <asp:Label ID="lbDiscountName" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    Discount Price:
                </td>
                <td>
                    <asp:TextBox ID="txtDiscount" runat="server" Width="161px"></asp:TextBox>
                    <asp:Label ID="Label2" runat="server" ForeColor="#00CCFF" Text="USD"></asp:Label>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Weight must be number"
                        ValidationExpression="^[0-9]*$" ControlToValidate="txtDiscount">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    Total Amount :
                </td>
                <td>
                    <asp:Label ID="lbTotalAmount" runat="server" Text=""></asp:Label>
                    <asp:Label ID="Label1" runat="server" ForeColor="#00CCFF" Text="USD"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    Date Order :
                </td>
                <td>
                    <asp:Label ID="lbDateOrder" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    Date Treat :
                </td>
                <td>
                    <asp:Label ID="lbDateTreat" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    Status :
                </td>
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
                    &nbsp;
                </td>
                <td>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="List Error :" />
                    <asp:Label ID="lbOutPut" runat="server" ForeColor="#0099CC"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    &nbsp;
                </td>
                <td>
                    <input type="button" id="btSubmit" value="Submit" />
                    <asp:Button ID="btCancel" runat="server" Text="Cancel" OnClick="btCancel_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

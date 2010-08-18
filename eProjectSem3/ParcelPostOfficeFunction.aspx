<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ParcelPostOfficeFunction.aspx.cs"
    Inherits="ParcelPostOfficeFunction" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="js/jquery-1.4.2.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
        var $j = jQuery.noConflict();
        $j(document).ready(function() {





            $j("#txtAddressForeign").change(function() {
                $j("#checkOption").text("From In Viet Nam to Foreign");
                $j("#checkOption").val("From In Viet Nam to Foreign");
                $j("#pnDetail").slideDown("slow");

                $j.ajax({
                    type: "POST",
                    url: "ParcelPostOfficeFunction.aspx/CalculateFee",

                    data: "{'parcelName':'" + $j("#<%=checkOption.ClientID%>").val() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(message) {
                        $j("#spFee").text(message.d);
                    }
                });
            });

            //Set Option cho Parcel
            $j("#ddlCityTo").change(function() {

                $j.ajax({
                    type: "POST",
                    url: "ParcelPostOfficeFunction.aspx/CalculateLocation",
                    data: "{type:'huyhcker','fromCity':'" + $j("#<%=ddlCity.ClientID%>").val() + "','toCity':'" + $j("#<%=ddlCityTo.ClientID%>").val() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(messageoption) {
                        $j("#checkOption").text(messageoption.d);
                        $j("#checkOption").val(messageoption.d);
                        $j.ajax({
                            type: "POST",
                            url: "ParcelPostOfficeFunction.aspx/CalculateFee",

                            data: "{'parcelName':'" + messageoption.d + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function(message) {
                                $j("#spFee").text(message.d);
                            }
                        });
                    }
                });
                $j("#pnDetail").slideDown("slow");
            });






            // Kiem Xem Gui Di nuoc ngoai hay trong nuoc de cho panel xuat hien
            $j("#cbSendTo").change(function() {
                if ($j("#cbSendTo:checked").length >= 1) {

                    $j("#pnSendtoforeign").slideDown("slow");
                    $j("#pnTo").hide();
                    $j("#pnDetail").slideUp("slow");
                    $j("#pnTotalAmount").slideUp("slow");
                    document.getElementById("txtWeight").value = "";
                }
                else {
                    $j("#pnSendtoforeign").hide();
                    $j("#pnDetail").slideUp("slow");
                    $j("#pnTo").slideDown("slow");
                    $j("#pnTotalAmount").slideUp("slow");
                    document.getElementById("txtWeight").value = "";
                    document.getElementById("txtAddressForeign").value = "";

                }
            });
            // Make the AJAX call to the WebMethod when the textbox loses focus
            $j("#ddlCity").change(function() {
                if ($j("#<%=ddlCity.ClientID%>").val() != "") {

                    $j.ajax({
                        type: "POST",
                        url: "ParcelPostOfficeFunction.aspx/GetDistrictByCity",
                        data: "{'city':'" + $j("#<%=ddlCity.ClientID%>").val() + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function(message) {
                            document.getElementById("ddlDistrict").options.length = 0;
                            for (var i = 0; i < message.d.length; i++) {

                                var opt = document.createElement("option");
                                opt.text = message.d[i];
                                opt.value = message.d[i];
                                document.getElementById("ddlDistrict").options.add(opt);
                            }
                        }
                    });
                    if ($j("#cbSendTo:checked").length >= 1) {
                        $j("#checkOption").text("From In Viet Nam to Foreign");
                        $j("#checkOption").val("From In Viet Nam to Foreign");
                        $j("#pnDetail").slideDown("slow");
                        $j("#pnTotalAmount").slideUp("slow");
                        document.getElementById("txtWeight").value = "";
                        $j.ajax({
                            type: "POST",
                            url: "ParcelPostOfficeFunction.aspx/CalculateFee",

                            data: "{'parcelName':'" + $j("#<%=checkOption.ClientID%>").val() + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function(message) {
                                $j("#spFee").text(message.d);
                            }
                        });
                    } else {
                        $j.ajax({
                            type: "POST",
                            url: "ParcelPostOfficeFunction.aspx/CalculateLocation",
                            data: "{type:'huyhcker','fromCity':'" + $j("#<%=ddlCity.ClientID%>").val() + "','toCity':'" + $j("#<%=ddlCityTo.ClientID%>").val() + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function(messageoption) {
                                $j("#checkOption").text(messageoption.d);
                                $j("#checkOption").val(messageoption.d);
                                $j.ajax({
                                    type: "POST",
                                    url: "ParcelPostOfficeFunction.aspx/CalculateFee",

                                    data: "{'parcelName':'" + messageoption.d + "'}",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function(message) {
                                        $j("#spFee").text(message.d);
                                        $j("#pnTotalAmount").slideUp("slow");
                                        document.getElementById("txtWeight").value = "";
                                    }
                                });
                            }
                        });
                    }
                }
            });


            // Tao su kien load data cho ddlDistrictTo

            $j("#ddlCityTo").change(function() {
                if ($j("#<%=ddlCityTo.ClientID%>").val() != "") {

                    $j.ajax({
                        type: "POST",
                        url: "ParcelPostOfficeFunction.aspx/GetDistrictByCity",
                        data: "{'city':'" + $j("#<%=ddlCityTo.ClientID%>").val() + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function(message) {
                            document.getElementById("ddlDistrictTo").options.length = 0;
                            for (var i = 0; i < message.d.length; i++) {

                                var opt = document.createElement("option");
                                opt.text = message.d[i];
                                opt.value = message.d[i];
                                document.getElementById("ddlDistrictTo").options.add(opt);

                            }
                            $j("#pnTotalAmount").slideUp("slow");
                            document.getElementById("txtWeight").value = "";
                        },
                        error: function(errormessage) {
                            //Hiển thị lỗi nếu xảy ra
                            $j("#checkReturn").text(errormessage.responseText);
                        }
                    });
                }
            });
            $j("#txtWeight").blur(function() {

                $j.ajax({
                    type: "POST",
                    url: "ParcelPostOfficeFunction.aspx/CalculateTotalAmount",

                    data: "{type:'huyhcker','Fee':'" + $j("#spFee").text() + "','weight':'" + document.getElementById("txtWeight").value + "','AddFee':'" + $j("#lbAddFee").text() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(message) {
                        $j("#lbTotal").text(message.d);
                        if ($j("#lbUser").val() == null) {
                            $j("#btSubmit").hide();
                            $j("#lbOutput").text("You need login to use this function");
                        }

                    }
                });
                $j.ajax({
                    type: "POST",
                    url: "ParcelPostOfficeFunction.aspx/getParcelPostID",

                    data: "{'parcelName':'" + $j("#<%=checkOption.ClientID%>").val() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(message) {
                        $j("#lbParcelPostID").text(message.d);
                    }
                });
                $j("#pnTotalAmount").slideDown("slow");
            });
        });
    </script>

    <script type="text/javascript">
        function clicker() {
            $j.ajax({
                type: "POST",
                url: "ParcelPostOfficeFunction.aspx/InsertOderDetail",

                data: "{type:'huyhcker','serviceDetailID':'" + $j("#lbServiceDetailID").text() + "','parcelPostID':'" + $j("#lbParcelPostID").text() + "','parcelFromAddress':'" + document.getElementById("txtAddress").value + "','parcelFromDistrict':'" + $j("#<%=ddlDistrict.ClientID%>").val() + "','parcelFromCity':'" + $j("#<%=ddlCity.ClientID%>").val() + "','parcelToAddress':'" + document.getElementById("txtAddressTo").value + "','parcelToDistrict':'" + $j("#<%=ddlDistrictTo.ClientID%>").val() + "','parcelToCity':'" + $j("#<%=ddlCityTo.ClientID%>").val() + "','parcelWeight':'" + document.getElementById("txtWeight").value + "','parcelAdditionalFee':'" + $j("#lbAddFee").text() + "','totalAmount':'" + $j("#lbTotal").text() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(message) {
                    $j("#lbOutput").text(message.d);
                }
            });

            return false;

        }
            
    </script>

    <style type="text/css">
        #pnSendtoforeign
        {
            display: none;
        }
        #pnDetail
        {
            display: none;
        }
        #pnDetail0
        {
            display: none;
        }
        #pnTotalAmount
        {
            display: none;
        }
        .style1
        {
            width: 360px;
        }
        .style2
        {
            width: 483px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="vertical-align: middle; width: 100%">
        <table width="100%">
            <tr>
                <td class="style1">
                </td>
                <td class="style2">
                    <asp:Panel ID="pnFrom" runat="server" GroupingText="From" Width="100%" BorderWidth="0px">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 25%" align="left">
                                    <asp:Label ID="lbFrom" Text="City :" runat="server"></asp:Label>
                                </td>
                                <td style="width: 50%" align="left">
                                    <asp:DropDownList ID="ddlCity" runat="server" Width="100%" AppendDataBoundItems="true">
                                        <asp:ListItem>--- Please select city ---</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 40%">
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Label ID="lbDistrict" runat="server" Text="District :"></asp:Label>
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="ddlDistrict" runat="server" Width="100%">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Label ID="lbAddress" runat="server" Text="Address :"></asp:Label>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtAddress" Width="100%" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Label ID="lbSendto" runat="server" Text="Send To :"></asp:Label>
                                </td>
                                <td align="left">
                                    <asp:CheckBox ID="cbSendTo" Text="Foreign Country" runat="server" />
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td style="width: 30%">
                </td>
            </tr>
            <tr>
                <td class="style1">
                </td>
                <td class="style2">
                    <asp:Panel ID="pnSendtoforeign" runat="server" GroupingText="Foreign Address">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 25%" align="left">
                                    <asp:Label ID="lbAddressForeign" runat="server" Text="Address :"></asp:Label>
                                </td>
                                <td style="width: 50%" align="left">
                                    <asp:TextBox ID="txtAddressForeign" runat="server" Width="100%"></asp:TextBox>
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td class="style1">
                </td>
                <td class="style2">
                    <asp:Panel ID="pnTo" runat="server" GroupingText="To">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 25%" align="left">
                                    <asp:Label ID="lbCityTo" runat="server" Text="City :"></asp:Label>
                                </td>
                                <td style="width: 50%" align="left">
                                    <asp:DropDownList ID="ddlCityTo" runat="server" Width="100%" AppendDataBoundItems="true">
                                        <asp:ListItem>--- Please select city ---</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Label ID="lbDistrictTo" runat="server" Text="District :"></asp:Label>
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="ddlDistrictTo" runat="server" Width="100%">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Label ID="lbAddressTo" runat="server" Text="Address :"></asp:Label>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtAddressTo" Width="100%" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td class="style1">
                </td>
                <td class="style2">
                    <asp:Panel ID="pnDetail" runat="server" GroupingText="Detail">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 25%" align="left">
                                    <asp:Label ID="lbLocation" runat="server" Text="Option :"></asp:Label>
                                </td>
                                <td style="width: 50%" align="left">
                                    <asp:Label ID="checkOption" runat="server" Text=""></asp:Label>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 25%" align="left">
                                    <asp:Label ID="lbFee" runat="server" Text="Fee :"></asp:Label>
                                </td>
                                <td style="width: 50%" align="left">
                                    <asp:Label ID="spFee" runat="server" Text=""></asp:Label>
                                    <asp:Label ID="lbFeeDescription1" runat="server" Font-Size="Small" ForeColor="BlueViolet"
                                        Text="USD/KG"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 25%" align="left">
                                    <asp:Label ID="lbWeight" runat="server" Text="Weight :"></asp:Label>
                                </td>
                                <td style="width: 50%">
                                    <asp:TextBox ID="txtWeight" runat="server" Width="100%"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 25%" align="left">
                                    <asp:Label ID="lbOptionSend" runat="server" Text="Kind to send :"></asp:Label>
                                </td>
                                <td style="width: 50%" align="left">
                                    <asp:Label ID="lbKindToSend" runat="server" Text=""></asp:Label>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 25%" align="left">
                                    <asp:Label ID="lbAdditionalFee" runat="server" Text="Additional Fee :"></asp:Label>
                                </td>
                                <td style="width: 50%" align="left">
                                    <asp:Label ID="lbAddFee" runat="server" Text=""></asp:Label>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;
                </td>
                <td class="style2">
                    <asp:Panel ID="pnTotalAmount" runat="server" GroupingText="Total Amount">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 25%" align="left">
                                    <asp:Label ID="lbTotalAmount" runat="server" Text="Total :"></asp:Label>
                                </td>
                                <td style="width: 50%" align="left">
                                    <asp:Label ID="lbTotal" runat="server" Text=""></asp:Label>
                                    <asp:Label ID="lbFeeDescription0" runat="server" Font-Size="Small" ForeColor="BlueViolet"
                                        Text="USD"></asp:Label>
                                    <asp:Label ID="lbParcelPostID" runat="server" Text="" Visible="false"></asp:Label>
                                    <asp:Label ID="lbServiceDetailID" runat="server" Text="" Visible="false"></asp:Label>
                                    <asp:Label ID="lbUser" runat="server" Visible="False"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 25%" align="left">
                                    &nbsp;
                                </td>
                                <td style="width: 50%" align="left">
                                    <asp:Button ID="btSubmit" runat="server" Text="Submit" Width="65px" />
                                    <asp:Button ID="btBack" runat="server" Text="Back" Width="68px" />
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%">
                                    &nbsp;
                                </td>
                                <td style="width: 50%">
                                    <asp:Label ID="lbOutput" runat="server" ForeColor="#0066FF"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

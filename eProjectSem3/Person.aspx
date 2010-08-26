<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Person.aspx.cs" Inherits="Person" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 706px;
        }
        .style3
        {
            width: 25%;
            height: 50px;
        }
        .style13
        {
            width: 706px;
            height: 53px;
        }
        .style11
        {
            text-align: right;
            width: 30%;
            height: auto;
        }
        .style22
        {
        }
        .style33
        {
            width: 40%;
        }
        .style35
        {
            width: 133px;
        }
        .style36
        {
            width: 20%;
            height: 23px;
        }
        .style37
        {
            height: 23px;
        }
        .style38
        {
            text-align: right;
            width: 50%;
        }
         #plDetails
       {
       	display:none;
       } 
        #Button7
        {
            width: 65px;
        }
    </style>

    <script src="Adminstrator/js/jquery-1.4.2.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        var $j = jQuery.noConflict();

        function clickhere(id,id1,id2,id3,id4,id5,id6,id7,id8) {
            $j("#plDetails").slideDown("slow");
            $j("#Label4").text(id);
            $j("#Label5").text(id1);
            $j("#Label6").text(id2);
            $j("#Label7").text(id3);
            $j("#Label8").text(id4);
            $j("#Label9").text(id5);
            $j("#Label10").text(id6);
            $j("#Label11").text(id7);
            $j("#Label12").text(id8);
                return false;
            }
            function hidepanel() {
                $j("#plDetails").slideUp("slow");           
                return false;
            }   
 </script>
</head>
<body>
    <form id="form1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" EnableScriptGlobalization="true"
        EnableScriptLocalization="true" />
    <table style="width: 100%; height: 566px;">
        <tr>
            <td class="style13">
            </td>
            <td class="style3">
                <img alt="" src="images/person-icon.jpg" style="width: 100%; height: 101px" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Panel ID="Panel3" runat="server" GroupingText="Change Your Password" Height="216px">
                    <table style="width: 100%;">
                        <tr>
                            <td class="style11">
                                &nbsp;</td>
                            <td class="style33">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style11">
                                New password :
                            </td>
                            <td class="style33">
                                <asp:TextBox ID="txtNewPass" runat="server" Height="22px" Width="100%"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style11">
                                Confirm new password :
                            </td>
                            <td class="style33">
                                <asp:TextBox ID="txtComPass" Height="22px" Width="100%" runat="server" ValidationGroup="123456abc"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style11">
                                &nbsp;
                            </td>
                            <td class="style22" colspan="2">
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPass"
                                    ControlToValidate="txtComPass" ErrorMessage="The Confirm New Password must match the New Password entry"></asp:CompareValidator>
                                <br />
                                <asp:Label ID="Label13" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                &nbsp;
                            </td>
                            <td class="style33">
                                <asp:Button ID="Button2" runat="server" Text="Change password" OnClick="Button2_Click" />
                                &nbsp;&nbsp;
                                <asp:Button ID="Button3" runat="server" Text="Cancel" OnClick="Button3_Click" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td style="width: 25%; vertical-align: top;" rowspan="4">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tbody>
                        <tr>
                            <td width="180" style="width: 7px; background-image: url(images/body_left_bgr.jpg)">
                            </td>
                            <td width="573" valign="top">
                                <div id="contentwrapper">
                                    <div id="contentcolumn" style="background: #e7e6e0">
                                    </div>
                                    <div id="leftcolumn">
                                        <div id="ctl00_MenuControl_PanelLogout">
                                            <div style="text-align: center;">
                                                <asp:Label ID="lbUserName" runat="server" Text="Label"></asp:Label>
                                                <b>&nbsp;</b>(<a href="https://ebank.vtc.vn/home/ebank.account.logout.html" class="link_1"><b>Logout</a>)</div>
                                        </div>
                                        <div class="boxshop">
                                            <div class="arrowlistmenu">
                                                <div class="headermenu" style="background: #e7e6e0">
                                                    Tài khoản</div>
                                                <ul>
                                                    <li>
                                                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Infomation</asp:LinkButton>
                                                    </li>
                                                    <li>
                                                        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">Change password</asp:LinkButton>
                                                    </li>
                                                    <li>
                                                        <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">Transaction History</asp:LinkButton>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="boxshop">
                                            <div class="arrowlistmenu">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td width="12" style="width: 7px; background-image: url(images/body_right_bgr.jpg)">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 7px; height: 7px;">
                                <img src="images/body_cor1.jpg" width="7" height="7" />
                            </td>
                            <td style="height: 7px; background-image: url(images/body_bot_bgr.jpg)">
                            </td>
                            <td style="width: 7px; height: 7px;">
                                <img src="images/body_cor2.jpg" width="7" height="7" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Panel ID="Panel4" runat="server" GroupingText="Account Information">
                    <table style="width: 100%; height: 175px;">
                        <tr>
                            <td align="right">
                                User name :
                            </td>
                            <td>
                                <asp:Label ID="lbUser" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Full name :
                            </td>
                            <td>
                                <asp:TextBox ID="txtFullname" runat="server" Height="20px" Width="307px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFullname"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Address :
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddress" runat="server" Height="83px" TextMode="MultiLine" Width="309px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAddress"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Email :
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmailInfo" runat="server" Height="19px" Width="308px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmailInfo"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Label ID="messeginfo" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Update" />
                                &nbsp;
                                <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Cancel" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Panel ID="plDetails" runat="server" GroupingText="Details">
                    <table style="width:100%;">
                        <tr>
                            <td class="style38">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style38">
                                From City :</td>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style38">
                                From District :</td>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style38">
                                To Address :</td>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style38">
                                To City :</td>
                            <td class="style37">
                                <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style38">
                                To District :</td>
                            <td>
                                <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style38">
                                To Address :</td>
                            <td>
                                <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style38">
                                Weight :</td>
                            <td class="style37">
                                <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style38">
                                Amount :</td>
                            <td>
                                <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style38">
                                Date :</td>
                            <td>
                                <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <input ID="Button7" onclick="hidepanel()" type="button" value="Ok" /></td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Panel ID="Panel5" runat="server" GroupingText="Transaction History" Height="406px">
                    <table style="width: 100%;">
                        <tr>
                            <td align="center" class="style36">
                                Available
                            </td>
                            <td align="center" colspan="2" class="style36">
                                Pending
                            </td>
                            <td align="center" class="style36" colspan="2">
                                Sending
                            </td>
                            <td align="center" colspan="2" class="style36">
                                Delivery
                            </td>
                            <td align="center" class="style36">
                                Deny
                            </td>
                        </tr>
                        <tr>
                            <td>
                                From Date :<asp:TextBox ID="txtToDate" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="txtToDate_CalendarExtender" runat="server" TargetControlID="txtToDate">
                                </ajaxToolkit:CalendarExtender>
                            </td>
                            <td class="style35">
                                <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*" Visible="False"></asp:Label>
                            </td>
                            <td colspan="2">
                                To&nbsp; Date :<asp:TextBox ID="txtFromDate" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="txtFromDate_CalendarExtender" runat="server" TargetControlID="txtFromDate">
                                </ajaxToolkit:CalendarExtender>
                            </td>
                            <td colspan="2">
                                <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*" Visible="False"></asp:Label>
                            </td>
                            <td colspan="2">
                                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Search" />
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="8" align="center">
                                <asp:Label ID="lbErrorMess" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="8">
                                <table style="width: 100%;" border="1">
                                    <asp:Repeater ID="rptAvailable" runat="server">
                                        <HeaderTemplate>
                                            <tr>
                                                <td style="width: 25%" align="center">
                                                    From City
                                                </td>
                                                <td style="width: 25%" align="center">
                                                    To City
                                                </td>
                                                <td align="center" style="width: 25%">
                                                    Date
                                                </td>
                                                <td align="center" style="width: 25%">
                                                    Details
                                                </td>
                                            </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td align="center" style="width: 25%">
                                                    <%# DataBinder.Eval(Container.DataItem, "parcelFromCity")%>
                                                </td>
                                                <td style="width: 25%" align="center">
                                                    <%# DataBinder.Eval(Container.DataItem, "parcelToCity")%>
                                                </td>
                                                <td align="center" style="width: 25%">
                                                    <%# DataBinder.Eval(Container.DataItem, "Date")%>
                                                </td>
                                                <td align="center" style="width: 25%">
                                                   <input id="Button1" class="Button1"  type="button" value="Detail"  onclick="clickhere('<%# DataBinder.Eval(Container.DataItem, "parcelFromCity")%>','<%# DataBinder.Eval(Container.DataItem, "parcelFromDistrict")%>','<%# DataBinder.Eval(Container.DataItem, "parcelFromAddress")%>','<%# DataBinder.Eval(Container.DataItem, "parcelToCity")%>','<%# DataBinder.Eval(Container.DataItem, "parcelToDistrict")%>','<%# DataBinder.Eval(Container.DataItem, "parcelToAddress")%>','<%# DataBinder.Eval(Container.DataItem, "parcelWeight")%>'+' Kg','<%# DataBinder.Eval(Container.DataItem, "totalAmount")%>'+' USD','<%# DataBinder.Eval(Container.DataItem, "Date")%>')"  />
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </table>
                                <table style="width: 100%;" border="1">
                                    <asp:Repeater ID="rptPending" runat="server">
                                        <HeaderTemplate>
                                            <tr>
                                                <td style="width: 20%" align="center">
                                                    From City
                                                </td>
                                                <td style="width: 20%" align="center">
                                                    To City
                                                </td>
                                                <td align="center" style="width: 20%">
                                                    Date
                                                </td>
                                                <td align="center" style="width: 40%">
                                                    Details
                                                </td>
                                            </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td align="center" style="width: 20%">
                                                    <%# DataBinder.Eval(Container.DataItem, "parcelFromCity")%>
                                                </td>
                                                <td style="width: 20%" align="center">
                                                    <%# DataBinder.Eval(Container.DataItem, "parcelToCity")%>
                                                </td>
                                                <td align="center" style="width: 20%">
                                                    <%# DataBinder.Eval(Container.DataItem, "Date")%>
                                                </td>
                                                <td align="center" style="width: 40%">
                                                    
                                                    <a href="#" onclick="clickhere('<%# DataBinder.Eval(Container.DataItem, "parcelFromCity")%>','<%# DataBinder.Eval(Container.DataItem, "parcelFromDistrict")%>','<%# DataBinder.Eval(Container.DataItem, "parcelFromAddress")%>','<%# DataBinder.Eval(Container.DataItem, "parcelToCity")%>','<%# DataBinder.Eval(Container.DataItem, "parcelToDistrict")%>','<%# DataBinder.Eval(Container.DataItem, "parcelToAddress")%>','<%# DataBinder.Eval(Container.DataItem, "parcelWeight")%>' +' Kg','<%# DataBinder.Eval(Container.DataItem, "totalAmount")%>'+' USD','<%# DataBinder.Eval(Container.DataItem, "Date")%>')">Detail...</a>
                                                    |
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "orderDetailID")%>'
                                                        Text="Check out..." OnCommand="DetailTranf" />
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

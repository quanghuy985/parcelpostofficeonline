<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ServiceDetailManage.aspx.cs"
    Inherits="Adminstrator_ServiceDetailManage" %>

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

    <script type="text/javascript">
        var $j = jQuery.noConflict();
        $j(document).ready(function() {
            $j("#btAdd").click(function() {
                $j("#pnAddNew").slideDown("slow");
            });
        });
    </script>

    <style type="text/css">
        .style1
        {
            width: 431px;
        }
        .style2
        {
            width: 572px;
        }
        .style3
        {
            width: 614px;
        }
        .style4
        {
            width: 200px;
        }
        .style5
        {
            width: 344px;
        }
        .style6
        {
            width: 260px;
        }
        .style7
        {
            width: 200px;
            height: 28px;
        }
        .style8
        {
            width: 344px;
            height: 28px;
        }
        .style9
        {
            width: 260px;
            height: 28px;
        }
        #pnAddNew
        {
            display: none;
        }
    </style>
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
                </ul>
            </div>
        </div>
        <div id="top-panel">
            <div id="panel">
                <table>
                    <tr>
                        <td style="width: 200px">
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
                    <table>
                        <tr>
                            <td class="style1">
                                &nbsp;
                            </td>
                            <td class="style3" align="center" style="font-family: Times New Roman; font-style: italic">
                                Servie Detail Table &nbsp;
                            </td>
                            <td class="style2">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                            </td>
                            <td class="style3">
                                <asp:GridView ID="gvServiceDetail" runat="server" AllowPaging="True" AllowSorting="True"
                                    AutoGenerateColumns="False" DataKeyNames="serviceDetailID" DataSourceID="ServiceDetailDataSource"
                                    BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px"
                                    CellPadding="4">
                                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                    <RowStyle BackColor="White" ForeColor="#330099" />
                                    <Columns>
                                        <asp:BoundField DataField="serviceDetailName" HeaderText="serviceDetailName" SortExpression="serviceDetailName" />
                                        <asp:BoundField DataField="serviceID" HeaderText="serviceID" SortExpression="serviceID" />
                                        <asp:BoundField DataField="serviceDetailID" HeaderText="serviceDetailID" InsertVisible="False"
                                            ReadOnly="True" SortExpression="serviceDetailID" />
                                        <asp:BoundField DataField="serviceDetailPrice" HeaderText="serviceDetailPrice" SortExpression="serviceDetailPrice" />
                                        <asp:BoundField DataField="adminUserName" HeaderText="adminUserName" SortExpression="adminUserName" />
                                        <asp:CheckBoxField DataField="serviceDetailStatus" HeaderText="serviceDetailStatus"
                                            SortExpression="serviceDetailStatus" />
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                Control
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <a href="ServiceDetail.aspx?serviceDetailID=<%# DataBinder.Eval(Container.DataItem, "serviceDetailID")%>">
                                                                More</a>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="ServiceDetailDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:callConnection %>"
                                    SelectCommand="SELECT [serviceDetailName], [serviceID], [serviceDetailID], [serviceDetailPrice], [serviceDetailImage], [adminUserName], [serviceDetailStatus] FROM [tblServiceDetail]">
                                </asp:SqlDataSource>
                                <input id="btAdd" type="button" value="Add New" />
                            </td>
                            <td class="style2">
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                &nbsp;
                            </td>
                            <td class="style3">
                                <asp:Panel ID="pnAddNew" runat="server" GroupingText="Add New" Width="705px">
                                    <table>
                                        <tr>
                                            <td class="style4">
                                                service Name :
                                            </td>
                                            <td class="style5">
                                                <asp:DropDownList ID="ddlServiceID" runat="server">
                                                    <asp:ListItem Value="1">Parcel Post Office</asp:ListItem>
                                                    <asp:ListItem Value="2">Magazine Daily</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="style6">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style4">
                                                service Detail Name :
                                            </td>
                                            <td class="style5">
                                                <asp:TextBox ID="txtServiceDetailName" runat="server" Width="341px"></asp:TextBox>
                                            </td>
                                            <td class="style6">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtServiceDetailName"
                                                    ErrorMessage="Service Detail Name not allow null">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style7">
                                                service Detail Description :
                                            </td>
                                            <td class="style8">
                                                <asp:TextBox ID="txtServiceDescription" runat="server" Rows="10" TextMode="MultiLine"
                                                    Width="341px"></asp:TextBox>
                                            </td>
                                            <td class="style9">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtServiceDescription"
                                                    ErrorMessage="Service Detail Description not allow null">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style7">
                                                Service Detail Price :
                                            </td>
                                            <td class="style8">
                                                <asp:TextBox ID="txtPrice" runat="server" Width="341px"></asp:TextBox>
                                            </td>
                                            <td class="style9">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPrice"
                                                    ErrorMessage="Service Detail Price not allow null">*</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPrice"
                                                    ErrorMessage="Price must be a number" ValidationExpression="^[0-9]*$">*</asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style7">
                                                Service Detail Image :
                                            </td>
                                            <td class="style8">
                                                <asp:FileUpload ID="fileUpLoad" runat="server" />
                                                <asp:Label ID="lbImage" runat="server"></asp:Label>
                                            </td>
                                            <td class="style9">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style7">
                                                Service Detail Status :
                                            </td>
                                            <td class="style8">
                                                <asp:DropDownList ID="ddlStatus" runat="server">
                                                    <asp:ListItem Value="0">False</asp:ListItem>
                                                    <asp:ListItem Value="1">True</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="style9">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style7">
                                                &nbsp;
                                            </td>
                                            <td class="style8">
                                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="List Error :" />
                                                <asp:Label ID="lbOutput" runat="server" ForeColor="#0099CC"></asp:Label>
                                            </td>
                                            <td class="style9">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style7">
                                                &nbsp;
                                            </td>
                                            <td class="style8">
                                                <asp:Button ID="btSubmit" runat="server" Text="Submit" OnClick="btSubmit_Click" />
                                                <asp:Button ID="btCancel" runat="server" Text="Cancel" OnClick="btCancel_Click" />
                                            </td>
                                            <td class="style9">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td class="style2">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div id="footer">
            <div id="credits">
                Template by <a href="http://www.bloganje.com">Bloganje</a>
            </div>
            <div id="styleswitcher">
                <ul>
                    <li><a href="javascript: document.cookie='theme='; window.location.reload();" title="Default"
                        id="defswitch">d</a></li>
                    <li><a href="javascript: document.cookie='theme=1'; window.location.reload();" title="Blue"
                        id="blueswitch">b</a></li>
                    <li><a href="javascript: document.cookie='theme=2'; window.location.reload();" title="Green"
                        id="greenswitch">g</a></li>
                    <li><a href="javascript: document.cookie='theme=3'; window.location.reload();" title="Brown"
                        id="brownswitch">b</a></li>
                    <li><a href="javascript: document.cookie='theme=4'; window.location.reload();" title="Mix"
                        id="mixswitch">m</a></li>
                    <li><a href="javascript: document.cookie='theme=5'; window.location.reload();" title="Mix"
                        id="defswitch">m</a></li>
                </ul>
            </div>
            <br />
        </div>
    </div>
</body>
</html>

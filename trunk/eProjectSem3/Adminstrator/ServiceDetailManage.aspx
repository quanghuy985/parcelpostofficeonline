<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ServiceDetailManage.aspx.cs"
    Inherits="Adminstrator_ServiceDetailManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
    <form id="form1" runat="server">
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
                        CellPadding="4" 
                        onselectedindexchanged="gvServiceDetail_SelectedIndexChanged">
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
                                                <a href="ServiceDetail.aspx?serviceDetailID=<%# DataBinder.Eval(Container.DataItem, "serviceDetailID")%>"  >More</a>
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
                    <asp:Panel ID="pnAddNew" runat="server" GroupingText="Add New" Width="824px">
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
                                        ErrorMessage="Price must be a number">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    Service Detail Image :
                                </td>
                                <td class="style8">
                                    <asp:FileUpload ID="fileUpLoad" runat="server" />
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
                                    <asp:DropDownList ID="DropDownList1" runat="server">
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
                                    <asp:Button ID="btSubmit" runat="server" Text="Submit" />
                                    <asp:Button ID="btCancel" runat="server" Text="Cancel" />
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
    </div>
    </form>
</body>
</html>

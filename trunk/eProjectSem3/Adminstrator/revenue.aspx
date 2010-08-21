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
        .style3
        {
            width: 191px;
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
                    <asp:LinkButton ID="lbltatalorder" runat="server" 
                        oncommand="lbltatalorder_Command">Total Order</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Total Order Avalible</td>
                <td class="style2">
                    <asp:LinkButton ID="lblorderavailable" runat="server" 
                        oncommand="lblorderavailable_Command">Order available</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Total Order Finnish</td>
                <td class="style2">
                    <asp:LinkButton ID="lblorderfinsh" runat="server" onclick="lblorderfinsh_Click">Order finnish</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Total Renvue</td>
                <td class="style2">
                    <asp:LinkButton ID="lblrevence" runat="server" onclick="lblrevence_Click" 
                        oncommand="lblrevence_Command">Revence</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <asp:Panel ID="paneltotalorder" runat="server" GroupingText="Total Order" 
        Visible="False">
        Start Date 
        <table style="width:100%;">
            <tr>
                <td align="center">
                    Start Date</td>
                <td align="center">
                    End Date</td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Calendar ID="Start_date" runat="server" BackColor="#FFFFCC" 
                        BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
                        EnableTheming="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" 
                        Height="66px" onselectionchanged="Start_date_SelectionChanged1" 
                        SelectedDate="2010-08-05" ShowDayHeader="False" Width="220px">
                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                        <SelectorStyle BackColor="#FFCC66" />
                        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#CC9966" />
                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
                            ForeColor="#FFFFCC" />
                    </asp:Calendar>
                </td>
                <td align="center">
                    <asp:Calendar ID="end_date" runat="server" BackColor="#FFFFCC" 
                        BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
                        EnableTheming="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" 
                        Height="66px" onselectionchanged="Start_date_SelectionChanged" 
                        ShowDayHeader="False" Width="220px">
                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                        <SelectorStyle BackColor="#FFCC66" />
                        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#CC9966" />
                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
                            ForeColor="#FFFFCC" />
                    </asp:Calendar>
                </td>
            </tr>
        </table>
        
        <br />
        <asp:GridView ID="GridView4" runat="server" Width="796px">
        </asp:GridView>
    </asp:Panel>
    <br />
    <asp:Panel ID="panelorderavailable" runat="server" 
        GroupingText="Total Order Available" Visible="False">
        <br />
        <table style="width:100%;">
            <tr>
                <td align="center">
                    Start Date</td>
                <td align="center">
                    End Date</td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Calendar ID="Start_date_1" runat="server" BackColor="#FFFFCC" 
                        BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
                        EnableTheming="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" 
                        Height="66px" onselectionchanged="Start_date_SelectionChanged1" 
                        SelectedDate="2010-08-05" ShowDayHeader="False" Width="220px">
                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                        <SelectorStyle BackColor="#FFCC66" />
                        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#CC9966" />
                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
                            ForeColor="#FFFFCC" />
                    </asp:Calendar>
                </td>
                <td align="center">
                    <asp:Calendar ID="end_date1" runat="server" BackColor="#FFFFCC" 
                        BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
                        EnableTheming="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" 
                        Height="66px" onselectionchanged="end_date1_SelectionChanged" 
                        ShowDayHeader="False" Width="220px">
                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                        <SelectorStyle BackColor="#FFCC66" />
                        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#CC9966" />
                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
                            ForeColor="#FFFFCC" />
                    </asp:Calendar>
                </td>
            </tr>
        </table>
        <asp:GridView ID="GridView_available" runat="server" Width="767px">
        </asp:GridView>
        <br />
        
    </asp:Panel>
    <br />
    <asp:Panel ID="panelorderfinish" runat="server" 
        GroupingText="Total Order Finsh" Visible="False">
        <asp:GridView ID="GridView3" runat="server" 
    AutoGenerateColumns="False" DataKeyNames="orderID" 
    DataSourceID="SqlDataSource3" 
    EmptyDataText="There are no data records to display." Width="795px">
            <Columns>
                <asp:BoundField DataField="orderID" HeaderText="orderID" 
            ReadOnly="True" SortExpression="orderID" />
                <asp:BoundField DataField="cusUserName" 
            HeaderText="cusUserName" SortExpression="cusUserName" />
                <asp:BoundField DataField="empUserName" 
            HeaderText="empUserName" SortExpression="empUserName" />
                <asp:CheckBoxField DataField="orderStatus" 
            HeaderText="orderStatus" SortExpression="orderStatus" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
    ConnectionString="<%$ ConnectionStrings:callConnection %>" 
    DeleteCommand="DELETE FROM [tblOrder] WHERE [orderID] = @orderID" 
    InsertCommand="INSERT INTO [tblOrder] ([cusUserName], [empUserName], [orderStatus]) VALUES (@cusUserName, @empUserName, @orderStatus)" 
    ProviderName="<%$ ConnectionStrings:callConnection.ProviderName %>" 
    SelectCommand="SELECT [orderID], [cusUserName], [empUserName], [orderStatus] FROM [tblOrder] WHERE ([orderStatus] = 3)" 
    
            UpdateCommand="UPDATE [tblOrder] SET [cusUserName] = @cusUserName, [empUserName] = @empUserName, [orderStatus] = @orderStatus WHERE [orderID] = @orderID">
            <DeleteParameters>
                <asp:Parameter Name="orderID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="cusUserName" Type="String" />
                <asp:Parameter Name="empUserName" Type="String" />
                <asp:Parameter Name="orderStatus" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="cusUserName" Type="String" />
                <asp:Parameter Name="empUserName" Type="String" />
                <asp:Parameter Name="orderStatus" Type="Boolean" />
                <asp:Parameter Name="orderID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <br />
    <asp:Panel ID="Paneltotalrevence" runat="server" GroupingText="Total Revee">
    </asp:Panel>
    <br />
    <br />
    <asp:Panel ID="Panel3" runat="server">
    </asp:Panel>
  
    <asp:Panel ID="Panel2" runat="server" GroupingText="Parcel Order" 
        ToolTip="Parcel Order">
        <table style="width:100%;">
            <tr>
                <td class="style3">
                    Total Parcel Available</td>
                <td>
                    <asp:LinkButton ID="lblparcelavailable" runat="server">availabl</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    Total Parcel Need confirm</td>
                <td>
                    <asp:LinkButton ID="lblparcelneedconfirm" runat="server">confirm</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    Total parcel Sending</td>
                <td>
                    <asp:LinkButton ID="lblrevence2" runat="server">Revence</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    Total parcel Delivey</td>
                <td>
                    <asp:LinkButton ID="lblparceldelivery" runat="server">delivery</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    Total parcel&nbsp; Deny </td>
                <td>
                    <asp:LinkButton ID="lblparceldenny" runat="server">Deny</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    Total revence Parcel</td>
                <td>
                    <asp:LinkButton ID="lblrevence5" runat="server">Revence</asp:LinkButton>
                </td>
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

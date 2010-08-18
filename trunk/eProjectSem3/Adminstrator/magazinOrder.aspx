<%@ Page Language="C#"  AutoEventWireup="true" MasterPageFile="~/Adminstrator/MasterPage1.master" CodeFile="magazinOrder.aspx.cs" Inherits="Adminstrator_magazinOrder" Title="Untitled Page" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="orderID"
        DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display." AllowPaging="True" 
        PageSize="5" onrowcommand="GridView1_RowCommand">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="orderID" HeaderText="orderID" ReadOnly="True" 
                SortExpression="orderID" InsertVisible="False" />
            <asp:BoundField DataField="cusUserName" HeaderText="cusUserName" SortExpression="cusUserName" />
            <asp:CheckBoxField DataField="orderStatus" HeaderText="orderStatus" SortExpression="orderStatus" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:callConnection %>"
        DeleteCommand="DELETE FROM [tblOrder] WHERE [orderID] = @orderID" InsertCommand="INSERT INTO [tblOrder] ([cusUserName], [empUserName], [orderStatus]) VALUES (@cusUserName, @empUserName, @orderStatus)"
        ProviderName="<%$ ConnectionStrings:callConnection.ProviderName %>" SelectCommand="SELECT distinct  tblOrder.orderID, tblOrder.cusUserName, tblOrder.orderStatus FROM tblOrder INNER JOIN tblOrderDetail ON tblOrder.orderID = tblOrderDetail.orderID WHERE (tblOrderDetail.magazineDailyID IS NOT NULL)"
        
        
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
    <br />
        </FooterTemplate>
    </asp:Repeater>
    

<br />
 <asp:Repeater ID="rpt_magazine" runat="server" >
        <HeaderTemplate>
            <table id="tb" border="1" cellpadding="2" width="100%" align="center">
                <tr >
                <th colspan="5">Cac tap chi da dat
                </th>
                </tr>
                <tr align="center">
                    <th style="color: Black">
                        OrderDetailID</th>
                    <th style="color: Black">
                        serviceDetailID</th>
                    <th style="color: Black">
                        magazine ID</th>
                    <th style="color: Black; " class="style1">
                        Month</th>
                        <th style="color: Black">
                            Address</th>
                              <th style="color: Black">
                                  Date</th>
                              <th style="color: Black">
                                  Cus Name</th>
                              <th style="color: Black">
                                  Status</th>
                              <th style="color: Black">
                            Thao tác</th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td style="color: Black">
                    <%# DataBinder.Eval(Container.DataItem, "orderDetailID")%></td>
                <td style="color: Black">
                    <%# DataBinder.Eval(Container.DataItem, "serviceDetailID")%></td>
                <td style="color: Black">
                  <%# DataBinder.Eval(Container.DataItem, "magazineDailyID")%>
              </td>
                <td style="color: Black; " class="style1">
                    <%# DataBinder.Eval(Container.DataItem, "monthMagazineDaily")%></td>
                    <td style="color:Black">
                    <%# DataBinder.Eval(Container.DataItem, "addressMagazineDaily")%></td>
                    </td>
                    <td> <%# DataBinder.Eval(Container.DataItem, "dateOrder")%></td></td>
                    <td> <%# DataBinder.Eval(Container.DataItem, "cusUserName")%></td></td>
                    <td> <%# DataBinder.Eval(Container.DataItem, "orderDetailStatus")%></td></td>
                    <td> <asp:Button ID="btnUpdate" runat="server" Text="C&#7853;p nh&#7853;t" 
                            CommandArgument='<%#DataBinder.Eval(Container.DataItem, "MagazineDailyID")%>' 
                            OnCommand="updateCart" Width="82px" />
                    <asp:Button ID="btnDelete" runat="server" Text="Xóa" 
                            CommandArgument='<%#DataBinder.Eval(Container.DataItem, "magazineDailyID")%>' 
                            OnCommand="deleteCart" Width="56px" /></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
<%@ Page Language="C#" MasterPageFile="~/Adminstrator/MasterPage.master" AutoEventWireup="true" CodeFile="MagazineManager.aspx.cs" Inherits="Adminstrator_MagazineManager" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%;">
       <tr>
       <td><asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="magazineDailyID" 
        DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display." PageSize="5" 
               BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
               CellPadding="3" Height="293px" Width="449px" 
               onrowcommand="GridView1_RowCommand" 
               onselectedindexchanged="GridView1_SelectedIndexChanged" CellSpacing="2">
           <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
           <RowStyle ForeColor="#8C4510" BackColor="#FFF7E7" />
        <Columns>
            <asp:CommandField SelectText="Update" ShowDeleteButton="True" 
                ShowSelectButton="True" />
            <asp:BoundField DataField="magazineDailyID" HeaderText="magazineDailyID" 
                ReadOnly="True" SortExpression="magazineDailyID" />
            <asp:BoundField DataField="serviceID" HeaderText="serviceID" 
                SortExpression="serviceID" />
            <asp:BoundField DataField="magazineName" HeaderText="magazineName" 
                SortExpression="magazineName" />
            <asp:BoundField DataField="magazineDescription" 
                HeaderText="magazineDescription" SortExpression="magazineDescription" />
            <asp:BoundField DataField="magazineImage" HeaderText="magazineImage" 
                SortExpression="magazineImage" />
            <asp:BoundField DataField="adminUserName" HeaderText="adminUserName" 
                SortExpression="adminUserName" />
            <asp:CheckBoxField DataField="magazineStatus" HeaderText="magazineStatus" 
                SortExpression="magazineStatus" />
            
            <asp:BoundField DataField="magazineStatus" SortExpression="magazineStatus" />
            
        </Columns>
           <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
           <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
           <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:callConnection %>" 
        DeleteCommand="DELETE FROM [tblMagazineDaily] WHERE [magazineDailyID] = @magazineDailyID" 
        InsertCommand="INSERT INTO [tblMagazineDaily] ([serviceID], [magazineName], [magazineDescription], [magazineImage], [adminUserName], [magazineStatus]) VALUES (@serviceID, @magazineName, @magazineDescription, @magazineImage, @adminUserName, @magazineStatus)" 
        ProviderName="<%$ ConnectionStrings:callConnection.ProviderName %>" 
        SelectCommand="SELECT [magazineDailyID], [serviceID], [magazineName], [magazineDescription], [magazineImage], [adminUserName], [magazineStatus] FROM [tblMagazineDaily]" 
        UpdateCommand="UPDATE [tblMagazineDaily] SET [serviceID] = @serviceID, [magazineName] = @magazineName, [magazineDescription] = @magazineDescription, [magazineImage] = @magazineImage, [adminUserName] = @adminUserName, [magazineStatus] = @magazineStatus WHERE [magazineDailyID] = @magazineDailyID">
        <DeleteParameters>
            <asp:Parameter Name="magazineDailyID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="serviceID" Type="Int32" />
            <asp:Parameter Name="magazineName" Type="String" />
            <asp:Parameter Name="magazineDescription" Type="String" />
            <asp:Parameter Name="magazineImage" Type="String" />
            <asp:Parameter Name="adminUserName" Type="String" />
            <asp:Parameter Name="magazineStatus" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="serviceID" Type="Int32" />
            <asp:Parameter Name="magazineName" Type="String" />
            <asp:Parameter Name="magazineDescription" Type="String" />
            <asp:Parameter Name="magazineImage" Type="String" />
            <asp:Parameter Name="adminUserName" Type="String" />
            <asp:Parameter Name="magazineStatus" Type="Boolean" />
            <asp:Parameter Name="magazineDailyID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</td>
</tr>
<tr>
<td>
    <asp:Button ID="btn_addnew" runat="server" Text="Add new magazine" 
        onclick="btn_addnew_Click" />
</td>
</tr>
<tr>
<td>
    <asp:Panel ID="panel_addnew" runat="server" Visible="False">
    <table style="width: 70%;"  >
            <tr>
                <td align="center" colspan="2" style="color: #0000FF; font-size: x-large">
                    Add Magazine Daily</td>
            </tr>
            <tr>
                <td class="style1">
                    MagaZine Name</td>
                <td>
                    <asp:TextBox ID="txtmagaName" runat="server" Width="211px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtmagaName" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    MagaZine Description</td>
                <td class="style3">
                    <asp:TextBox ID="txtMagaDescrip" runat="server" Height="135px" TextMode="MultiLine" 
                        Width="281px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtMagaDescrip" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    MagaZine Imgae</td>
                <td>
                    
                     <asp:FileUpload ID="FileUpload1" runat="server" ForeColor="Fuchsia" />
                     <asp:Label ID="lblImage" runat="server"></asp:Label>
                     <br />
                     Click button Browse if you want select new Image</td>
            </tr>
             <tr>
            <td>
                Status
            </td>
            <td>
                <asp:CheckBox ID="ctnstatus" runat="server" />
                 </td>
            </tr>
            <tr>
                <td class="style4" align="center" colspan="2">
                    <asp:Button ID="btn_addnew_" runat="server" onclick="btnSumit_Click" 
                        Text="Add new" style="height: 26px" />
                        <asp:Button ID="btn_update" runat="server" onclick="btn_update_Click" 
                        Text="Update New" style="height: 26px" />
                                            <br />
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="lblid" runat="server"></asp:Label>
                    <asp:Label ID="lblserviecid" runat="server"></asp:Label>
                </td>
            </tr>
           
        </table>
    </asp:Panel>
</td>
</tr>
    </table>
</asp:Content>


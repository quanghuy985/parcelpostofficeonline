<%@ Page Language="C#" MasterPageFile="~/Adminstrator/MasterPage.master" AutoEventWireup="true" CodeFile="newmanager.aspx.cs" Inherits="Adminstrator_newmanager" Title="Untitled Page" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table align="center" style="width: 100%; height: 334px;">
            <tr>
                <td align="center">
                    Update News</td>
            </tr>
            <tr>
                <td align="center" class="style1">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" DataKeyNames="newsID" DataSourceID="SqlDataSource1" 
                        EmptyDataText="There are no data records to display."
                        Width="621px" CellPadding="3" onrowcommand="GridView1_RowCommand" 
                        PageSize="3" onselectedindexchanged="GridView1_SelectedIndexChanged" 
                        onrowdeleting="GridView1_RowDeleting" BackColor="#DEBA84" 
                        BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" 
                        onrowdeleted="GridView1_RowDeleted">
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        <Columns>
                            <asp:CommandField SelectText="Update" ShowSelectButton="True" />
                            <asp:CommandField ShowDeleteButton="True"  />
                            <asp:BoundField DataField="newsID" HeaderText="newsID" ReadOnly="True" 
                                SortExpression="newsID" />
                            <asp:BoundField DataField="newsTitle" HeaderText="newsTitle" 
                                SortExpression="newsTitle" />
                            <asp:BoundField DataField="newsImage" HeaderText="newsImage" 
                                SortExpression="newsImage" />
                            <asp:BoundField DataField="adminUserName" HeaderText="adminUserName" 
                                SortExpression="adminUserName" />
                            <asp:CheckBoxField DataField="newsStatus" HeaderText="newsStatus" 
                                SortExpression="newsStatus" />
                            <asp:BoundField DataField="newsStatus" SortExpression="newsStatus" />
                            <asp:CommandField />
                        </Columns>
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:callConnection %>" 
                        DeleteCommand="DELETE FROM [tblNews] WHERE [newsID] = @newsID" 
                        InsertCommand="INSERT INTO [tblNews] ([newsTitle], [newsBrief], [newsContent], [newsImage], [adminUserName], [newsStatus]) VALUES (@newsTitle, @newsBrief, @newsContent, @newsImage, @adminUserName, @newsStatus)" 
                        ProviderName="<%$ ConnectionStrings:callConnection.ProviderName %>" 
                        SelectCommand="SELECT [newsID], [newsTitle], [newsBrief], [newsContent], [newsImage], [adminUserName], [newsStatus] FROM [tblNews]" 
                        UpdateCommand="UPDATE [tblNews] SET [newsTitle] = @newsTitle, [newsBrief] = @newsBrief, [newsContent] = @newsContent, [newsImage] = @newsImage, [adminUserName] = @adminUserName, [newsStatus] = @newsStatus WHERE [newsID] = @newsID">
                        <DeleteParameters>
                            <asp:Parameter Name="newsID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="newsTitle" Type="String" />
                            <asp:Parameter Name="newsBrief" Type="String" />
                            <asp:Parameter Name="newsContent" Type="String" />
                            <asp:Parameter Name="newsImage" Type="String" />
                            <asp:Parameter Name="adminUserName" Type="String" />
                            <asp:Parameter Name="newsStatus" Type="Boolean" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="newsTitle" Type="String" />
                            <asp:Parameter Name="newsBrief" Type="String" />
                            <asp:Parameter Name="newsContent" Type="String" />
                            <asp:Parameter Name="newsImage" Type="String" />
                            <asp:Parameter Name="adminUserName" Type="String" />
                            <asp:Parameter Name="newsStatus" Type="Boolean" />
                            <asp:Parameter Name="newsID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td >
                    <asp:Button ID="btn_addnew" runat="server" onclick="btn_addnew_Click" 
                        Text="Add New" />
                </td>
            </tr>
            </table>    

    <asp:Panel ID="Panel1" runat="server" Visible="False" 
        GroupingText="New Manager">
        <table align="center" border="0" style="width:100%;">
            <tr>
                <td align="center" colspan="3">
                    Update New</td>
            </tr>
            <tr>
                <td align="center" class="style3">
                    Title</td>
                <td colspan="2">
                    <asp:TextBox ID="txttitle" runat="server" Width="339px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" >
                    Brief</td>
                <td colspan="2">
                    <asp:TextBox ID="txtbrief" runat="server" Width="338px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" >
                    Content</td>
                <td colspan="2">
                    <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" BasePath="~/fckeditor/">
                    </FCKeditorV2:FCKeditor>
                                 
                </td>
            </tr>
            <tr>
                <td align="center" >
                    Image</td>
                <td colspan="2">
                    <asp:FileUpload ID="FileUpload1" runat="server" ForeColor="Black" />
                    <asp:Label ID="lblimage" runat="server" Text="Image"></asp:Label>
                    <br />
                    Click button Browse if you want select new Image</td>
            </tr>
            <tr>
                <td align="center">
                    Status</td>
                <td colspan="2">
                    <asp:CheckBox ID="ctnstatus" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="center" >
                    <asp:Button ID="btnaddnew" runat="server" Text="Add New" 
                        onclick="btnaddnew_Click" />
                </td>
                <td>
                    <asp:Button ID="btnupdate" runat="server" Text="Update" 
                        onclick="btnupdate_Click" />
                    <asp:Label ID="Label1" runat="server" ></asp:Label>
                </td>               
            </tr>
        </table>
    </asp:Panel>
</asp:Content>


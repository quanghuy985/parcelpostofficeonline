<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Adminstrator/MasterPage.master" CodeFile="FeedBackManage.aspx.cs" Inherits="Adminstrator_FeedBackManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <head >
    <title>Black Admin v2 - Template Admin - Nice Theme</title>
	
	
</head>

  
<div id="container"> <!-- Container -->
    <!-- END Sidebar -->
	<div id="main"> <!-- Main, right side content -->
		<div id="content"> <!-- Content begins here -->
            <div>
    
        <table align="center" style="width:100%;">
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td align="center">
                <asp:Panel ID="Panel2" runat="server" GroupingText="Các phản hồi">
               <%--
               <table style="width:100%;" border="1" >
              
                   <asp:Repeater ID="rptNewsDetail" runat="server">
                    <HeaderTemplate>
                     
                        <tr>
                        <td style="width:10%"> ID </td>
                            <td class="style1" align="left">
                                FeedBack Content</td>
                            <td align="left" class="style6" style="width:20%">
                                Sender</td>
                                 <td align="left" class="style7">
                                Email</td>
                                <td align="right" style="width:20%"> Action</td>
                        </tr>
                    
                    </HeaderTemplate>
                     <ItemTemplate>
                    
                      <tr>
                       <td style="width:10%"> <%# DataBinder.Eval(Container.DataItem, "feedID")%>
                                </td>
                            <td class="style1" align="left">
                                <%# DataBinder.Eval(Container.DataItem, "feedContent")%></td>
                                <td align="left" class="style6" style="width:20%">
                                <%# DataBinder.Eval(Container.DataItem, "cusUserName")%>
                                </td>
                                <td align="left" class="style7">
                                <%# DataBinder.Eval(Container.DataItem, "cusEmail")%>
                                </td>
                                <td align="right" style="width:20%">
                                <input id="Button1"  type="button" value="Reply"  onclick="clickhere('<%# DataBinder.Eval(Container.DataItem, "feedID")%>','<%# DataBinder.Eval(Container.DataItem, "cusEmail")%>')"  />
                                <input id="Button4" type="button" value="Delete" />
                                <input id="KhoaAcc" type="button" value="Lock Account"
                                </td>        
                        </tr>
                        
                     
                     </ItemTemplate>
                   </asp:Repeater>
                   </table>--%>
                   <asp:GridView CellPadding="3" Width="100%" CellSpacing="2" ID="gvFeedBack" 
                        runat="server" RowStyle-CssClass="record" AutoGenerateColumns="False" 
                        AllowPaging="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" 
                        BorderWidth="1px" >
        <RowStyle CssClass="record" BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
          <Columns>
              <asp:BoundField DataField="feedID" HeaderText="ID" />
              <asp:BoundField DataField="feedContent" HeaderText="Feed Content" />
              <asp:BoundField DataField="cusUserName" HeaderText="Sender" />
              <asp:BoundField DataField="cusEmail" HeaderText="Email" />
              <asp:TemplateField>
                  <ItemTemplate>
                    <asp:Button runat="server" ID="btDelete" Text="Delete" OnCommand= "Delete" CommandArgument= '<%# DataBinder.Eval(Container.DataItem, "feedID")%>' />
                  
                    <input id="Button1" class="Button1"  type="button" value="Reply"  onclick="clickhere('<%# DataBinder.Eval(Container.DataItem, "feedID")%>','<%# DataBinder.Eval(Container.DataItem, "cusEmail")%>')"  />
                  
                    <asp:Button runat="server" ID="btLock" Text="Lock Account" OnCommand= "Lock" CommandArgument= '<%# DataBinder.Eval(Container.DataItem, "cusUserName")%>' />
                  </ItemTemplate>
              </asp:TemplateField>
          </Columns>
                       <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                       <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                       <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                       <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
                    </asp:Panel>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    </td>
                <td class="style5" align="center">
                    <span style="color:Red;" id="checkReturn"></span>
                    <asp:Label ID="lbReturn" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                <td class="style5">
                    </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    <asp:Panel ID="Panel1" runat="server" GroupingText="Trả Lời Phản Hồi">
                        <table style="width:100%;" >
                            <tr>
                                <td class="style2">
                                    ID :  <samp ID="idnguoinhan" style="color:Red;font-size:larger">
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    Người nhận :
                                    <samp ID="nguoinhan" style="color:Red;font-size:larger">
                                    </samp>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style2" colspan="3">
                                    Nội dung<textarea style="width:100%" ID="TextArea1" cols="20" name="S1" rows="1"></textarea></td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <input ID="Button2" type="button" value="Gửi" />&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input ID="Button3" type="button" value="Hủy bỏ" /></td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
		    
		</div> <!-- END Content -->

	</div> 	
		<div id="footer"> 
			<p>Copyright <a rel="dofollow" target="_blank" href="http://nicetheme.net/">Nice Theme</a> 2009. All rights reserved.</p>
		</div>	
</div> <!-- END Container -->

</asp:Content>
<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Adminstrator/MasterPage.master" CodeFile="revenue.aspx.cs" Inherits="Adminstrator_revenue" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
            <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
        EnableScriptLocalization="true" ID="ScriptManager1" />
    <asp:Panel ID="Panel1" runat="server" GroupingText="All Order">
        <table style="width:100%;">
            <tr>
                <td class="style1">
                    Total Order</td>
                <td class="style2">
                    <asp:LinkButton ID="lbltatalorder" runat="server" 
                        oncommand="lbltatalorder_Command" onclick="lbltatalorder_Click">Total Order</asp:LinkButton>
                </td>
             
            </tr>
            <tr>
                <td class="style1">
                    Total Order Avalible</td>
                <td class="style2">
                    <asp:LinkButton ID="lblorderavailable" runat="server" 
                        oncommand="lblorderavailable_Command" onclick="lblorderavailable_Click">Order available</asp:LinkButton>
                </td>
            
            </tr>
            <tr>
                <td class="style1">
                    Total Order Finnish</td>
                <td class="style2">
                    <asp:LinkButton ID="lblorderfinsh" runat="server" onclick="lblorderfinsh_Click">Order finnish</asp:LinkButton>
                </td>
              
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
                    Start Date: 
                    <asp:TextBox ID="txt_s_date_order" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txt_s_date_order">
                    </ajaxToolkit:CalendarExtender>
                </td>
                <td align="center">
                    End Date: 
                    <asp:TextBox ID="txt_e_date_odrder" runat="server" Text=""                       ></asp:TextBox>
                    <ajaxToolkit:CalendarExtender
                        ID="CalendarExtender2" runat="server" TargetControlID="txt_e_date_odrder">
                    </ajaxToolkit:CalendarExtender>
                    &nbsp;<asp:Button ID="btn_filter_order" runat="server" onclick="Button1_Click" 
                        Text="Fill" />
                </td>
            </tr>
        </table>
        
        <asp:Label ID="lbl_eror_order" runat="server" ForeColor="Red"></asp:Label>
        
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
                    Start Date: 
                    <asp:TextBox ID="txt_s_date_order_available" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" 
                        TargetControlID="txt_s_date_order_available">
                    </ajaxToolkit:CalendarExtender>
                </td>
                <td align="center">
                    End Date:<asp:TextBox ID="txt_e_date_order_available" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" 
                        TargetControlID="txt_e_date_order_available">
                    </ajaxToolkit:CalendarExtender>
                    <asp:Button ID="btn_filter_order_available" runat="server" Text="Fill" 
                        onclick="btn_filter_order_available_Click" 
                        style="height: 26px; width: 31px" />
                </td>
            </tr>
        </table>
        <asp:Label ID="lbl_eror_order_available" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <asp:GridView ID="GridView_available" runat="server" Width="767px">
        </asp:GridView>
        <br />
        
    </asp:Panel>
    <br />
    <asp:Panel ID="panelorderfinish" runat="server" 
        GroupingText="Total Order Finsh" Visible="False">
        <br />
        <table style="width:100%;">
            <tr>
                <td align="center">
                    Start Date: 
                    <asp:TextBox ID="txt_s_date_finish" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender5" runat="server" 
                        TargetControlID="txt_s_date_finish">
                    </ajaxToolkit:CalendarExtender>
                </td>
                <td align="center">
                    End Date:<asp:TextBox ID="txt_e_date_finish" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender6" runat="server" 
                        TargetControlID="txt_e_date_finish">
                    </ajaxToolkit:CalendarExtender>
                    <asp:Button ID="btn_finish" runat="server" Text="Fill" onclick="btn_finish_Click" 
                        />
                </td>
            </tr>
        </table>
        <asp:Label ID="lbl_eor_finish" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <asp:GridView ID="GridView_order_finnish" runat="server" Width="767px">
        </asp:GridView>
        <br />
        
    </asp:Panel>
    <asp:Panel ID="Panel3" runat="server">
    </asp:Panel>
  
    <asp:Panel ID="Panel2" runat="server" GroupingText="Parcel Order" 
        ToolTip="Parcel Order">
        <table style="width:100%;">
            <tr>
                <td class="style3">
                    Total Parcel </td>
                <td>
                    <asp:LinkButton ID="lblparcel" runat="server" onclick="lblparcel_Click">Parcel</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    Total Parcel Available</td>
                <td>
                    <asp:LinkButton ID="lblparcelavailable" runat="server" 
                        onclick="lblparcelavailable_Click">availabl</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    Total Parcel Need confirm</td>
                <td>
                    <asp:LinkButton ID="lblparcelneedconfirm" runat="server" 
                        onclick="lblparcelneedconfirm_Click">confirm</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    Total parcel Sending</td>
                <td>
                    <asp:LinkButton ID="lblr_sending" runat="server" onclick="lblr_sending_Click">sending</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    Total parcel Delivey</td>
                <td>
                    <asp:LinkButton ID="lblparceldelivery" runat="server" 
                        onclick="lblparceldelivery_Click">delivery</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    Total parcel&nbsp; Deny </td>
                <td>
                    <asp:LinkButton ID="lblparceldenny" runat="server" 
                        onclick="lblparceldenny_Click">Deny</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    Total revence Parcel</td>
                <td>
                    <asp:LinkButton ID="lblrevence5" runat="server" onclick="lblrevence5_Click">Revence</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
            <br />
    <asp:Panel ID="panel_total_parcel" runat="server" 
        GroupingText="Total parcel" Visible="False">
        <br />
        <table style="width:100%;">
            <tr>
                <td align="center">
                    Start Date: 
                    <asp:TextBox ID="txt_s_date_parcel" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender7" runat="server" 
                        TargetControlID="txt_s_date_parcel">
                    </ajaxToolkit:CalendarExtender>
                </td>
                <td align="center">
                    End Date:<asp:TextBox ID="txt_e_date_parcel" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender8" runat="server" 
                        TargetControlID="txt_e_date_parcel">
                    </ajaxToolkit:CalendarExtender>
                    <asp:Button ID="btn_parcel" runat="server" Text="Fill" 
                        onclick="btn_parcel_Click"   />
                </td>
            </tr>
        </table>
        <asp:Label ID="lbl_eor_parcel" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <asp:GridView ID="GridView_total_parcel" runat="server" Width="767px">
        </asp:GridView>
        <br />
        
    </asp:Panel>
            <br />
            <br />
            <asp:Panel ID="panel_total_pảcel_available" runat="server" 
                GroupingText="Total parcel Available" Visible="False">
                <br />
                <table style="width:100%;">
                    <tr>
                        <td align="center">
                            Start Date:
                            <asp:TextBox ID="txt_s_date_parcel_available" runat="server"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender9" runat="server" 
                                TargetControlID="txt_s_date_parcel_available">
                            </ajaxToolkit:CalendarExtender>
                        </td>
                        <td align="center">
                            End Date:<asp:TextBox ID="txt_e_date_available" runat="server"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender10" runat="server" 
                                TargetControlID="txt_e_date_available">
                            </ajaxToolkit:CalendarExtender>
                            <asp:Button ID="btn_parcel_available" runat="server" 
                                Text="Fill" onclick="btn_parcel_available_Click" />
                        </td>
                    </tr>
                </table>
                <asp:Label ID="lbl_eor_parcel_available" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <asp:GridView ID="GridView_total_parcel_available" runat="server" Width="767px">
                </asp:GridView>
                <br />
            </asp:Panel>
            <br />
            <asp:Panel ID="panel_total_parcel_confirm" runat="server" 
                GroupingText="Total parcel Confirm" Visible="False">
                <br />
                <table style="width:100%;">
                    <tr>
                        <td align="center">
                            Start Date:
                            <asp:TextBox ID="txt_s_date_parcel_confirm" runat="server"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender11" runat="server" 
                                TargetControlID="txt_s_date_parcel_confirm">
                            </ajaxToolkit:CalendarExtender>
                        </td>
                        <td align="center">
                            End Date:<asp:TextBox ID="txt_e_date_confirm" runat="server"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender12" runat="server" 
                                TargetControlID="txt_e_date_confirm">
                            </ajaxToolkit:CalendarExtender>
                            <asp:Button ID="btn_parcel_confirm" runat="server" 
                                Text="Fill" onclick="btn_parcel_confirm_Click"  />
                        </td>
                    </tr>
                </table>
                <asp:Label ID="lbl_eor_parcel_confirm" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <asp:GridView ID="GridView_total_parcel_confirm" runat="server" 
                    Width="767px">
                </asp:GridView>
                <br />
            </asp:Panel>
            <br />
            <asp:Panel ID="panel_total_parcel_sending" runat="server" 
                GroupingText="Total parcel Confirm" Visible="False">
                <br />
                <table style="width:100%;">
                    <tr>
                        <td align="center">
                            Start Date:
                            <asp:TextBox ID="txt_s_date_parcel_sending" runat="server"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender13" runat="server" 
                                TargetControlID="txt_s_date_parcel_sending">
                            </ajaxToolkit:CalendarExtender>
                        </td>
                        <td align="center">
                            End Date:<asp:TextBox ID="txt_e_date_sending" runat="server"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender14" runat="server" 
                                TargetControlID="txt_e_date_sending">
                            </ajaxToolkit:CalendarExtender>
                            <asp:Button ID="btn_parcel_sending" runat="server" 
                                Text="Fill" onclick="btn_parcel_sending_Click" />
                        </td>
                    </tr>
                </table>
                <asp:Label ID="lbl_eor_parcel_sending" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <asp:GridView ID="GridView_total_parcel_sending" runat="server" Width="767px">
                </asp:GridView>
                <br />
            </asp:Panel>
            <br />
            <asp:Panel ID="panel_total_parcel_delivery" runat="server" 
                GroupingText="Total parcel Delivery" Visible="False">
                <br />
                <table style="width:100%;">
                    <tr>
                        <td align="center">
                            Start Date:
                            <asp:TextBox ID="txt_s_date_parcel_delivery" runat="server"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender15" runat="server" 
                                TargetControlID="txt_s_date_parcel_delivery">
                            </ajaxToolkit:CalendarExtender>
                        </td>
                        <td align="center">
                            End Date:<asp:TextBox ID="txt_e_date_delivery" runat="server"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender16" runat="server" 
                                TargetControlID="txt_e_date_delivery">
                            </ajaxToolkit:CalendarExtender>
                            <asp:Button ID="btn_parcel_delivery" runat="server" 
                                Text="Fill" onclick="btn_parcel_delivery_Click"  />
                        </td>
                    </tr>
                </table>
                <asp:Label ID="lbl_eor_parcel_delivery" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <asp:GridView ID="GridView_delvery" runat="server" 
                    Width="767px">
                </asp:GridView>
                <br />
            </asp:Panel>
            <br />
            <asp:Panel ID="panel_total_parcel_denny" runat="server" 
                GroupingText="Total parcel Deny" Visible="False">
                <br />
                <table style="width:100%;">
                    <tr>
                        <td align="center">
                            Start Date:
                            <asp:TextBox ID="txt_s_date_parcel_deny" runat="server"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender17" runat="server" 
                                TargetControlID="txt_s_date_parcel_deny">
                            </ajaxToolkit:CalendarExtender>
                        </td>
                        <td align="center">
                            End Date:<asp:TextBox ID="txt_e_date_deny" runat="server"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender18" runat="server" 
                                TargetControlID="txt_e_date_deny">
                            </ajaxToolkit:CalendarExtender>
                            <asp:Button ID="btn_parcel_deny" runat="server" 
                                 Text="Fill" onclick="btn_parcel_deny_Click" />
                        </td>
                    </tr>
                </table>
                <asp:Label ID="lbl_eor_parcel_deny" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <asp:GridView ID="GridView_deny" runat="server" Width="767px">
                </asp:GridView>
                <br />
            </asp:Panel>
            <br />
            <br />
    <br />
    <asp:Panel ID="Panel4" runat="server" GroupingText="Magazine Order">
        <table style="width:100%;">
            <tr>
                <td>
                    Total Revence Magazine</td>                
            </tr>
            
        </table>
    </asp:Panel>

</asp:Content>
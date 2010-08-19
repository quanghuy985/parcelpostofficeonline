<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Adminstrator/MasterPage.master" CodeFile="Addnews.aspx.cs" Inherits="Addnews" %>

<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

    
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table align="center" style="width:100%;color:Blue">
            <tr>
                <td align="center" colspan="2">
                    Add News</td>
            </tr>
            <tr>
                <td align="center" class="style1" style="color: #FF00FF">
                    Title</td>
                <td class="style4">
                    <asp:TextBox ID="txtTittle" runat="server" Width="367px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtTittle" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="center" class="style1" style="color: #FF00FF">
                    Brief</td>
                <td class="style4">
                    <asp:TextBox ID="txtBrief" runat="server" Width="362px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtBrief" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="center" class="style2" style="color: #FF00FF">
                    Content</td>
                <td class="style3">
                    <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" BasePath="~/fckeditor/" 
                      Width="200px" Height="200px">
                    </FCKeditorV2:FCKeditor>
                </td>
            </tr>
            <tr>
                <td align="center" class="style1" style="color: #FF00FF">
                    Image</td>
                <td class="style4">
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="245px" 
                        ForeColor="#FF3399" />
                </td>
            </tr>
            <tr>
                <td align="center" class="style1" style="color: #FF00FF">
                    Status</td>
                <td class="style4">
                    <asp:CheckBox ID="ctbStatus" runat="server" Text="status" />
                </td>
            </tr>
            <tr>
                <td align="center" class="style1" colspan="2">
                    <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                        Text="Submit" ForeColor="Fuchsia" />
                </td>
            </tr>
        </table>
</asp:Content>
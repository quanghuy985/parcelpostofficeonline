<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Adminstrator/MasterPage.master" CodeFile="Addmagazine.aspx.cs" Inherits="Addmagazine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <table style="width: 51%;" align="center" >
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
                    <asp:TextBox ID="txtMagaDescrip" runat="server" Height="91px" TextMode="MultiLine" 
                        Width="207px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtMagaDescrip" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    MagaZine Imgae</td>
                <td>
                     <asp:FileUpload ID="FileUpload1" runat="server" /></td>
            </tr>
            <tr>
                <td class="style4" align="center" colspan="2">
                    <asp:Button ID="btnSumit" runat="server" onclick="btnSumit_Click" 
                        Text="Submit" style="height: 26px" />
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
</asp:Content>
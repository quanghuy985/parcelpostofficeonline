<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MagazineDetail.aspx.cs" Inherits="MagazineDetail" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <table style="width: 26%; height: 293px;">
        <tr align="center">
            <td align="center" colspan="3">
               <asp:Image ID="Image2" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <h3>
                    <asp:Label ID="lblname" runat="server" Text="name"></asp:Label>
                             </h3>
            </td>
        </tr>
        <tr>
        <td>
         <h2>   <asp:Label ID="lbldecription" runat="server" Text="decription"></asp:Label></h2>
        </td>
        </tr>
        <tr>
            <td>
                <asp:LinkButton ID="LinkButton1" runat="server" 
                   
                    OnCommand="addCart" Text="&#272;&#7863;t mua" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblId" runat="server" Text="id"></asp:Label>
            </td>
        </tr>
    </table>


</asp:Content>


﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Login.aspx.cs" Inherits="eProjectSem3_eProjectSem3_Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
        <table style="width: 40%; height: 185px;">
            <tr>
                <td align="center" colspan="3">
                    <asp:Label ID="lbIntro" runat="server" Font-Bold="True" Font-Size="X-Large" 
                        Text="Login"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center">
                    &nbsp;</td>
                <td align="center" colspan="2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="right" colspan="2">
                    <asp:Label ID="lbUserName" runat="server" Text="User Name:"></asp:Label>
                </td>
                <td align="center" style="width: 268435616px">
                    <asp:TextBox ID="txtUserName" runat="server" Width="200px">User Name</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" colspan="2">
                    <asp:Label ID="lbPassword" runat="server" Text="Password:"></asp:Label>
                </td>
                <td align="center" style="width: 268435616px">
                    <asp:TextBox ID="txtPassword" runat="server" style="margin-left: 4px" 
                        Width="200px" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center">
                    &nbsp;</td>
                <td align="center" colspan="2">
                   
                    <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                        Text="Submit" Width="60px" />

                    &nbsp;<asp:Button ID="btnReset" runat="server" Text="Reset" Width="60px" 
                        onclick="btnReset_Click" />

                    &nbsp;<asp:Button ID="btnCreateAccount" runat="server" 
                        onclick="btnCreateAccount_Click" Text="Create Account" Width="64px" />
                    <br />
                    <asp:LinkButton ID="lbtnforgetPassword" runat="server" 
                        onclick="lbtnforgetPassword_Click">Forget Password!!!</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <asp:Label ID="lbError" runat="server" Font-Bold="True" ForeColor="Red" 
                        Text="..."></asp:Label>
                </td>
            </tr>
        </table>
    
 </asp:Content>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Adminstrator_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fi" lang="fi">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Black Admin v2</title>
		<style type="text/css">/*<![CDATA[*/
			@import "css/login.css";
		/*]]>*/
            .style2
            {
                width: 244px;
            }
            .style3
            {
                width: 328px;
            }
            .style4
            {
                width: 262px;
            }
        </style>
	</head>
<body>

	<div id="container">
		<h1>Admin Control Panel</h1>
		<div id="box">
			<form runat="server" >
			
            
			<table style="width:100%;">
                <tr>
                    <td class="style4" align="right">
                        Username :</td>
                    <td class="style2">
                        <asp:TextBox ID="txtUserName" runat="server" Width="238px"></asp:TextBox>
                    </td>
                    <td class="style3">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ErrorMessage="Wrong username !" ControlToValidate="txtUserName" ></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4" align="right">
                        Password :</td>
                    <td class="style2">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="238px"></asp:TextBox>
                    </td>
                    <td class="style3">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ErrorMessage="Wrong password !" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        &nbsp;</td>
                    <td class="style2">
                        <asp:Button ID="Button1" runat="server" Text="Login" Width="91px" 
                            onclick="Button1_Click" />
                    </td>
                    <td class="style3">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style4">
                        &nbsp;</td>
                    <td class="style2">
                        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td class="style3">
                        &nbsp;</td>
                </tr>
            </table>
			
            
			</form>
		</div>
 
	</div>
</body>
</html>
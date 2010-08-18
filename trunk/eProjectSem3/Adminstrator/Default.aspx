<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Adminstrator_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fi" lang="fi">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Black Admin v2</title>
		<style type="text/css">/*<![CDATA[*/
			@import "css/login.css";
		/*]]>*/</style>
	</head>
<body>

	<div id="container">
		<h1>Admin Control Panel</h1>
		<div id="box">
			<form>
			<p class="main">
				<label>Username: </label>
				<input name="username" value="username" /> 
				<label>Password: </label>
				<input type="password" name="password" value="asdf1234">	
			</p>
			<p class="space">
				<span><input type="checkbox" />Remember me</span>
				<input type="submit" value="Login" class="login" />
			</p>
			</form>
		</div>
 
	</div>
</body>
</html>
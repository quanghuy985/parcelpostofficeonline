﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Adminstrator_Home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
	<title>Black Admin v2 - Template Admin - Nice Theme</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<style type="text/css" media="all">
		@import url(css/style.css);
		img {behavior:url('js/iepngfix.htc') !important;}
	</style>	
	<script src="js/jquery.js" type="text/javascript"></script>
	<script src="js/jquery_ui.js" type="text/javascript"></script>
	<script src="js/wysiwyg.js" type="text/javascript"></script>
	<script src="js/functions.js" type="text/javascript"></script>
	
</script>
	<script>
	    $(document).ready(function() {


	    $("#content").load("FeedBackManage.aspx");
	            return false;
	      

	    });
      </script>
      <script>
          var refreshId = setInterval(function() {
          $('#content').fadeOut("slow").load('FeedBackManage.aspx').fadeIn("slow");
          }, 20000);
</script>
</head>
<body>
<div id="container"> <!-- Container -->
	<div id="header"> <!-- Header -->
		<div id="title">
			Control Panel <span>Adminstrator &amp; Employee</span>
		</div>
		<div class="logged">
			<p>Good morning, <a href="#" title="">Administrator</a>!</p>
			<p><a href="#">My Account</a> | <a href="http://nicetheme.net" target="_blank">Sign Out</a></p>
			<p>&nbsp;</p>
		</div>
	</div>	
	<div id="sidebar"> <!-- Sidebar -->
		<div class="sidebox">
			<span class="stitle">Navigation</span>
		<div id="navigation"> <!-- Navigation begins here -->
			<div class="sidenav"><!-- Sidenav -->
				<div class="navhead_blank"><span><a href="#" title="">H</a><a href="#">ome</a></span></div>
				<div class="navhead"><span>Articles</span></div>
					<div class="subnav">
						<ul class="submenu">
							<li><a href="#" title="">Write a new Article</a></li>
							<li><a href="#" title="">Manage Articles</a></li>
							<li><a href="#" title="">Manage Comments</a></li>
							<li><a href="#" title="">Manage Categories</a></li>
						</ul>
					</div>
				<div class="navhead"><span>Events Calendar</span></div>
					<div class="subnav">
						<ul class="submenu">
							<li><a href="#" title="">Submenu Item 1</a></li>
							<li><a href="#" title="">Submenu Item 2</a></li>
							<li><a href="#" title="">Submenu Item 3</a></li>
						</ul>
					</div>
				<div class="navhead"><span>Pages</span></div>
					<div class="subnav">
						<ul class="submenu">
							<li><a href="#" title="">Submenu Item 1</a></li>
							<li><a href="#" title="">Submenu Item 2</a></li>
							<li><a href="#" title="">Submenu Item 3</a></li>
							<li><a href="#" title="">Submenu Item 4</a></li>
						</ul>
					</div>
					<div class="navhead"><span>Image Gallery</span></div>
					<div class="subnav">
						<ul class="submenu">
							<li><a href="#" title="">Submenu Item 1</a></li>
							<li><a href="#" title="">Submenu Item 2</a></li>
							<li><a href="#" title="">Submenu Item 3</a></li>
						</ul>
					</div>
				<div class="navhead"><span>Settings</span></div>
					<div class="subnav">
						<ul class="submenu">
							<li><a href="#" title="">Submenu Item 1</a></li>
							<li><a href="#" title="">Submenu Item 2</a></li>
							<li><a href="#" title="">Submenu Item 3</a></li>
						</ul>
					</div>
			</div>
		</div> <!-- END Navigation -->
		</div>
	</div> <!-- END Sidebar -->
	<div id="main"> <!-- Main, right side content -->
		<div id="content"> <!-- Content begins here -->
            <!-- END Table -->
				<!-- /Form -->

			<!-- The paginator -->
			<!-- Paginator end -->
		</div> <!-- END Content -->

	</div> 	
		<div id="footer"> 
			<p>Copyright <a rel="dofollow" target="_blank" href="http://nicetheme.net/">Nice Theme</a> 2009. All rights reserved.</p>
		</div>	
</div> <!-- END Container -->
</body>
</html>
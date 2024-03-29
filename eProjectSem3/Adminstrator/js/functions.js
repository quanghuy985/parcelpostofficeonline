// JQUERY CONFIGURATION FILE FOR BLACKADMINV2 

$(document).ready(function() {

 //NAVIGATION MENU
  $('div.sidenav:eq(0)> div.subnav').hide();
  $('div.sidenav:eq(0)> div.navhead').click(function() {
	$(this).parent().find("div.subnav").slideUp('normal');
	$(this).parent().find("div.navhead").removeClass("selected");
	$(this).next().slideToggle('slow');
	$(this).toggleClass("selected");
  });




 //CLOSE NOTIFICATIONS BUTTON
	$(".close").click(
		function () {
			$(this).parent().fadeTo(400, 0, function () { // Links with the class "close" will close parent
				$(this).slideUp(400);
			});
			return false;
		}
	);
	

 //Initialize WYSIWYG editor

	$("#wysiwyg").wysiwyg();


 // Check all the checkboxes when the head one is selected:
		
	$('.checkall').click(
		function(){
			$(this).parent().parent().parent().parent().find("input[type='checkbox']").attr('checked', $(this).is(':checked'));   
		}
	);


});
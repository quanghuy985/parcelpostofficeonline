/* Buy Info fade and zoom in */
function buyInfoFade() {
	if (jQuery('#footer_buy') && jQuery('#buy_button_info')) {
		jQuery('#buy_button_info').css('opacity', 0); //hide info box
		
		//mouse in function
		jQuery('#footer_buy').unbind('mouseover').unbind('mouseout').mouseover(function(e){ 
			jQuery('#buy_button_info').animate({ 'opacity': 1, 'right': 43 }, 500); 
		}).mouseout(function(e){ 
			jQuery('#buy_button_info').animate({ 'opacity': 0, 'right': 48 }, 300); 
		});	
	}
}

function menuHover() {
	jQuery('#nav-container li a').each(function(i, item){
		if(!jQuery(item).hasClass('currentAncestor') && jQuery(item).attr('id') != "current" && jQuery(item).parents('ul').length < 2)
		{
			jQuery(item)
			.css('opacity', '0')
			.mouseover(function(){
				jQuery(this).addClass('currentAncestor').animate({"opacity": 1}, 300);
			})
			.mouseout(function(){
				jQuery(item).animate({"opacity": 0}, 300, function(){
					jQuery(this).removeClass('currentAncestor');
				});
			})
			.mousedown(function(){
				jQuery(this).stop().css({'opacity': 1}).removeClass('currentAncestor');
			});
		}
	});
}

function lsNewsletter() {
	if(jQuery('#signup_email').length < 1) return;
	var value = jQuery('#signup_email').attr('value');
	
	jQuery('#signup_email').unbind('focus')
	.focus(function(){
		if($(this).attr('value') == value) $(this).attr('value', '');
	})
	.blur(function(){
		if($(this).attr('value') == "") $(this).attr('value', value);
	});
}

//jQuery is no longer included on all pages so we need to ensure there won't be any JS errors.
try {
	
	var $ = jQuery.noConflict();
			
	$(document).ready(function(){
		buyInfoFade();
		lsNewsletter();
		try { rw.init({"tclass": "rw-lightbox"}); }catch(e){}
	});

} catch(e){}

// Define our lightbox object.
rw.lightbox = {};

// Our initialisation method to set up the Lightbox and append the clicks.
rw.lightbox.init = function(obj) 
{
	// Set the default plugin settings
	lightbox = obj;
	
	lightbox.shadow = true;
	lightbox.overlay = false;
	lightbox.tclass = jQuery("."+lightbox.tclass);

	globals.type = "lightbox";
	rw.lightbox.addClick();
	rw.lightbox.buildLightbox();
}

rw.lightbox.addClick = function(tclass) 
{
	// Gets each element with the class *.gallery-thumb*
	jQuery(lightbox.tclass).each(function(i) 
	{
		if(jQuery(this).find('a').length > 0)
		{ 
			var link = jQuery(this).find('a');
		}
		else
		{
			var link = jQuery(this);
		}
				
		// Creates the onclick event for the thumbs.
		link.unbind('click').click(function(e)
		{
			globals.img = i;
			if(globals.click != true)
			{
				// Gets position of thumbnail from window as an object.
				var position = jQuery(this).offset({ border: true, padding: true });
				
				// Checks to see if the *shift* key is held down.
				if(e.shiftKey == true)
				{
					var shift = true; 
				} 
				else
				{
					var shift = false; 
				}
				
				var pos = Array(position.left, position.top, shift);
				// Checks if *cmd* key is held down, retains native OSX action of new tab.
				if(e.metaKey != true)
				{
					rw.lightbox.launch('', pos);
					return false;
				}
				else
				{
					return true;
				}
			}
		})
		.attr('gallery', i);
	});
}

rw.lightbox.buildLightbox = function()
{
	// build the various elements of the lightbox from a string of HTML
	var gallery = rw.getLength();
	
	var counter = '<span id="lb-counter"> | Image <span class="img-current">1</span> of <span id="img-total">'+gallery+'</span></span>';
	// ! Realmac Software Site only. (No close)
	var lightbox_html = '<div id="overlay"></div><div id="lb-outer"><div id="lb-image-container"></div></div><div id="lb-navigation"><p id="lb-options"></p><p><a href="#" id="lb-start">Start Slideshow</a><a href="#" id="lb-stop">Stop Slideshow</a> | <a href="#" id="lb-gallery">Launch Gallery</a></p><p><a href="#" id="previous">Previous</a>'+counter+' | <a href="#" id="next">Next</a></p></div>';
				
	// Add lightbox to the body.
	jQuery('body').append(jQuery(lightbox_html));
	
	//
	// SET-UP ACTIONS
	//
	
	jQuery('#overlay').css({'opacity': 0, 'height': jQuery(document).height()}).click(function(e){ rw.lightbox.close(e); });
	jQuery('#lb-close').click(function(e){ rw.lightbox.close(e); return false; });
	// adds events to previous and load buttons.
	jQuery('#next').click(function(){ rw.lightbox.launch('++'); return false; });
	jQuery('#previous').click(function(){ rw.lightbox.launch('--'); return false; });	
	jQuery('#lb-start').click(function(){ rw.lightbox.slideshow.start(); return false; });
	jQuery('#lb-stop').click(function(){ rw.lightbox.slideshow.stop(); return false; }).hide();
	jQuery('#lb-gallery').click(function()
	{ 	
		
			jQuery('<div id="carousel">').load('../rw_common/plugins/gallery/gallery-frame.html', function(){
				//jQuery.getScript('../rw_common/plugins/gallery/js/rw.slideshow.js', function(){
					// TODO: Add dynamic loading of scripts.
					var obj = this;
					rw.lightbox.close("", obj);
					jQuery("body").wrapInner("<div id='body'></div>");
					setTimeout(function(){
						jQuery('#overlay').animate({'opacity': 1}, 800, function(){
							jQuery('body').css('overflow', 'hidden');
							jQuery('html').css('overflow', 'hidden');
							
							jQuery(obj).appendTo('body').animate({'opacity': 1}, 800, function(){
								jQuery('#body').hide();
								if(globals.type != "carousel" && rw.slideshow) rw.slideshow.init();
								jQuery('#overlay').css({'display': 'none', 'opacity': 0});
							});
						});
					}, 800);
				//});
			}); 
		return false;
	});
		
	jQuery(window).scroll(function() { 
		var y = (jQuery('#lb-image-container').height() / 2) - jQuery(document).scrollTop();
		var navigation_y = (jQuery('#lb-navigation').height()) - jQuery(document).scrollTop() + 20;
		jQuery('#lb-navigation').css({marginTop: -navigation_y});
		jQuery('#lb-image-container').css({marginTop: -y});
	});
	
	//
	// OPTIONS
	//
	
	var navigation = false;
	var slideshow = true;
	var fullscreen = true;
	var counter = true;
	var arrows = true;
		
	if(lightbox.overlay == false) jQuery('#overlay').remove();
	if(arrows == false || gallery <= 1) jQuery('#next').remove(); jQuery('#previous').remove();
	if(counter == false) { jQuery('#lb-counter').remove(); }
	if(fullscreen == false || !rw.slideshow) { jQuery('#lb-gallery').remove(); }
	if(slideshow == false || gallery <= 1) { jQuery('#lb-start').remove(); }
	if(navigation == false) jQuery('#lb-navigation').remove();
}

rw.lightbox.launch = function(nav, thumb_position)
{
	// Apply loading DIV
	var loading_y = (jQuery('#lb-loading').height() / 2) - jQuery(document).scrollTop();
	jQuery('#lb-loading').css({marginTop: -loading_y, display: 'block'}).animate({opacity: 0.8}, 100);
	
	//
	//	UPDATE NAVIGATION
	//
	
	var x = globals.img;
	var end = rw.getLength();
	var gallery = globals.gallery[globals.album];
	
	switch(nav) 
	{
		case '++':
			// Checks to see if its the last item, if so resets to ensure continuous loop (3).
			if(x == (end - 1)) {
				var x =  -1; //(3)
			}
			var image = gallery[x+1];
			// Corrects array number for "x of y" counter.
			x = x + 2;
			break;
		case '--':
			if(x == 0) { x = end; }
			var image = gallery[x-1];
			break;
		default:
			var image = gallery[x];
			x = x + 1;
			break;
	}
	
	globals.img = x - 1;
	// Sets x in "x of y" counter if present.
	if(jQuery('.img-current')) jQuery('.img-current').text(x);
	
	//
	//	PREPARE & LOAD IMAGE
	//
	// Checks to see if array contains Flickr data.
	if(image.flickr && !image.fullsize.url) {
		globals.flickr.position = thumb_position;
		rw.getFlickrItem(image.flickr.id);
		return false;
	}
	
	// Prepare title and description
	var title = jQuery('<h3>'+image.title+'</h3>')
	// ! Realmac Site Only
	jQuery('<a href="#" id="lb-close">Close Window</a>')
		.click(function(e){ rw.lightbox.close(e); return false; })
		.appendTo(title);
	
	if(image.description)
	{
		jQuery(title).click(function() {
			jQuery('#lb-image-container p').toggle();
		});
		var desc = jQuery('<p>'+image.description+'</p>');
	}		
	// Position lightbox vertically center.
	
	var navigation_y = (jQuery('#lb-navigation').height()) - jQuery(document).scrollTop() + 20;
	jQuery('#lb-navigation').css({marginTop: -navigation_y});
	
	jQuery('#lb-image-container').animate({opacity: 0}, 500);
	
	
	// RegEx to check the XML url contains is a flickr one.
	var ext = /[.jpg]|[.png]|[.gif]/gi;
	// Test url to see if it's a movie.
	if(ext.test(image.fullsize.url) == true) 
	{
		// Creates new Image object
		var img = new Image();
		jQuery(img)
		.load(function(){
			var obj = this;
			

			// Add action event to the image if links to a movie
			jQuery(obj).click(function(e) 
			{
				if(image.type != 'image') 
				{
					rw.quicktime(image, jQuery(this));
				}
				else
				{
					rw.lightbox.close(e);
					return false;
				}
			});

			
			if(jQuery('#lb-image-container').css('display') != 'block') {
			// if lightbox is not on show...	make it appear with a ZOOOM!
							
				//
				// ! FANCY ZOOM
				//
				
				var start_height = 0;
				var start_width = 0;
				
				if(jQuery(lightbox.tclass).find('img').length > 0) {
				
					start_height = jQuery(lightbox.tclass).find('img').height();
					start_width = jQuery(lightbox.tclass).find('img').width();
					
				} else {
					
					start_height = jQuery(lightbox.tclass).height();
					start_width = jQuery(lightbox.tclass).width();
				
				}
										
				// clone our image object.
				var zoom = jQuery(obj).clone();
				
				// Append our zoom image to the document and get it's dimensions.
				jQuery('body').append(zoom);
				jQuery(zoom).addClass('zoom');
	
				var image_width = jQuery('.zoom').width();
				var image_height = jQuery('.zoom').height();
				
				// calculate the final position of the image.
				var end_margin = (image_height / 2) - jQuery(document).scrollTop();
				var y_percent = thumb_position[1] / jQuery(window).height() * 100;
				var x_percent = thumb_position[0] / jQuery(document).width() * 100;
				
				var opacity = 1;
				
				// if shift key was held down define speed settings.
				var speed = (thumb_position[2] == true) ? 2000 : 300;
				
				jQuery('.zoom').css({ 
				
					top: y_percent+"%", 
					left: x_percent+"%", 
					width: start_width, 
					height: start_height, 
					opacity: 0.3
					
				});
				
				// launch zoom and overlay
				
				jQuery('.zoom').animate({
					
					width: image_width, 
					height: image_height, 
					left: '50%', 
					top: '50%', 
					opacity: opacity, 
					"marginLeft": -image_width/2, 
					"marginTop": -end_margin
					
				}, speed);
										
				//
				// LIGHTBOX
				//
				
				// Delay the lightbox until just before zoom is complete
				setTimeout(function() {
	
					// Append and fade in out container
					jQuery('#lb-image-container').prepend(obj).prepend(title).append(desc);
					jQuery('#lb-image-container p').hide();
									
					jQuery('#lb-loading').animate({opacity: 0}, 500, function(){
						// Load the navigation
						jQuery('#lb-navigation').css({display: 'block'}).animate({opacity: 1}, 300);
					});
					
					jQuery('#lb-image-container').css({ display: 'block'}).animate({opacity: 1}, speed/2, function(){
						jQuery('.zoom').remove();
					});
					
					// ! Realmac Software Site only.
					jQuery('#lb-image-container h3').css('marginLeft', -(jQuery('#lb-image-container h3').width()/2));
										
					if(lightbox.overlay == true) jQuery('#overlay').css('display', 'block').animate({opacity: 0.8}, speed);
					if(lightbox.shadow == true) { 
						var shadow = rw.lightbox.shadow(image_width, image_height);
						jQuery(shadow).appendTo('#lb-image-container').unbind('mousedown').mousedown(function(e){rw.lightbox.close(e); return false; });
					}
					
					// Get current dimensions (outer width fixes a bug with video images.)
					var x = jQuery('#lb-image-container img').outerWidth() / 2;
					var y = (jQuery('#lb-image-container').height() / 2) - jQuery(document).scrollTop();

					// Center the content
					jQuery('#lb-image-container').css({marginTop: -y, marginLeft: -x, width: jQuery('#lb-image-container img').width()});
					
					// reset our hold on clicking.
					if(globals.click == true) globals.click = false;
					
				}, (speed));
				
			} else {
			
				// if lightbox is already open... wait for fadeout effects to finish.
				setTimeout(function(){
				
					// remove loading...
					jQuery('#lb-loading').animate({opacity: 0}, 800).css('display', 'none');
					
					// remove old content
					jQuery('#lb-image-container img').remove();
					if(jQuery('#lb-image-container div')) {
						jQuery('#overlay').animate({opacity: 0.5}, 800);
						jQuery('#lb-image-container div').remove();
						jQuery('#lb-image-container h3').remove();
					}
					jQuery('#lb-image-container p').remove();
					
					// Add new content
					jQuery('#lb-image-container').prepend(obj).prepend(title).append(desc);
					jQuery('#lb-image-container p').hide();
					jQuery('#lb-image-container').animate({opacity: 1}, 800);
					
					if(lightbox.shadow == true) { 
						var shadow = rw.lightbox.shadow(jQuery(obj).width(), jQuery(obj).height());
						jQuery(shadow).appendTo('#lb-image-container').unbind('click').click(function(){rw.lightbox.close();});
					}
					
					// Center the content
					var x = jQuery('#lb-image-container img').outerWidth() / 2;
					var y = (jQuery('#lb-image-container').height() / 2) - jQuery(document).scrollTop();
					jQuery('#lb-image-container').css({marginTop: -y, marginLeft: -x});
					
					// reset our hold on clicking.
					if(globals.click == true) globals.click = false;
				}, 500);
			}
		})
		.attr({
			src: image.fullsize.url,
			alt: image.title,
			width: image.fullsize.width,
			height: image.fullsize.height
		});
	}
	else
	{
		jQuery('#overlay').css('display', 'block').animate({opacity: 0.5}, 800);
		
		// remove old content
		jQuery('#lb-image-container img').remove();
		if(jQuery('#lb-image-container div')) {
			jQuery('#overlay').animate({opacity: 0.5}, 800);
			jQuery('#lb-image-container div').remove();
			jQuery('#lb-image-container h3').remove();
		}
		jQuery('#lb-image-container p').remove();
		
		var img = new Image();
		jQuery(img).attr({
			src: image.fullsize.url,
			alt: image.title,
			width: image.fullsize.width,
			height: image.fullsize.height
		});
			
		// Add new content
		jQuery('#lb-image-container').prepend(img).prepend(title).append(desc);
		jQuery('#lb-image-container p').hide();
		jQuery('#lb-image-container').animate({opacity: 1}, 800);
		
		jQuery('#lb-navigation').css({display: 'block'}).animate({opacity: 1}, 1600);
		jQuery('#lb-loading').animate({opacity: 0}, 500);		
		jQuery('#lb-image-container').css({ display: 'block'}).animate({opacity: 1}, 400);
		
		// reset our hold on clicking.
		if(globals.click == true) globals.click = false;
		rw.quicktime(image, jQuery('#lb-image-container img'));
		
		// Center the content
		var x = jQuery('#lb-image-container img').outerWidth() / 2;
		var y = (jQuery('#lb-image-container').height() / 2) - jQuery(document).scrollTop();
		jQuery('#lb-image-container').css({marginTop: -y, marginLeft: -x});
	}
}

rw.lightbox.close = function(e, overlay)
{
	globals.click == true;
	// Check to see if shift is held down
	if(e)
	{
	if(e.shiftKey == true)
	{
		var shift = true; 
	} 
	else
	{
		var shift = false; 
	}
	}
	//Hide the overlay if there is one
	if(!overlay) jQuery('#overlay').animate({opacity: 0}, 300);
	
	// Hide the navigation
	if(jQuery('#lb-navigation').length > 0) jQuery('#lb-navigation').animate({opacity: 0}, 300);
	
	jQuery('#lb-image-container table').remove();
	jQuery('#lb-image-container').animate({opacity: 0}, 300, function(){
		if(!overlay)
		{
			jQuery('#overlay').css('display', 'none');
		}
		jQuery('#lb-navigation').css('display', 'none');
		jQuery('#lb-image-container').css('display', 'none');
				
	
		jQuery('#lb-image-container h3').remove();
		jQuery('#lb-image-container p').remove();
		jQuery('#lb-image-container img').remove();
		jQuery('#lb-image-container div').remove();
		rw.lightbox.slideshow.stop();	
	});
	
	// Zoom back if there is a thumb.
	if(jQuery('[gallery = '+globals.img+']').length > 0)
	{
		// clone our image object.
		jQuery('#lb-image-container img').show()
		var zoom = jQuery('#lb-image-container img').clone();
		jQuery('#lb-image-container img').remove()
		// Append our zoom image to the document and get it's dimensions.
		jQuery('body').append(zoom);
		jQuery(zoom).addClass('zoom').appendTo('body');
	
		// Get the link to the current image.
		var anchor = jQuery('[gallery = '+globals.img+']');
		var thumb_width = anchor.width() + rw.stripPX(anchor.css('paddingLeft')) + rw.stripPX(anchor.css('paddingRight'));
		var thumb_height = anchor.height() + rw.stripPX(anchor.css('paddingTop')) + rw.stripPX(anchor.css('paddingBottom'));
		
		// Find the offset from the corner of the screen.
		var pos = jQuery('[gallery = '+globals.img+']').offset();
		
		// calculate the final position of the image.
		var start_margin = (jQuery('.zoom').height() / 2) - jQuery(document).scrollTop();
		var end_margin = (thumb_height / 2) - jQuery(document).scrollTop();
		
		// Calculate the margin we need to apply to the image to get the thumb into the same position.
		var end_y_percent = pos.top / jQuery(window).height() * 100;
		var end_x_percent = pos.left / jQuery(document).width() * 100;
				
		// if shift key was held down define speed settings.
		if(shift == true) { var speed = 2000; var opacity = 1 } else { var speed = 300; var opacity = 0.8 }
		
		jQuery('.zoom').css({ top: "50%", left: "50%", marginLeft: -(jQuery('.zoom').width() / 2), marginTop: -start_margin, opacity: 1, backgroundColor: "transparent" });
		
		// launch zoom and overlay
		
		jQuery('.zoom').animate({width: thumb_width, height: thumb_height, left: end_x_percent+"%", top: end_y_percent+"%", opacity: 0, "marginLeft": 0, "marginTop": 0 }, speed, function(){
			globals.click = false;
			jQuery(this).remove();
		});
	}
}

rw.lightbox.slideshow = {
	start: function()
	{
		if(!globals.slideshow)
		{
			rw.lightbox.launch('++');
			globals.slideshow = setInterval(function()
			{
				rw.lightbox.launch('++');
			}, 5000);
			jQuery('#lb-start').hide();
			jQuery('#lb-stop').show();
		}
	},
	stop: function()
	{
		clearInterval(globals.slideshow);
		globals.slideshow = '';
		jQuery('#lb-stop').hide();
		jQuery('#lb-start').show();
	}
}

rw.lightbox.shadow = function(width, height)
{
	var width = width - 26;
	var height = height - 25;
	var table = '<table id="lb-shadow" cellpadding="0" cellspacing="0"><tr> \
					<td id="lb-shadow-top-left"><img src="' + globals.imgpath + 'blank.gif" width="26" height="25" alt="" /></td> \
					<td id="lb-shadow-top"><img src="' + globals.imgpath + 'blank.gif" width="'+width+'" height="25" alt="" /></td> \
					<td id="lb-shadow-top-right"><img src="' + globals.imgpath + 'blank.gif" width="26" height="25" alt="" /></td> \
				</tr> \
				<tr> \
					<td id="lb-shadow-left"><img src="' + globals.imgpath + 'blank.gif" width="26" height="'+height+'" alt="" /></td> \
					<td></td> \
					<td id="lb-shadow-right"><img src="' + globals.imgpath + 'blank.gif" width="26" height="'+height+'" alt="" /></td> \
				</tr> \
				<tr> \
					<td id="lb-shadow-bottom-left"><img src="' + globals.imgpath + 'blank.gif" width="26" height="26" alt="" /></td> \
					<td id="lb-shadow-bottom"><img src="' + globals.imgpath + 'blank.gif" width="'+width+'" height="26" alt="" /></td> \
					<td id="lb-shadow-bottom-right"><img src="' + globals.imgpath + 'blank.gif" width="26" height="26" alt="" /></td> \
				</tr> \
			</table>'
	return table;
}
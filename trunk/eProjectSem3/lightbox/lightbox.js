$(document).ready(function(){
	
	// Launch the plugin with the class to be attached to the links.
	// and the zoom time.
	$.lightbox('.rw-lightbox', 400);

});

jQuery.lightbox = function(link_class, time) {

	var link_class = link_class || 'lightbox';
	var time = time || 400;
	
	jQuery.lightbox.link_class = link_class;
	jQuery.lightbox.open = false;
	jQuery.lightbox.items = setupLinks();
	setupLightbox();
	setupThumbnails();
	
	$(window).scroll(scrollLightbox);
	
	function launch(eventObj) {
		
		$lightbox.show();
		var item = getCurrentItem();
		var $image = $lightbox.find('img:first');
		
		$lightbox.originalWidth = $image.width();
		$lightbox.originalHeight = $image.height();
		
		$image.css({
			'width' : $anchor.width(),
			'height' : $anchor.height()
		});
		
		$lightbox.css({
			'margin-top' : 0,
			'margin-left' : 0,
			'top' : (item.top / jQuery(window).height() * 100) + '%',
			'left' : (item.left / jQuery(document).width() * 100) + '%',
			'opacity' : 0.1,
			'width': $anchor.width(),
			'height': $anchor.height()
		});
		
		$("#close").attr('item', $anchor.attr('item')).fadeIn(time);
		$image.animate({
			'width' : $lightbox.originalWidth,
			'height' : $lightbox.originalHeight
		}, time);
			
		$lightbox.animate({
			'marginTop' : - ($lightbox.originalHeight / 2) + $(window).scrollTop(),
			'marginLeft' : - $lightbox.originalWidth / 2,
			'top' : '50%',
			'left' : '50%',
			'opacity' : 1,
			'width' : $lightbox.originalWidth,
			'height' : $lightbox.originalHeight
		}, time, function(){

			setLightboxStatus(true);
			fadeInContent();
			
		});
		
		return false;
		
	}
	
	function close(eventObj) {
	
		fadeOutContent(function(){	
			
			setLightboxStatus(false);
			
			id = $('#close').attr('item');
	
			$anchor = $('a' + jQuery.lightbox.link_class + '[item=' + id + ']');
			
			var item = jQuery.lightbox.items[$anchor.attr('item')];
			
			var $image = $lightbox.find('img:first');
			
			$lightbox.originalWidth = $image.width();
			$lightbox.originalHeight = $image.height();
			
			$image.animate({
				'width' : 0,
				'height' : 0
			}, time, function(){
			
				$(this).css({
					'width' : $lightbox.originalWidth,
					'height' : $lightbox.originalHeight	
				});
				
			});
				
			$lightbox.animate({
				'marginTop' : 0,
				'marginLeft' : 0,
				'top' : (item.top / jQuery(window).height() * 100) + '%',
				'left' : (item.left / jQuery(window).width() * 100) + '%',
				'opacity' : 0,
				'width': 0,
				'height': 0
			}, time, function(){

				$(this).hide();
				
			});
			
			$("#close").fadeIn(800);
			
		});
		
		return false;	
		
	}	
	
	function next(item_id) {
		var current_item = getCurrentItem();
		
		if(current_item.id != item_id) {
			$anchor = $('a' + jQuery.lightbox.link_class + '[item=' + item_id + ']');
			fadeOutContent(function(){
				fadeInContent(time/2);
			}, time/2);
		}
	}
	
	function fadeInContent(fade_time) {
		
		var fade_time = fade_time || 100;
		var $content = $('<div id="lightbox-content">');		

		var item = getCurrentItem();
		
		if(item.filetype == 'movie') {
			$img = $('<img>').attr({
			
				'width': item.movie.width,
				'height': item.movie.height,
				'src': item.movie.src
				
			}).unbind('click').click(function(){
				$('#lightbox-content').quicktime(item.movie);
				$(this).hide();
			});
			
		} else {
			$img = $('<img>').attr('src', item.image.src);
			item.description.append($thumbnails);
		}

		$content.appendTo('#lightbox').append($img).append(item.description).css({"opacity": 0}).animate({
			"opacity": 1
		}, fade_time, function(){
			if($('#lightbox-content').css('filter')) $('#lightbox-content').css('filter', '');
		});
		setCurrentThumbnail(item.id);
		addLinksToThumbnails();
	}
	
	function fadeOutContent(callback, fade_time) {
		var fade_time = fade_time || 50;
		var $content = $('#lightbox-content');
		
		$('#movie').remove()
		$('#lightbox').find('img:first').show(function(){
			
			$content.fadeOut(fade_time, function(){
			
				$(this).remove();
				callback();
				
			});	
		});
	}
	
	function setupLightbox() {
		
		$('<div id="lightbox"></div><div id="lightbox-loading">Loading...</div>').appendTo('body').hide();
		
		$.lightbox.loading = $('#lightbox-loading');
		$lightbox = $('#lightbox');
		
		var loop = setInterval(function(){
		
			if($lightbox.css('background-image') != 'none') {

				$('<img id="lightbox-background">').appendTo($lightbox).attr('src', $lightbox.css('background-image').replace(/^url\("?|"?\)$/g, ''));
			
				$('<a id="close" href="#close" title="Close Lightbox">Close Lightbox</a>').unbind('click').click(close).hide().appendTo($lightbox);

				$lightbox.css('background-image', 'none');
				
				clearInterval(loop);
			
			}
				 		
		}, 10);	
	}
	
	function setupLinks() {
		
		var items = Array();
		
		$(link_class).each(function(i){
		
			var $link = $(this);
			
			var link_array = this.href.split('.');
			var type = fileType(link_array[link_array.length - 1]);
			var position = $link.offset({ border: true, padding: true });
			var $description = $('<div>').append(getDescription($(this)));
			
			items[i] = {
				'id': i,
				'filetype': type,
				'description': $description,
				'top': position.top, 
				'left': position.left			
			}
						 
			switch(type) {
			
				case 'movie':
					
					var rel = $link.attr('rel').replace(/\[|\]|\s/gi, "").split(',');
					var src = rel[2];
					items[i].movie = {
						'url': $link.attr('href'),
						'title': $link.attr('title'),
						'width': parseInt(rel[0]),
						'height': parseInt(rel[1]),
						'src': rel[2]	
					}
					break;
					
				case 'image':
				
					items[i].image = {
						'src': $link.attr('href'),
						'title': $link.attr('title')
					}
					var src = $link.attr('href');
			}
					
			$(this).attr('item', i).unbind('click').click(function(){
			
				$anchor = $(this);
				
				var item = getCurrentItem();
				
				if(jQuery.lightbox.open == false) {
				
					var img = new Image();
					
					$.lightbox.loading.show();
					
					jQuery(img).load(function(){
					
						$.lightbox.loading.hide();
						launch();
						
					}).attr('src', src);
					
				} else {
					next($anchor.attr('item'));
				}
				
				return false;
				
			});
		});
		
		return items;
	
	}
	
	function setupThumbnails() {
	
		var li_array = Array();
		
		$.each(jQuery.lightbox.items, function(i){
		
			if(this.filetype == 'image') {
			
				var $li = $('<li><a href="#" thumb-id="' + i + '" title="View ' + this.image.title + '"><img src="' + this.image.src + '" /></a></li>');
				li_array.push($li);
			}
		});
		
		$thumbnails = $('<ul id="lightbox-thumbnails">');
		
		$.each(li_array, function(){
			$thumbnails.append(this)
		});
	}
	
	function addLinksToThumbnails() {
		$('#lightbox-thumbnails a').each(function(){
			$(this).unbind('click').click(function(){
				next($(this).attr('thumb-id'));
				return false;
			});
		});
	}
	
	function setCurrentThumbnail(id) {
		$('.current-thumb').removeClass('current-thumb');
		$('[thumb-id=' + id + ']').addClass('current-thumb');
	}
	
	function setLightboxStatus(status) {
		if(status == true) {
			jQuery.lightbox.open = true;
			if($.browser.msie && parseInt($.browser.version) == 7) {
				$('#lightbox').css('filter', '')
				$('#lightbox-background').attr('src', $('#lightbox-background').attr('src').replace(/_ie.([\S])/, '.$1'));
			}
		} else {
			jQuery.lightbox.open = false;
			if($.browser.msie && parseInt($.browser.version) == 7) {
				var src = $('#lightbox-background').attr('src').replace(/\.png/, '_ie.png');
				$('#lightbox-background').attr('src', src);
			}
		}
	}
		
	function getCurrentItem() {
		return jQuery.lightbox.items[$anchor.attr('item')];
	}
	
	function getDescription($anchor) {
		code = $anchor.parents('li:first').html().replace( /(>)?([\n\s]+)(<)/ig, '$1$3');
		return $(code);
	}

	function scrollLightbox() {
		$lightbox.css('marginTop', - ($lightbox.height() / 2) + $(window).scrollTop());
	}
	
	// Returns the filetype of the string.
	function fileType( ext ) {
				
		if(/^(?:mov|mp4|swf)$/.test(ext)) return 'movie';		
		if(/^(?:png|jp[e]?g|gif|tif[f]?)$/.test(ext)) return 'image';
		return false;
		
	}
}

jQuery.fn.quicktime = function(item) {
	
	return this.each(function(){
		
		$container = $(this);
		
		// build the Quicktime Object
		var qo = new QTObject(item.url, item.title, item.width, item.height);
			
		qo.addParam("showlogo", "false");
		qo.addParam("autoplay", "true");
		
		//qo.addParam("href", item.url);
		qo.addParam("target", "myself");
		qo.addParam("controller", "true");
		qo.addParam("bgcolor", "#ffffff");
		qo.addParam("wmode", "transparent");
		var error = "<p>Quicktime does not appear to be installed please visit Apple's homepage to download it.</p>";
		
		// TODO Add movie error checking.
		var qt = '<div id="movie">'+error+'</div>';
		jQuery(qt).prependTo($container).css({"width": item.width, "height": item.height});
		qo.write('movie');
		
	});
}

/*
 * QTObject Embed
 * http://blog.deconcept.com/2005/01/26/web-standards-compliant-javascript-quicktime-detect-and-embed/
 *
 * by Geoff Stearns (geoff@deconcept.com, http://www.deconcept.com/)
 *
 * v1.0.2 - 02-16-2005
 */

QTObject=function(mov,id,w,h){this.mov=mov;this.id=id;this.width=w;this.height=h;this.redirect="";this.sq=document.location.search.split("?")[1]||"";this.altTxt="This content requires the QuickTime Plugin. <a href='../../../www.apple.com/quicktime/download/default.htm'>Download QuickTime Player</a>.";this.bypassTxt="<p>Already have QuickTime Player? <a href='@detectqt=false&"+this.sq+"'>Click here.</a></p>";this.params=new Object();this.doDetect=getQueryParamValue('detectqt');}
QTObject.prototype.addParam=function(name,value){this.params[name]=value;}
QTObject.prototype.getParams=function(){return this.params;}
QTObject.prototype.getParam=function(name){return this.params[name];}
QTObject.prototype.getParamTags=function(){var paramTags="";for(var param in this.getParams()){paramTags+='<param name="'+param+'" value="'+this.getParam(param)+'" />';}
if(paramTags==""){paramTags=null;}
return paramTags;}
QTObject.prototype.getHTML=function(){var qtHTML="";if(navigator.plugins&&navigator.plugins.length){qtHTML+='<embed type="video/quicktime" src="'+this.mov+'" width="'+this.width+'" height="'+this.height+'" id="'+this.id+'"';for(var param in this.getParams()){qtHTML+=' '+param+'="'+this.getParam(param)+'"';}
qtHTML+='></embed>';}
else{qtHTML+='<object classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" width="'+this.width+'" height="'+this.height+'" id="'+this.id+'">';this.addParam("src",this.mov);if(this.getParamTags()!=null){qtHTML+=this.getParamTags();}
qtHTML+='</object>';}
return qtHTML;}
QTObject.prototype.getVariablePairs=function(){var variablePairs=new Array();for(var name in this.getVariables()){variablePairs.push(name+"="+escape(this.getVariable(name)));}
if(variablePairs.length>0){return variablePairs.join("&");}
else{return null;}}
QTObject.prototype.write=function(elementId){if(isQTInstalled()||this.doDetect=='false'){if(elementId){document.getElementById(elementId).innerHTML=this.getHTML();}else{document.write(this.getHTML());}}else{}}
function isQTInstalled(){var qtInstalled=false;qtObj=false;if(navigator.plugins&&navigator.plugins.length){for(var i=0;i<navigator.plugins.length;i++){var plugin=navigator.plugins[i];if(plugin.name.indexOf("QuickTime")>-1){qtInstalled=true;}}}else{execScript('on error resume next: qtObj = IsObject(CreateObject("QuickTimeCheckObject.QuickTimeCheck.1"))','VBScript');qtInstalled=qtObj;}
return qtInstalled;}
function getQueryParamValue(param){var q=document.location.search;var detectIndex=q.indexOf(param);var endIndex=(q.indexOf("&",detectIndex)!=-1)?q.indexOf("&",detectIndex):q.length;if(q.length>1&&detectIndex!=-1){return q.substring(q.indexOf("=",detectIndex)+1,endIndex);}else{return"";}}
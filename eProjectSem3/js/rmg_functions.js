<!--

function preloadArray(dir,arrayName) {
	if (document.images) {
		for (var i=0; i<eval(arrayName+'.length'); i++) {
			CURR_ARRAY_ITEM = eval(arrayName+'[i]');
 			eval(CURR_ARRAY_ITEM+'_on = new Image()');
			eval(CURR_ARRAY_ITEM+'_on.src = dir+"'+CURR_ARRAY_ITEM+'_on.gif";');
			eval(CURR_ARRAY_ITEM+'_off = new Image()');
			eval(CURR_ARRAY_ITEM+'_off.src = dir+"'+CURR_ARRAY_ITEM+'_off.gif";');
		}
	}
}

var imageList = new Array('whoarewe','howwereperforming','howwereregulated','ourcorporate','inthenews','welshwhoarewe','welshhowwereperforming','welshhowwereregulated','welshourcorporate','welshinthenews');

preloadArray('../../images/rmg/nav/default.htm','imageList');

function rollIn(imgName)
	{
		if (document.images)
		{
			document.images[imgName].src=eval(imgName + "_on.src");
		}
	}

function rollOut(imgName)
	{
		if (document.images)
		{
			document.images[imgName].src=eval(imgName + "_off.src");
		}
	}
//-->

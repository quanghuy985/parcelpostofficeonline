function Is ()	{   

	// convert all characters to lowercase to simplify testing
	
	var agt = navigator.userAgent.toLowerCase();
	
	// *** BROWSER VERSION ***
	// Note: On IE5, these return 4, so use is.ie5up to detect IE5.
	this.major = parseInt(navigator.appVersion);
	this.minor = parseFloat(navigator.appVersion);
	
	this.nav     = ((agt.indexOf('mozilla')!=-1) && (agt.indexOf('spoofer')==-1) && 
					(agt.indexOf('compatible') == -1) && (agt.indexOf('opera')==-1) && 
					(agt.indexOf('webtv')==-1));
	this.nav4    = (this.nav && (this.major == 4));
	this.navonly = (this.nav && ((agt.indexOf(";nav") != -1) || (agt.indexOf("; nav") != -1)) );
	this.nav5    = (this.nav && (this.major == 5));
	this.nav5up  = (this.nav && (this.major >= 5));

	this.ie    = (agt.indexOf("msie") != -1);
	this.ie3   = (this.ie && (this.major < 4));
	this.ie4   = (this.ie && (this.major == 4) && (agt.indexOf("msie 5.0")==-1) );
	this.ie4up = (this.ie  && (this.major >= 4));
	this.ie5   = (this.ie && (this.major == 4) && (agt.indexOf("msie 5.0")!=-1) );
	this.ie5up = (this.ie  && !this.ie3 && !this.ie4);
	
} // end Is

var is;
var isIE3Mac = false;

if ((navigator.appVersion.indexOf("Mac")!=-1) && 
	(navigator.userAgent.indexOf("MSIE")!=-1) && 
	(parseInt(navigator.appVersion)==3))
	isIE3Mac = true;
else
	is = new Is();

function popup (url, nameW, w, h) {
	
	if (navigator.appVersion.indexOf('4') != -1) {	
		x4 = ((screen.width - 764) / 2) + (764 - 254);
		y4 = screen.height/2 - (h/2);
		window.open(url, nameW, 'height='+h+',width='+w+',scrollbars=0,resizable=0,menubar=0,toolbar=0,status=0,location=0,directories=0,left=' + x4 + ',top=' + y4 + '');		
	} 
	else {	
		window.open(url, nameW, 'height='+h+',width='+w+',scrollbars=0,resizable=0,menubar=0,toolbar=0,status=0,location=0,directories=0,left=150,top=200');	
	} // end if
	
}

function rollOn (imgSrc1,layerIDa) {

	if	(is.ie4up||is.nav5up) {	
		document.images[imgSrc1].src = "../../images/medialookup/ctf/rm/channel/" + imgSrc1 + "_h.gif";
	}
	else if	(is.nav4) {	
		document.layers[layerIDa].document.images[imgSrc1].src = "../../images/medialookup/ctf/rm/channel/" + imgSrc1 + "_h.gif";		
	} // end if
	
} // end rollOn

function rollOff (imgSrc1,layerIDa) {

	if	(is.ie4up||is.nav5up) {	
		document.images[imgSrc1].src = "../../images/medialookup/ctf/rm/channel/" + imgSrc1 + ".gif";		
	}
	else if	(is.nav4) {		
		document.layers[layerIDa].document.images[imgSrc1].src = "../../images/medialookup/ctf/rm/channel/" + imgSrc1 + ".gif";		
	} // end if
	
} // end rollOff

if (document.images) {
	product  = new Image ();
	custserv = new Image ();
	product.src  = "../../images/royalmail/product-az-over.gif"
	custserv.src = "../../images/royalmail/customer_service_on.gif"
}
else {
	product  = "";
	custserv = "";
} // end if
/* Product architecture */
function RollOver(imgSrc1) {
	imageName = document.getElementById(imgSrc1).src;
	if((imageName.indexOf("-on")) == -1) {
		document.getElementById(imgSrc1).src = "../../images/royalmail/paarch/" + imgSrc1 + "-h.gif";
	}
}

function RollOut(imgSrc1) {
	imageName = document.getElementById(imgSrc1).src;
	if((imageName.indexOf("-on")) == -1) {
		document.getElementById(imgSrc1).src = "../../images/royalmail/paarch/" + imgSrc1 + ".gif";
	}
}

/* This custom "Search" submit handler takes care of the three most common
* search criteria:
*
* - visitor enters a valid postcode (re-direct to Postcode Finder)
* - visitor submits null or unmodified search expression (do nothing)
* - visitor search appears to be career-oriented (re-direct to careers page)
*
* The handler will intercept over 2000 requests monthly, re-directing the
* enquirer to the most appropriate content. Bypassing the search engine in
* this way will help boost its performance.
*/
function _validateSearch() {
	var str = new String(document.getElementById('searchInput').value);	

	if ( str.match(/^(\s*(?:Search)?\s*|\s*(?:Enter\s*(?:a\s*(?:search\s*(?:term?)?)?)?)\s*)$/i) )
	{
	    // Looks like "Search" literal, (null) or whitespace(s) was entered; do
	    // nothing other than encourage our enquirer to enter a proper search expression.
	    document.getElementById('searchInput').value = "Enter a search term";
	}
	else if ( str.match(/^\s*(?:(?:career|job)s?|employment|work)\s*$/i) )
	{
	    // Potential employee; redirect to Careers page...
	    self.location = "../../../www.royalmail.com/portal/rm/erecjump2@catId=500185&mediaId=16000165";
	}
	else
	{
	    // Search expression looks kosher, let it pass thru...
	    return true;
	}
	return false;
}
function _onSearchFocus(value){
	if(value == "Enter a search term") {
		document.getElementById('searchInput').value = "";
	}
}

function _validateShopSearch() {
    var str = new String(document.getElementById('shop-search').value); 

    if ( str.match(/^(\s*(?:Search)?\s*|\s*(?:Enter\s*(?:a\s*(?:search\s*(?:term?)?)?)?)\s*)$/i) )
    {
        document.getElementById('shop-search').value = "Enter a keyword";
    }
    else
    {
        return true;
    }
    return false;
}

function _onShopSearchFocus(value){
    if(value == "Enter a keyword") {
        document.getElementById('shop-search').value = "";
    }
}


   function validQuestion() {
         var str = new String(document.metafaq.nlpq.value);
         if ( str.match(/^(\s*(?:Search)?\s*|\s*(?:Please\s*(?:enter\s*(?:a\s*(?:question?)?)?)?)\s*)$/i) )      
         {
            document.metafaq.nlpq.value = "Please enter a question";
         }
         else
         {
         return true;
         }
         return false;
      }
   
      function sendme() 
      { 
       if(validQuestion()==true)     
        {
          winHandle = window.open("","mfWindow","width=400,height=680,screenX=15,screenY=20,"+
           " top=15,left=322,resizable,scrollbars=auto"); 
          winHandle.focus();
          return true;
        }
       else
       {
       return false;
       }
   }

// falonso_20080205 - Function added to change the top_segment_div page
function changeMe(num) {
	for(i = 1; i < 5; i++) {
		document.getElementById('item' + i).className = "xxx";
		document.getElementById('l-s-t-right-item' + i).className = "l-s-t-right-hide";
	}
	document.getElementById('item' + num).className = "selected";
	document.getElementById('l-s-t-right-item' + num).className = "l-s-t-right-show";
}



// Overloaded the methods to make them generic
function RollOverWithPath(imgSrc1,imagePath) {
    imageName = document.getElementById(imgSrc1).src;
    if((imageName.indexOf("-on")) == -1) {
        document.getElementById(imgSrc1).src = imagePath + imgSrc1 + "-h.gif";      
    } 
}

// Overloaded the methods to make them generic
function RollOutWithPath(imgSrc1,imagePath) {
    imageName = document.getElementById(imgSrc1).src;
    if((imageName.indexOf("-on")) == -1) {
        document.getElementById(imgSrc1).src = imagePath + imgSrc1 + ".gif";
    }
}
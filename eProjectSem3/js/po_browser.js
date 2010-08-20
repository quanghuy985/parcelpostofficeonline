function _validateSearch(form) {
	var elm;
	if(form) {
		for(var i= 0; i < form.elements.length ; i++) {
			if(form.elements[i].type == "text" ) {
				elm = form.elements[i];
				break;
			}
		}
		
		if( !elm || elm.value.match(/^(\s*(?:Search)?\s*|\s*(?:Enter\s*(?:a\s*(?:search\s*(?:term?)?)?)?)\s*)$/i) ) {
			elm.value = "Enter a search term";
			return false;
		}
	}	
	return true;
}
function showhide(obj, e) {
    if (e.type == "click" && obj.display == none || e.type == "mouseover") {
        obj.display = "block";
    } else if (e.type=="click") {
        obj.display = "none";
    }
}

function hide(event, element) {
    element.style.display='none';
}

function containsElement(a, b) {
    while (b.parentNode) {
        if ((b = b.parentNode) == a) {
            return true;
        }
    }
    return false;
}

function checkHide(event, element) {

    var isIE = typeof document.all != "undefined";

    if (isIE && !dropmenuobj.contains(event.toElement)) {
        hide(event, element);
    } else if (event.currentTarget != event.relatedTarget && !containsElement(event.currentTarget, event.relatedTarget)) {
        hide(event, element);
    }
}

function dropdownmenu(obj, e, dropmenuID, isTop) {

    var e = window.event || e;
    var isIE = typeof document.all != "undefined";
    if (window.event) {
        event.cancelBubble = true;
    } else if (e.stopPropagation) {
        e.stopPropagation();
    }

    if (typeof dropmenuobj != "undefined") {
        hide(e, dropmenuobj);
    }

    dropmenuobj = document.getElementById(dropmenuID);
    if (isIE) {
        dropmenuobj.onclick = function() {checkHide(event, dropmenuobj);}
        dropmenuobj.onmouseout = function(){checkHide(event, dropmenuobj);}
    } else {
        dropmenuobj.onclick = function(event) {checkHide(event, dropmenuobj);}
        dropmenuobj.onmouseout = function(event){checkHide(event, dropmenuobj);}
    }

    showhide(dropmenuobj.style, e);

    return true;
}

function init() {
    var counter = 1;
    var keepIterating = true;
    var dropdownMap = new Object();
    do {
        var currentTab = document.getElementById("tab" + counter);

        if (currentTab != null) {
            // associate the dropbox with the current tab, so we can use it in the function
            // later
            dropdownMap[currentTab.id] = 'dropbox' + counter;

            currentTab.onmouseover = function(event) {
                dropdownmenu(this, event, dropdownMap[this.id]);
            }
        } else {
            // no more tabs, no need to keep iterating
            keepIterating = false;
        }
        counter = counter + 1;
    } while (keepIterating);
}

window.onload = init;

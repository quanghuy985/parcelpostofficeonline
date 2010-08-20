  function setVarUrl(where,when,guaranteed) {
    var a = where;
    var b = when;
    var c = guaranteed;
    filepath = "../../gear/content/html/content/ctf/misc/popup.html@a=" + a + "&b=" + b + "&c=" + c;
    popup(filepath,"Products",254,420);
  }

  function popup(url, nameW, w, h) {
    if (navigator.appVersion.indexOf('4') != -1) {
    // Vars for centering the new window on Version 4 Browsers
    x4 = ((screen.width - 764) / 2) + (764 - 254);
    y4 = screen.height/2 - (h/2);
    window.open(url, nameW, 'height='+h+',width='+w+',scrollbars=0,resizable=0,menubar=0,toolbar=0,status=0,location=0,directories=0,left=' + x4 + ',top=' + y4 + '');
    } else {
    window.open(url, nameW, 'height='+h+',width='+w+',scrollbars=0,resizable=0,menubar=0,toolbar=0,status=0,location=0,directories=0,left=150,top=200');
    }
  }

  var _POPUP_FEATURES = 'scrollbars=1,resizable=1,location=0,statusbar=0,menubar=0,width=430,height=430';
  function raw_popup(url, target, features) {
      if (isUndefined(features)) features = _POPUP_FEATURES;
      if (isUndefined(target  )) target   = '_blank';
      var theWindow = window.open(url, target, features);
      theWindow.focus();
      return theWindow;
  }
  function link_popup(src, features) {
      return raw_popup(src.getAttribute('href'), src.getAttribute('target') || '_blank', features);
  }
  function isUndefined(v) {
      var undef;
      return v===undef;
  }  
/*
#------------------------------------------------------------------------
# Black & White - October2010 (for Joomla 1.5)
#
# Copyright (C) 2007-2010 Gavick.com. All Rights Reserved.
# License: Copyrighted Commercial Software
# Website: http://www.gavick.com
# Support: support@gavick.com   
#------------------------------------------------------------------------ 
# Based on T3 Framework
#------------------------------------------------------------------------
# Copyright (C) 2004-2009 J.O.O.M Solutions Co., Ltd. All Rights Reserved.
# @license - GNU/GPL, http://www.gnu.org/copyleft/gpl.html
# Author: J.O.O.M Solutions Co., Ltd
# Websites: http://www.joomlart.com - http://www.joomlancers.com
#------------------------------------------------------------------------
*/

//Call noconflict if detect jquery
//Apply jquery.noConflict if jquery is enabled
if ($defined(window.jQuery) && $type(jQuery.noConflict)=='function') {
	jQuery.noConflict();
	jQuery.noConflict();
}

function switchFontSize (ckname,val){
	var bd = $E('body');
	switch (val) {
		case 'inc':
			if (CurrentFontSize+1 < 7) {
				bd.removeClass('fs'+CurrentFontSize);
				CurrentFontSize++;
				bd.addClass('fs'+CurrentFontSize);
			}		
		break;
		case 'dec':
			if (CurrentFontSize-1 > 0) {
				bd.removeClass('fs'+CurrentFontSize);
				CurrentFontSize--;
				bd.addClass('fs'+CurrentFontSize);
			}		
		break;
		default:
			bd.removeClass('fs'+CurrentFontSize);
			CurrentFontSize = val;
			bd.addClass('fs'+CurrentFontSize);		
	}
	Cookie.set(ckname, CurrentFontSize,{duration:365});
}

function switchTool (ckname, val) {
	createCookie(ckname, val, 365);
	window.location.reload();
}

function createCookie(name,value,days) {
  if (days) {
    var date = new Date();
    date.setTime(date.getTime()+(days*24*60*60*1000));
    var expires = "; expires="+date.toGMTString();
  }else expires = "";
  document.cookie = name+"="+value+expires+"; path=/";
}

//addEvent - attach a function to an event
function gkAddEvent(obj, evType, fn){ 
 if (obj.addEventListener){ 
   obj.addEventListener(evType, fn, false); 
   return true; 
 } else if (obj.attachEvent){ 
   var r = obj.attachEvent("on"+evType, fn); 
   return r; 
 } else { 
   return false; 
 } 
}

window.addEvent('load', function() {
    new SmoothScroll(); 

	if($('btn_login')) {
		var login_fx = new Fx.Style($('gk-popup'), 'height',{duration:800, transition: Fx.Transitions.Quint.easeOut}).set(0);
		var popup = $('system-message');
		var msg_died = true;
		var forms_visible = false;
       		
		if(popup) {
            msg_died = false;
            (function(){
                login_fx.start(0, popup.getSize().size.y);
                (function(){ 
                    if(!forms_visible) login_fx.start(0);
                    new Fx.Style($('system-message'), 'opacity', {onComplete: function(){ $('system-message').remove(); }}).start(0);
                    msg_died = true;
                }).delay(6000);
            }).delay(1000);
		}
		
		$('btn_login').addEvent('click', function(e){
			new Event(e).stop();
			if(msg_died) (!forms_visible) ? login_fx.start($$('#gk-popup .main')[0].getSize().size.y) : login_fx.start(0);
			else (!forms_visible) ? login_fx.start($$('#gk-popup .main')[0].getSize().size.y) : login_fx.start(0);
			forms_visible = !forms_visible;
		});  
	}
	if($('btn_login2')) {
		var login_fx = new Fx.Style($('gk-popup'), 'height',{duration:800, transition: Fx.Transitions.Quint.easeOut}).set(0);
		var popup = $('system-message');
		var msg_died = true;
		var forms_visible = false;
       		
		if(popup) {
            msg_died = false;
            (function(){
                login_fx.start(0, popup.getSize().size.y);
                (function(){ 
                    if(!forms_visible) login_fx.start(0);
                    new Fx.Style($('system-message'), 'opacity', {onComplete: function(){ $('system-message').remove(); }}).start(0);
                    msg_died = true;
                }).delay(6000);
            }).delay(1000);
		}
		
		$('btn_login2').addEvent('click', function(e){
			new Event(e).stop();
			if(msg_died) (!forms_visible) ? login_fx.start($$('#gk-popup .main')[0].getSize().size.y) : login_fx.start(0);
			else (!forms_visible) ? login_fx.start($$('#gk-popup .main')[0].getSize().size.y) : login_fx.start(0);
			forms_visible = !forms_visible;
		});  
	}
    // EQUAL COLUMNS
	var equalizers = [$('gk-botsl1'), $('gk-botsl2')];
	equalizers.each(function(wrap,i){
		if(wrap) {
			var max = 0;
			var cols = wrap.getElementsBySelector('.column');
			var col_amount = 0;
			
			cols.each(function(col,j){
				col_amount++;
				if(col.getSize().size.y > max) max = col.getSize().size.y; 
			});
			
			if(col_amount > 1){
				cols.each(function(col){
					col.getElement('div').setStyle("min-height", max + "px");
				});
			}
		}
	});
});

function CufonCheck(){ return (typeof(Cufon) == "undefined")?  false: true; }

// JCaptionCheck
function JCaptionCheck(){ return (typeof(JCaption) == "undefined")?  false: true; }

if(!JCaptionCheck()) {
	var JCaption = new Class({
		initialize: function(selector)
		{
			this.selector = selector;
			var images = $$(selector);
			images.each(function(image){ this.createCaption(image); }, this);
		},

		createCaption: function(element)
		{
			var caption   = document.createTextNode(element.title);
			var container = document.createElement("div");
			var text      = document.createElement("p");
			var width     = element.getAttribute("width");
			var align     = element.getAttribute("align");
			var docMode = document.documentMode;

			//Windows fix
			if (!align)
				align = element.getStyle("float");  // Rest of the world fix
			if (!align) // IE DOM Fix
				align = element.style.styleFloat;

			text.appendChild(caption);
			text.className = this.selector.replace('.', '_');

			if (align=="none") {
				if (element.title != "") {
					element.parentNode.replaceChild(text, element);
					text.parentNode.insertBefore(element, text);
				}
			} else {
				element.parentNode.insertBefore(container, element);
				container.appendChild(element);
				if ( element.title != "" ) {
					container.appendChild(text);
				}
				container.className   = this.selector.replace('.', '_');
				container.className   = container.className + " " + align;
				container.setAttribute("style","float:"+align);

				//IE8 fix
				if (!docMode|| docMode < 8) {
					container.style.width = width + "px";
				}
			}

		}
	});

	document.caption = null;
	window.addEvent('load', function() {
		var caption = new JCaption('img.caption')
		document.caption = caption
	});
}

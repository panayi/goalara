(function(b,c){var a;b.rails=a={linkClickSelector:"a[data-confirm], a[data-method], a[data-remote]",selectChangeSelector:"select[data-remote]",formSubmitSelector:"form",formInputClickSelector:"form input[type=submit], form input[type=image], form button[type=submit], form button:not([type])",disableSelector:"input[data-disable-with], button[data-disable-with], textarea[data-disable-with]",enableSelector:"input[data-disable-with]:disabled, button[data-disable-with]:disabled, textarea[data-disable-with]:disabled",requiredInputSelector:"input[name][required]:not([disabled]),textarea[name][required]:not([disabled])",fileInputSelector:"input:file",CSRFProtection:function(e){var d=b('meta[name="csrf-token"]').attr("content");if(d){e.setRequestHeader("X-CSRF-Token",d)}},fire:function(g,d,f){var e=b.Event(d);g.trigger(e,f);return e.result!==false},confirm:function(d){return confirm(d)},ajax:function(d){return b.ajax(d)},handleRemote:function(g){var j,e,i,h=g.data("cross-domain")||null,d=g.data("type")||(b.ajaxSettings&&b.ajaxSettings.dataType);if(a.fire(g,"ajax:before")){if(g.is("form")){j=g.attr("method");e=g.attr("action");i=g.serializeArray();var f=g.data("ujs:submit-button");if(f){i.push(f);g.data("ujs:submit-button",null)}}else{if(g.is("select")){j=g.data("method");e=g.data("url");i=g.serialize();if(g.data("params")){i=i+"&"+g.data("params")}}else{j=g.data("method");e=g.attr("href");i=g.data("params")||null}}options={type:j||"GET",data:i,dataType:d,crossDomain:h,beforeSend:function(l,k){if(k.dataType===c){l.setRequestHeader("accept","*/*;q=0.5, "+k.accepts.script)}return a.fire(g,"ajax:beforeSend",[l,k])},success:function(l,k,m){g.trigger("ajax:success",[l,k,m])},complete:function(l,k){g.trigger("ajax:complete",[l,k])},error:function(m,k,l){g.trigger("ajax:error",[m,k,l])}};if(e){b.extend(options,{url:e})}a.ajax(options)}},handleMethod:function(h){var e=h.attr("href"),j=h.data("method"),f=b("meta[name=csrf-token]").attr("content"),i=b("meta[name=csrf-param]").attr("content"),g=b('<form method="post" action="'+e+'"></form>'),d='<input name="_method" value="'+j+'" type="hidden" />';if(i!==c&&f!==c){d+='<input name="'+i+'" value="'+f+'" type="hidden" />'}g.hide().append(d).appendTo("body");g.submit()},disableFormElements:function(d){d.find(a.disableSelector).each(function(){var e=b(this),f=e.is("button")?"html":"val";e.data("ujs:enable-with",e[f]());e[f](e.data("disable-with"));e.attr("disabled","disabled")})},enableFormElements:function(d){d.find(a.enableSelector).each(function(){var e=b(this),f=e.is("button")?"html":"val";if(e.data("ujs:enable-with")){e[f](e.data("ujs:enable-with"))}e.removeAttr("disabled")})},allowAction:function(d){var e=d.data("confirm"),f=false,g;if(!e){return true}if(a.fire(d,"confirm")){f=a.confirm(e);g=a.fire(d,"confirm:complete",[f])}return f&&g},blankInputs:function(i,f,h){var e=b(),g,d=f||"input,textarea";i.find(d).each(function(){g=b(this);if(h?g.val():!g.val()){e=e.add(g)}});return e.length?e:false},nonBlankInputs:function(e,d){return a.blankInputs(e,d,true)},stopEverything:function(d){b(d.target).trigger("ujs:everythingStopped");d.stopImmediatePropagation();return false},callFormSubmitBindings:function(e){var d=e.data("events"),f=true;if(d!==c&&d.submit!==c){b.each(d.submit,function(g,h){if(typeof h.handler==="function"){return f=h.handler(h.data)}})}return f}};if("ajaxPrefilter" in b){b.ajaxPrefilter(function(d,f,e){if(!d.crossDomain){a.CSRFProtection(e)}})}else{b(document).ajaxSend(function(f,g,d){if(!d.crossDomain){a.CSRFProtection(g)}})}b(a.linkClickSelector).live("click.rails",function(f){var d=b(this);if(!a.allowAction(d)){return a.stopEverything(f)}if(d.data("remote")!==c){a.handleRemote(d);return false}else{if(d.data("method")){a.handleMethod(d);return false}}});b(a.selectChangeSelector).live("change.rails",function(f){var d=b(this);if(!a.allowAction(d)){return a.stopEverything(f)}a.handleRemote(d);return false});b(a.formSubmitSelector).live("submit.rails",function(i){var g=b(this),h=g.data("remote")!==c,f=a.blankInputs(g,a.requiredInputSelector),d=a.nonBlankInputs(g,a.fileInputSelector);if(!a.allowAction(g)){return a.stopEverything(i)}if(f&&a.fire(g,"ajax:aborted:required",[f])){return a.stopEverything(i)}if(h){if(d){return a.fire(g,"ajax:aborted:file",[d])}if(!b.support.submitBubbles&&a.callFormSubmitBindings(g)===false){return a.stopEverything(i)}a.handleRemote(g);return false}else{setTimeout(function(){a.disableFormElements(g)},13)}});b(a.formInputClickSelector).live("click.rails",function(f){var e=b(this);if(!a.allowAction(e)){return a.stopEverything(f)}var d=e.attr("name"),g=d?{name:d,value:e.val()}:null;e.closest("form").data("ujs:submit-button",g)});b(a.formSubmitSelector).live("ajax:beforeSend.rails",function(d){if(this==d.target){a.disableFormElements(b(this))}});b(a.formSubmitSelector).live("ajax:complete.rails",function(d){if(this==d.target){a.enableFormElements(b(this))}})})(jQuery);$(function(){$("#signin").live("submit",function(d){$("#doomed_panel").slideUp("fast");d.preventDefault();var b=$("#email").val();var a=$("#password").val();var c={remote:true,commit:"Sign in",utf8:"✓",user:{remember_me:1,password:a,email:b}};$.post("/users/sign_in.json?"+Math.floor(Math.random()*11),c,function(e){if(e.success){$(".sign_in").toggleClass("menu-open");$("#sidebox").toggleClass("opacity");$(".login_part").html(e.user_panel);$(".commentAddForm").replaceWith(e.comment_form);growl("You have successfully loggend in!")}else{$("#doomed_panel").html("Error: This email and password combination is incorrect.");$("#doomed_panel").slideDown("medium")}});return false});$("#signout").live("click",function(a){a.preventDefault();$.ajax({type:"DELETE",url:$(this).attr("href")+".json",dataType:"json",success:function(b){if(b.status=="ok"){$(".login_part").html(b.user_panel);$(".commentAddForm").replaceWith(b.comment_form);growl("You have successfully logged out!")}}});return false});$(".sign_in").live("click",function(a){a.preventDefault();$("fieldset#signin_menu").toggle();$(".sign_in").toggleClass("menu-open");$("#sidebox").toggleClass("opacity")});$("fieldset#signin_menu").live("mouseup",function(){return false});$(document).live("mouseup",function(a){if($(a.target).parent("a.sign_in").length==0){$(".sign_in").removeClass("menu-open");$("fieldset#signin_menu").hide()}})});$(function(){$(window.applicationCache).bind("error",function(){})});function growl(a,b){b=typeof(b)!="undefined"?status:4000;$.jGrowl(a,{life:b})};
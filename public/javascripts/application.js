// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var original;
var shuffler;

$(function(){
	// copy articles to #original element
	original = $('#original');
	original.html($('#articles_list').html());
	shuffler = $('#shuffler');
	shuffler.html($('#articles_list').html());
	
    $("#signin").live('submit', function(e){
      $("#doomed_panel").slideUp("fast");
      e.preventDefault();
      var email = $('#email').val();
      var password = $('#password').val();
      var data = {remote: true, commit: "Sign in", utf8: "✓",
                  user: {remember_me: 1, password: password, email: email}};
      $.post('/users/sign_in.json?'+ Math.floor(Math.random()*11), data, function(resp) {
        if(resp.success) {
            $(".sign_in").toggleClass("menu-open");
            $("#sidebox").toggleClass("opacity");
            $(".login_part").html(resp.user_panel);
            $(".commentAddForm").replaceWith(resp.comment_form);
            growl("You have successfully loggend in!");
        } 
        else {
            $("#doomed_panel").html("Error: This email and password combination is incorrect.");
            $("#doomed_panel").slideDown("medium");
        }
      });
      return false;
    });
    
    $("#signout").live('click', function(e){
      e.preventDefault();
      $.ajax({
		  type: "DELETE",
		  url: $(this).attr("href") + ".json",
		  dataType: 'json',
		  success: function(resp){
		      
		      if(resp.status == "ok")
		      {
		          $(".login_part").html(resp.user_panel);
		          $(".commentAddForm").replaceWith(resp.comment_form);
		          growl("You have successfully logged out!");
		      }
		  }
	  });
	  return false;
    });

	$(".sign_in").live('click', function(e) {
       e.preventDefault();
       $("fieldset#signin_menu").toggle();
       $(".sign_in").toggleClass("menu-open");
       $("#sidebox").toggleClass("opacity");
    });

    $("fieldset#signin_menu").live('mouseup', function() {
       return false
    });

    $(document).live('mouseup', function(e) {
       if($(e.target).parent("a.sign_in").length==0) {
           $(".sign_in").removeClass("menu-open");
           $("fieldset#signin_menu").hide();
       }
    });

	//on mouserover article(frontpage)
	$(".browser .an_article").mouseenter(function(){
		$(this).find(".description").css('opacity', 0.8)
		$(this).find(".abstract").slideDown('medium');
	});
	$(".browser .an_article").mouseleave(function(){
		$(this).find(".description").css('opacity', 0.6);
		$(this).find(".abstract").slideUp('medium');
	});
	
	$.fn.outerHTML = function() {
	    var doc = this[0] ? this[0].ownerDocument : document;
	    return $('<div>', doc).append(this.eq(0).clone()).html();
	};

	// onclick sort
	$("#order_by a").click(function(){
		if($(this).hasClass("selected")){
			return false;
		}
		
		$("#order_by a").removeClass('selected');
		$(this).addClass('selected');
		
		
		sort_articles(sort_by_selector(this));
		return false;
	});
	
	//onclick filter by team
	$("#filter_by a").click(function(){
		if($(this).hasClass("selected")){
			return false;
		}
		
		$("#filter_by a").removeClass('selected');
		$(this).addClass('selected');
		
		current_sort = sort_by_selector($("#order_by a.selected"));
		filter_articles_by_team($(this).attr("data-value"), current_sort);
		
		return false;
	});
	
	// $('.local a').click(function(e){
	// 		var parent_ul = $(this).parents('ul');
	// 		$(parent_ul).find('a').removeClass('selected');
	// 		$(this).addClass('selected');
	// 
	// 		var dataString = '';
	// 		$('.local a.selected').each(function(){
	// 			var value = $(this).attr('data-value')
	// 			if(value != 'all'){
	// 				dataString = dataString + '&' 
	// 						 	+ $(this).parents('ul').attr('id') 
	// 						 	+ '=' + value;	
	// 			}
	// 		});
	// 
	// 		$.ajax({
	// 		  type: "GET",
	// 		  url: "/articles",
	// 		  dataType: 'html',
	// 		  data: dataString.substring(1),
	// 		  success: function(result){
	// 		    $('.browser').html(result);
	// 		  }
	// 		});
	// 		return false;
	// 	});
});


$(function() {
  $(window.applicationCache).bind("error", function() {
    // alert("There was an error when loading the cache manifest.");
  });
});

function growl(message, life){
  life = typeof(life) != 'undefined' ? status : 4000;
  $.jGrowl(message, { life: life});
}

function sort_articles(attribute_compare){
	var mylist = $('#articles_list');
	var listitems = shuffler.children('li').get();
	
	
	listitems.sort(function(a, b) {
	   var compA = parseInt($(a).attr(attribute_compare));
	   var compB = parseInt($(b).attr(attribute_compare));
	   return (compA > compB) ? -1 : (compA < compB) ? 1 : 0;
	});
	
	$.each(listitems, function(idx, itm) { shuffler.append(itm); });
	mylist.quicksand( $('#shuffler li') );
}

function filter_articles_by_team(team, sort_by){
	var mylist = $('#articles_list');
	shuffler.html("");
	var result = "";
	
	if(team != "all")
	{
		$("#original li").each(function(){ 
			var this_team = $(this).attr("data-team-id");
			if(this_team.indexOf("_") != -1){
				this_team = this_team.split("_");
				for (var i = 0; i < this_team.length; i++){
					if(this_team[i] == team){
						result = result + $(this).outerHTML();
						break;
					}
				}
			}
			else{
				if($(this).attr("data-team-id") == team){
					result = result + $(this).outerHTML();
				}
			}
		});
	}
	else
	{
		result = original.html();
	}
	shuffler.html(result);
	sort_articles(sort_by);
}

function sort_by_selector(selector){
	sort_by = $(selector).attr("data-value");
	switch(sort_by){
		case "newest":
		default:
			attribute = "data-date";
			break;
		case "popular":
			attribute = "data-date"; //TODO: add a view counter for articles to enable this sorting
			break;
		case "commented":
			attribute = "data-comment-count";
			break;
	}
	return attribute;
}
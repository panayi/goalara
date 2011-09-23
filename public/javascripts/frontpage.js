var original;
var shuffler;

var order_by;
var selected_team;

$(function(){
	shuffler = $('#shuffler');
	
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

	bindScroll();

	order_by = $("#order_by a.selected").attr("data-value");
	selected_team = $("#filter_by a.selected").attr("data-value");
	
	// onclick sort
	$("#order_by a").click(function(){
		if($(this).hasClass("selected")){
			return false;
		}
		order_by = $(this).attr("data-value");
		
		//update classes
		$("#order_by a").removeClass('selected');
		$(this).addClass('selected');
		
		//ajax get articles
		get_articles(1, "replace");
		
		return false;
	});
	
	//onclick filter by team
	$("#filter_by a").click(function(){
		if($(this).hasClass("selected")){
			return false;
		}
		
		selected_team = $(this).attr("data-value");
		
		$("#filter_by a").removeClass('selected');
		$(this).addClass('selected');
		
		
		//ajax get articles
		get_articles(1, "replace");

		return false;
	});
});



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
// 
// function filter_articles_by_team(team, sort_by){
// 	var mylist = $('#articles_list');
// 	shuffler.html("");
// 	var result = "";
// 	
// 	if(team != "all")
// 	{
// 		$("#original li").each(function(){ 
// 			var this_team = $(this).attr("data-team-id");
// 			if(this_team.indexOf("_") != -1){
// 				this_team = this_team.split("_");
// 				for (var i = 0; i < this_team.length; i++){
// 					if(this_team[i] == team){
// 						result = result + $(this).outerHTML();
// 						break;
// 					}
// 				}
// 			}
// 			else{
// 				if($(this).attr("data-team-id") == team){
// 					result = result + $(this).outerHTML();
// 				}
// 			}
// 		});
// 	}
// 	else
// 	{
// 		result = original.html();
// 	}
// 	shuffler.html(result);
// 	sort_articles(sort_by);
// }

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

function get_articles(page, mode){
	$(".loader").show();
	if(typeof page == "undefined" || page == null)
	{
		page = $("#pagination_links a[rel='next']").html();
	}
	
	$.getJSON("articles.json",
        {
            order_by: order_by,
            team_id: selected_team,
			page: page
        },
        function(json, status, data) {
			success(json, mode);	
        }
    )
	.complete(function(){$(".loading").hide();});
}

function success(json, mode){
	if(mode === "replace")
	{
		$("#shuffler").html(json.data);
		sort_articles(json.data);
		$(window).unbind();
		
	}
	else
	{
		$("#shuffler").append(json.data);
		$('#articles_list').quicksand( $('#shuffler li') );
	}
	bindScroll();
	$(".loading").hide();
	$("#pagination_links").html(json.pages);
}

function bindScroll(){
	$(window).scroll(function(){
		if  ($(window).scrollTop() < $(document).height() - $(window).height() && 
			$(window).scrollTop() > $(document).height() - $(window).height() -900){
			
			$(this).unbind();
			
			if($("#pagination_links .pagination").length >0 && 
			   $("#pagination_links span.next_page").hasClass("disabled") != true)
			{
				get_articles(null, "append");	
			}
	   }
	});
}
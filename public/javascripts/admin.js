$(function(){
	$("#set_teams .articles li").click(function(){
		remove_selected("#set_teams .articles");
		$(this).addClass("selected");
		
		remove_selected("#set_teams .teams");
		get_article_teams($(this).attr("data-article-id"));
		
	});
	
	$("#set_teams .teams li").click(function(){
		if($("#set_teams .articles li.selected").length > 0)
		{
			if($("#set_teams .teams li.selected").length == 2 && !$(this).hasClass("selected"))
			{
				//do nothing
			}
			else
			{
				$(this).toggleClass("selected");
			}
			
		}
	});
	
	
	$("#update").click(function(){
		if($("#set_teams .articles li.selected").length > 0)
		{
			var article_id = $("#set_teams .articles li.selected").attr("data-article-id");
			var team_ids = [];
			$("#set_teams .teams li.selected").each(function(){
				team_ids.push($(this).attr("data-team-id"));
			});
			set_article_teams(article_id, team_ids);
		}
	});
});


function remove_selected(parent){
	$(parent).find("li").each(function(){
		$(this).removeClass("selected");
	})
}

function get_article_teams(article_id){
	$.ajax({
	    type: "GET",
		url: '/articles/'+article_id,
		dataType: "xml",
		success: function(xml) {
			 var teams = [];
			 $(xml).find("fixnum").each(function(){
				teams.push($(this).text());
				highlight_team($(this).text());
			});
			
		}
	});
}

function set_article_teams(article_id, team_ids){
	$.ajax({
	    type: "POST",
		url: '/set_teams.json',
		data: jQuery.param({'team_ids': team_ids, 'id': article_id }),
		dataType: "json",
		success: function(json) {
			$("#set_teams .articles li[data-article-id ='"+article_id+"']").hide('slow');		
		}
	});
	
	
}

function highlight_team(team_id){
	$("#set_teams .teams li[data-team-id ='"+team_id+"']").addClass("selected");
}
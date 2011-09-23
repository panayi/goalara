var article_id = '';
var article_url = '';
var team_id = '';
var hash = window.location.hash;
var team_selector = false;
var browser_type = '';
var data = '';
var status = '';
var no_articles = 'false';
var sync_pointer = 0;
var sync_mode = false;
var sync_hashes = [];
var navigate_direction = 'right';
var remember_hash_b4_sync = '';

//get kind of browser for figuring out viewport dimensions
if (typeof window.innerWidth != 'undefined')
 {
      browser_type = 'mozilla';
 }

// IE6 in standards compliant mode (i.e. with a valid doctype as the first line in the document)

 else if (typeof document.documentElement != 'undefined'
     && typeof document.documentElement.clientWidth !=
     'undefined' && document.documentElement.clientWidth != 0)
 {
       browser_type = 'ie6';
 }

 // older versions of IE
 else
 {
       browser_type = 'older_ie';
 }

$(document).ready(function() {
    // Bind the event.
    $(window).hashchange( function(){
      // Alerts every time the hash changes!
      hash = window.location.hash;
      set_values_from_hash(hash);
      ajax_fetch_content();
    });

    $(window).hashchange();
    
    $("body").css("overflow", "hidden");
    $("#main_frame").css('opacity', '0');
    $('.loader_img').show();

	//set articles list width in topbar
    set_article_list_width();

    $(window).resize(function() {
        setWidthAndHeight();
    });

    $("#main_frame").load(function() {
        format_iframe();
    });

    // TODO: fix this to hide facebook styling
    $('span.liketext').load(function() {
        $(this).hide();
    });

    //onclick navigation buttons
    $(".navigation_buttons a").live('click',
    function() {
        hash = get_hash_from_string($(this).attr('href'));
        if($(this).attr("id") == "next_article"){
            var next = true;
        }
        else{
            var next = false;
        }
        
        if(hash.length < 1) {
            if(next){
                growl("This is the last article!");
            }
            else{
                growl("This is the first article!");
            }
            return false;
        }
        if(next){
			navigate_direction = 'right';
        }
        else
        {
			navigate_direction = 'left';
        }
        window.location.hash = hash;
    });

    //onclick team select box
    $(".team_selector").live("click",
    function() {
        $(".team_dropbox").slideToggle('fast');
        $("#main_frame").toggleClass("opacity");
    });
   
    
    //onselect team
    $(".team_dropbox a").live("click",
    function() {
        if($(this).parent("li").hasClass("selected")){
            return false;
        }
        team_id = jQuery(this).parent("li").attr("data-teamid");
        $(".team_dropbox").slideUp('fast');
        $("#main_frame").toggleClass("opacity");
        set_team();
        if (team_id !== "all") status = 'team_change';
        set_hash();
    });
    
    //onselect team in no_article page
    $(".select_new_team").live("click", function() {
       $("#no_article").html("");
       team_id = jQuery(this).attr("data-teamid");
       set_team();
       if (team_id !== "all") status = 'team_change';
       set_hash();
    });
    
    // on team filter list
	$("#team_id").change(function(){
		var selected_team = $(this).val();
		
		if(selected_team == ""){
			$("#articles_list li.an_article").each(function(){
				$(this).removeClass('hidden');
			});
		}
		else{
			$("#articles_list li.an_article").each(function(){
				$(this).addClass('hidden');
			});
			$("#articles_list li.an_article[data-team-id='"+selected_team+"']").each(function(){
				$(this).removeClass('hidden');
			});
		}
		set_article_list_width();
	});
    
    
    //listen for comment adding
    $('#add_comment')
    .live("ajax:beforeSend", function(evt, xhr, settings){
        $(this).mask("Please wait...");
        growl("Your comment is being added...");
    })
    .live('ajax:success', function(evt, data, status, xhr){
      growl("Your comment has been posted!");
      $("#conversation").animate({ scrollTop: $('#discussion').height() }, "slow");
      $('#commentList-30').append(data.data);
      $('#commentList-30 li.comment:last-child').effect("highlight", {color:"#FFDD00"}, 4000);
      $("#add_comment").unmask();
    });
    
    //listen for voting
    $('.voting')
    .live("ajax:beforeSend", function(evt, xhr, settings){
        growl("Your vote is being submitted...");
    })
    .live('ajax:success', function(evt, data, status, xhr){
        if(data.status == "already_voted")
        {
            growl("Your have already voted this comment");
        }
        else
        {
            if(parseInt(data.status) > 0){
              var score = "+" + data.status;
              $(this).closest("ul").children("li.score").removeClass("negative").addClass("positive").html(score);
            }
            else if(parseInt(data.status) < 0){
                var score = data.status;
                $(this).closest("ul").children("li.score").removeClass("positive").addClass("negative").html(score);
            }
            else{
              $(this).closest("ul").children("li.score").removeClass("positive,negative").html(data.status);  
            }
            $(this).addClass(data.vote);
        }
    });

	//onclick show/hide articles
    $(".show_hide_articles").live("click", function() {
        $("#panel").toggle('slow', function() {
		    $(".show_hide_articles").toggleClass("opened");
		});
		return false;
    });
	//also bind to click anywhere but panel
	$("#view_content").live('click', function() {
	    $("#panel").slideUp('slow', function() {
		    $(".show_hide_articles").removeClass("opened");
		});
	});
	
	

	//Onclick synchronize button
    $('#start_sync').live('click', function(){
		remember_hash_b4_sync = hash;
        sync_window();
    });
});


function format_iframe() {
    $('.loader_img').hide();
    $("#main_frame").css({ 'margin-left' : '0', 'margin-right' : '0'}).animate({opacity: '1'}, 'medium');
    setWidthAndHeight();
}

function setWidthAndHeight() {
    var dimensions = getWidthAndHeight();
    parent.document.getElementById('article_iframe').height = dimensions.height ;
    $('#conversation').height(dimensions.height - 325);
    
    if(dimensions.width < 1024)
    {    
        $('#pagetype,#floatingbar').width('1024');
    }
    else{
        $('#pagetype,#floatingbar').width('100%');
        
    }
}

function ajax_fetch_content() {
	if(sync_mode == false) growl("Loading article...");
	// alert($("#main_frame").width());
	if(navigate_direction === 'right'){
        $("#article_iframe").animate({marginLeft: - $("#article_iframe").width()}, $("#article_iframe").width(), 'easeOutExpo', 
		function(){
			$('.loader_img').show();
			
		});
    }
    else
    {
        $("#article_iframe").animate({marginLeft: $("#article_iframe").width()}, $("#article_iframe").width(), 'easeOutExpo', 
		function(){
			$('.loader_img').show();
		});
    }
	$("#commentList-30").html("");
	
    $.retrieveJSON("/navigate.json",
        {
            id: article_id,
            team_id: team_id,
            status: status
        },
        function(json, status, data) {
            if (status == "cached"){
            	success_navigate_article(json);
            	return false;
            }
			
            if (json.error){
              no_article_found(json);
              no_articles = true;
            }
            else{
              no_articles = false;
              status = '';
              success_navigate_article(json);
            }
        }
    );
    status = '';
}

function no_article_found(data){
    $('#main_frame').attr('src', "").hide();
    $("#no_article").html(data.main);
    $('.loader_img').hide();
    set_team();
}

function fadeFrame(){
    if(team_selector)
    {
        jQuery('#main_frame').fadeTo('fast', 1);
    }
    else
    {
        jQuery('#main_frame').fadeTo('fast', 0.25);
    }
    team_selector = !team_selector;
}



function set_values_from_hash(){
    var values = hash.replace('#', '').split('/');
    article_id = values[0];
    article_url = hash.replace(values[0], ""); 
    if(article_url.search("tid_") != -1)
    {
        var temp = article_url.substring(article_url.search("tid_"), article_url.length);
        team_id = temp.replace("tid_", "");
        article_url = article_url.replace(temp, "");
    }
    else
    {
        team_id = 'all';
    }
}

function get_hash_from_string(str){
    return str.split('news#')[1];
}

function set_team(){
    $(".team_dropbox li").each(function(){
        $(this).removeClass("selected");
    });
    $(".team_selector").html($("#tid_"+team_id+" a").html());
    $("#tid_"+team_id).addClass('selected');
    
}


function set_hash(){
    team_id_hash = '/tid_' + team_id;
    var values = hash.replace('#', '').split('/');
    hash = hash.replace( /\/tid_\d+/i , '');
    hash = hash.replace( /\/tid_\w+/i , '');
    hash = hash + team_id_hash;
    window.location.hash = hash;
}

function getWidthAndHeight(){
    var viewportwidth;
    var viewportheight;
    
    switch (browser_type){
        case 'mozilla':
            viewportwidth = window.innerWidth;
            viewportheight = window.innerHeight;
            break;
        case 'ie6':
            viewportwidth = document.documentElement.clientWidth;
            viewportheight = document.documentElement.clientHeight;
            break;
        case 'ie6':
            viewportwidth = document.getElementsByTagName('body')[0].clientWidth;
            viewportheight = document.getElementsByTagName('body')[0].clientHeight;
            break;     
    }
    
    return {width : viewportwidth, height: viewportheight}
}


function success_navigate_article(data) {
	
    $("#no_article").html("");
    
    // show article in iframe
    callIframe(data.iframe, data.article_id);

	//update panel accordingly
	$("li.an_article").removeClass("selected")

    // show comments list
    $("#commentList-30").html(data.comments);
    $("#comments_loading").hide();
    
    //show total comments
    $(".total_comments,.header_comments span").html(data.total_comments);

    //show navigation buttons
    $(".navigation_buttons").html(data.navigation_buttons);
    
    //set hidden input commentable_id in comments form
    $('input[name="commentable_id"]').val(article_id); 
	
	//update modal window (only in sync mode)
	if(sync_mode == true){
		$("#sync_done").html(parseInt($("#sync_done").html(),10) + 1);
	}

    set_team();
    document.title = data.article_title + ' - Goalara.com';
}

function callIframe(content, article_id) {
    $('#main_frame').html(content);
    $('#main_frame iframe').load(function() 
    {
		$('#main_frame').removeClass('hidden');
		$("li.an_article[data-article-id='"+article_id+"']").addClass("selected").find(".offline").addClass("available");
		$("#available_offline").html($(".details li.available").length).removeClass("zero");
        format_iframe();
		get_next_in_sync();
		$(this).unbind('load');
		
    });
}

function sync_window(){
	$(".get_ready").removeClass("hidden");
	$(".syncing").addClass("hidden");
	
	$("#start_sync").live("click", function(){
		var selected_team = $("#osx-modal-data option:selected").val();
		if(selected_team == 0){
			$(".get_ready label").css('color', 'red');
		    return false;
		} 
		else{
			start_sync(selected_team);
			$(".get_ready").addClass("hidden");
			$(".syncing").removeClass("hidden");
		}
    });
 
}

function start_sync(team_id){
	sync_hashes = [];
	sync_pointer = 0;
	var temp_hash = '';
	
	var sel_articles = $("#articles_list li[data-team-id='"+team_id+"'] a");
	$("#articles_total").html(sel_articles.length);
	
    sel_articles.each(function(){
		temp_hash = get_hash_from_string($(this).attr('href'));
		if("#" + temp_hash !== hash){
			sync_hashes.push(temp_hash);
		}
	});
	sync_mode = true;
	get_next_in_sync();
}

function get_next_in_sync(){
	if(sync_mode == true){
		if(typeof sync_hashes[sync_pointer] !== "undefined"){
			window.location.hash = sync_hashes[sync_pointer];
			sync_pointer++;
		}
		else
		{
			sync_mode = false;
			$("#osx-modal-data .content").html($("#sync_is_complete_content").html());
			// go to the article that the user was on, when pressed sync
			window.location.hash = remember_hash_b4_sync;
		}
	}
}

function set_article_list_width(){
	var count = $(".articles_list li.an_article").not(".hidden").length;
	var width = count * ($(".articles_list li").first().width() + 20) + 12;
	$(".articles_list").width(width);
}

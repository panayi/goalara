// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function(){
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

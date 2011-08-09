// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function(){
	$('.local a').click(function(e){
		var parent_ul = $(this).parents('ul');
		$(parent_ul).find('a').removeClass('selected');
		$(this).addClass('selected');

		var dataString = '';
		$('.local a.selected').each(function(){
			var value = $(this).attr('data-value')
			if(value != 'all'){
				dataString = dataString + '&' 
						 	+ $(this).parents('ul').attr('id') 
						 	+ '=' + value;	
			}
		});

		$.ajax({
		  type: "GET",
		  url: "/articles",
		  dataType: 'html',
		  data: dataString.substring(1),
		  success: function(result){
		    $('.browser').html(result);
		  }
		});
		return false;
	});
});
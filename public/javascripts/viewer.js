$(document).ready(function(){
  $("body").css("overflow", "hidden");
  $("#sidebox").height($(window).height());
  $(window).resize(function() {
    setHeight();
  });
});
$("#main_frame").load(function(){
  $("#main_frame").css('visibility', 'visible');
  setHeight();
  alert("sfd");
});
function setHeight() {
  parent.document.getElementById('main_frame').height = document['body'].offsetHeight;
}
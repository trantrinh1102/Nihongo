$(document).ready(function() {
  $("a").tooltip({
    title: function(){
      return $(this).attr('title');
    }
  });
  $("#flash-messages").fadeOut(3000);
})

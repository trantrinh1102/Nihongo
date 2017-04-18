function destroykanji(){
  $(".btn-delete-kanji").click(function(){
    $kanji = $(this).closest('tr');
    if(confirm('Are you sure ?'))
    {
      $.ajax({
        type: "DELETE",
        url: '/admin/kanjis/' + $(this).data('value'),
        dataType: "json",
        success: function(data){
          $kanji.remove();
          $('#flash-messages').replaceWith('<div class="alert alert-success %>">'+data.flash[0][1]+'</div>')
        },
        error: function(error){
          $('#flash-massages').replaceWith('<div class="alert alert-danger %>">'+"Error: Action Failed"+'</div>')
        }
      })
    }
  });
  }

$(document).ready(function() {
  destroykanji();
});

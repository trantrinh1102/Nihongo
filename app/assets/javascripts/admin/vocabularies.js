function destroyVocabulary(){
  $(".btn-delete-vocabulary").click(function(){
    $category = $(this).closest('tr');
    if(confirm('Are you sure ?'))
    {
      $.ajax({
        type: "DELETE",
        url: '/admin/vocabularies/' + $(this).data('value'),
        dataType: "json",
        success: function(data){
          $category.remove();
          $('#flash-messages').replaceWith('<div class="alert alert-success %>">'+data.flash[0][1]+'</div>')
        },
        error: function(error){
          $('#flash-massages').replaceWith('<div class="alert alert-danger %>">'+"Error: Action Failed"+'</div>')
        }
      })
    }
  });
}

$(document).ready(function(){
  destroyVocabulary();
})

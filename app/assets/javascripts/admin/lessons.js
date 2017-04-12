function destroyLesson(){
  $(".btn-delete-lesson").click(function(){
    $category = $(this).closest('tr');
    if(confirm('Are you sure ?'))
    {
      $.ajax({
        type: "DELETE",
        url: '/admin/lessons/' + $(this).data('value'),
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

function cloneLessonKanji(){
  $('.btn-add-lesson-kanji').click(function(){
    // var lesson_kanjis = "";
    // inputTitle = $(".input-form-kanji.clone-item:first").find("input#kanji_title:disabled");
    // if (inputTitle.length > 0) {
    //   inputTitle.prop('disabled', false);
    //   $(".input-form-kanji.clone-item:first").show();
    // }
    // else {
    var clone = $(".input-form-kanji.clone-item:first").clone();
    replaceIndexOfInput(clone.find("#kanji_title"), $(".input-form-kanji").length + 1);
    clone.appendTo(".lesson_kanji_form.content-block-input-clones");
    removeCloneItem(clone.find(".remove-clone"));
    // }
  });
  $('.content-block-input-clones .remove-clone').click(function(e){
    $(e.target).closest(".clone-item").remove();
  });
}

function removeItemUpdate(){
  $('.remove-update').click(function(e){
    $(e.target).closest(".input-form-kanji").hide();
    $(e.target).closest(".input-form-kanji").find(".destroyItem").prop('disabled', false)
  })
}

function checkBoxEvent(){
  $('#checkboxImportKanji').change(function(e) {
    if (this.checked) {
      $(e.target).closest(".importCSV").find("#importKanji").prop("disabled", false);
      $(e.target).closest("#kanji").find(".lesson_kanji_form input[type=text]").prop("disabled", true);
    } else {
      $(e.target).closest(".importCSV").find("#importKanji").prop("disabled", true);
      $(e.target).closest("#kanji").find(".lesson_kanji_form input[type=text]").prop("disabled", false);
    }
  });
}

function replaceIndexOfInput(selector, index){
  try {
    selector.attr("name", selector.attr("name").replace(/\d/, index));
  }
  catch(err) {
  }
}

function removeCloneItem(selector){
  $(selector).click(function(e){
    $(e.target).closest(".clone-item").remove();
  });
}

$(document).ready(function() {
  destroyLesson();
  cloneLessonKanji();
  removeItemUpdate();
});

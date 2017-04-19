function cloneAnswer(){
  $(".btn-add-question").click(function(e){
    var clone = $(".answersForm:first").clone();
    var inputs = clone.find("input[type=text]");
    resetInputClone(inputs);
    replaceIndexOfInput(clone.find("#content"), $(".answerFormInput").length + 1);
    replaceIndexOfInput(clone.find("#input_is_correct"), $(".answerFormInput").length + 1);
    replaceIndexOfInput(clone.find("#is_correct"), $(".answerFormInput").length + 1);
    clone.find("#content").val("");
    clone.find("#input_is_correct").val("false");
    clone.find("#is_correct").prop('checked', false);
    clone.find("#answer_destroy").remove();

    clone.appendTo(".contentAnswer");
    var title = $(e.target).closest(".contentAnswer").find(".clone-item .title");
    removeCloneItemAnswer(clone.find(".remove-clone"));
    resetTitleAnswer();
    groupRadioButton();
  });
}

function removeCloneItemAnswer(selector){
  $(selector).click(function(e){
    if($(e.target).closest(".clone-item").find("#answer_destroy").length > 0)
    {
      $(e.target).closest(".clone-item").hide();
      $(e.target).closest(".clone-item").find("#answer_destroy").val("true");
    }
    else
    {
      $(e.target).closest(".clone-item").remove();
    }
      resetTitleAnswer();
  });
}

function groupRadioButton() {
    $('input[type=radio]').change(function() {
      var name_unchecked = $('input[type=radio]:checked').not(this).attr('name');
      var name_checked = $(this).attr('name');
      $('input[type=radio]:checked').not(this).prop('checked', false);
      $('input[name="'+ name_unchecked + '"]').val("false");
      $('input[name="'+ name_checked + '"]').val("true");

    });
}

function resetTitleAnswer(){
  var title = $(".contentAnswer").find(".clone-item .title");
  title.each(function(index, item){
    $(item).text("Answer " + (index +1));
  });
}



function show_character_form() {
  $("#show_form").on("click", function(event) {
    event.preventDefault();
    $(".hidden_character_form").show();
    $("#preview_character").hide()
    
  });
}

$(document).ready(show_character_form);
$(document).on("page:load", show_character_form);

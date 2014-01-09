// Allows character list to be toggled on the user page.

function list_characters() {
  $("#show").on("click", function(event) {
    event.preventDefault();
    $(".character_list").slideToggle();
  });
}

$(document).ready(list_characters);

$(function() {
  $('.comment').on( "click", ".comment_remove", function () {
    $(this).parent().remove();
  });
});
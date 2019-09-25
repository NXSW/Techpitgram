$(function() {
  $('.comment').on( "click", ".comment_remove", function () {
    console.log(this)
    $(this).parent().remove();
  });
});
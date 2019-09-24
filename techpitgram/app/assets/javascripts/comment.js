function buildHTML(comment) {
  var html = `<%= ${ comment.name } %>
              <%= ${ comment.text } %>
              <%= link_to '削除', "/posts/${comment.post_id}/comments/${comment.id}", method: :delete %>`
  return html;
}

$('.new_comments').on('submit', function(e) {
  console.log("1")
  e.preventDefault();
  console.log("2")
  var formData = new FormData(this);
  var href = window.location.href + '/comments'
  console.log(href);
  $.ajax({
    url: href,
    type: "POST",
    data: formData,
    dataType: 'json',
    processData: false,
    contentType: false
  })
  .done(function (data) {
    var html = buildHTML(data);
    $('.comments').prepend(html);
    $('.comment_text').val('')
  })
  .fail(function () {
    alert("エラー")
  })
})
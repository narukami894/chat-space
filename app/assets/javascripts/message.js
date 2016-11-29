function message_html(data){

  if (data.image) {
    var image = '<br><img src="' + data.image + '">';
  } else {
    var image = '';
    };

  var message = $(
    "<li class='chatMessage'>" +
      "<div class= 'chatMessage__header'>" +
        "<p class= 'chatMessage__header__name'>" +
          data.name +
        "</p>" +
        "<p class= 'chatMessage__header__time'>" +
          data.time +
        "</p>" +
      "</div>" +
      "<p class='chatMessage__body'>" +
      data.body +
      image +
      "</p>" +
    "</li>"
                );

    return message;
  };

$(function(){

  $('#message_image').on('change', function(){
    $(this).parents('form#new_message').submit();
  });

  $('form#new_message').submit(function(e) {
    e.preventDefault();

    var fd = new FormData($('form#new_message').get(0));

    $.ajax({
      url: './messages.json',
      type: 'POST',
      data: fd,
      processData: false,
      contentType: false,
      dataType: 'json'
    })

    .done(function(json) {
      $('.chatMessages').append(message_html(json));
      $('#message_body').val('');
      $('#message_image').val('');
    })
    .fail(function(json) {
    });

  });
});

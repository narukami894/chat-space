function messages(data){

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
      "</p>" +
    "</li>" );

    return message;
  };

$(function(){

  $('form#new_message').submit(function(e) {
    e.preventDefault();
    $.ajax({
      url: './messages',
      type: 'POST',
      data: { message: { body: $('#message_body').val() } },
      dataType: 'json'
    })

    .done(function(data) {
      $('.chatMessages').append(messages(data));
      $('#message_body').val('');
    })
    .fail(function(data) {
    });

  });
});

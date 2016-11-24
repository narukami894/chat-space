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
      $('.chatMessage__header__name').append(data.name);
      $('.chatMessage__header__time').append(data.created_at);
      $('.chatMessage__body').append(data.body);
    })
    .fail(function(data) {
    });

  });
});

// var users = []




$(function(){

  $('input#group_users').keyup(function(){


    $.ajax({
      url: '/users',
      type: 'GET',
      data: { name: $('input#group_users').val() },
      dataType: 'json'
    })








    .done(function(data) {
      $('.chatGroupForm__field--right__users__user').append('<p>てすと</p>');
    })
    .fail(function(data) {
    });

  });
});

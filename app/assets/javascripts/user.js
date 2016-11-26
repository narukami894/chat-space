var users = []







$(function(){

  $('input#group_users').on("keyup", function() {



    $.ajax({
      url: './users',
      type: 'GET',
      data: users,
      dataType: 'json'
    })

    .done(function(data) {
      $('.chatMessages').append();
    })
    .fail(function(data) {
    });

  });
});

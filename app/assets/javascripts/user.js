function result_html(data){

  var result = $(
    "<li class='searchResult__name'>" +
      data.name +
    "</li>"
    );

  return result
};


$(function(){

  $('input#group_users').keyup(function(){


    $.ajax({
      url: '/users',
      type: 'GET',
      data: { names: $('input#group_users').val() },
      dataType: 'json'
    })

    .done(function(data) {
      $('#searchResult').append(result_html(data));
    })
    .fail(function(data) {
    });

  });
});

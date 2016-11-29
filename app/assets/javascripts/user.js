function result_html(data){


  var result = $(
                  "<div>" +
                    "<input type='hidden'>" +

                    "<p class='searchResult__name'>" +
                      data.name +
                    "</p>" +
                    "<a>" +

                    "</a>" +
                  "</div>"
                );

  return result;
};



function ajaxSearch() {

  $.ajax({
    url: '/users.json',
    type: 'GET',
    data: { name: $('#group_users').val() } ,
    dataType: 'json'
  })
  .done(function(json){
    // console.log(data);
    json.forEach(function(data){
      $('#searchResult').append(result_html(data));
    });
  })
  .fail(function(json){
  });
}




$(function(){

  $('input#group_users').on('change keyup', ajaxSearch);



// 追加ボタン
//   $().on('click', '', function(){

//   });

// 削除ボタン
//   $().on('click', '', function(){

//   });



});

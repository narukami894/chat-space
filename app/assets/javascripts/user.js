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
    url: '/users',
    type: 'GET',
    data: { name: $('input#group_users').val() } ,
    dataType: 'json'
  })
  .done(function(data){
    console.log(data);
    data.forEach(function(){
      $('#searchResult').append(result_html(data));
    });
  })
  .fail(function(data){
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

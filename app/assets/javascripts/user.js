function result_html(data){


  var result = $(
                  "<div class='searchResult'>" +
                    "<input type='hidden'>" +

                    "<p class='searchResult__name'>" +
                      data.name +
                    "<a class='searchResult__name__addbtn'>" +
                      '追加' +
                    "</a>" +
                     "</p>" +
                  "</div>"
                );

  return result;
};

function add_html(data){

  var add = $(
                "<li>" +
                  data.name +
                "</li>" 
               )
  return add;
};





function ajaxSearch() {

  $.ajax({
    url: '/users.json',
    type: 'GET',
    data: { name: $('#group_users').val() } ,
    dataType: 'json'
  })
  .done(function(json){
    json.forEach(function(data){
      $('#searchResult').html(result_html(data));
    });
  })
  .fail(function(json){
  });
}




$(function(){

  $('input#group_users').on('change keyup', ajaxSearch);



// 追加ボタン
  $('searchResult__name__addbtn').on('click', function(){
    $('.chatGroupForm__field--right__users').append("")

  });

// 削除ボタン
//   $().on('click', '', function(){

//   });



});

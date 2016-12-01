function result_html(data){

  var result =
                "<div class='searchResult'>" +
                  "<p class='searchResult__name'>" +
                    data.name +
                    "<a class='searchResult__name__addbtn' >" +
                      "追加" +
                    "</a>" +
                  "</p>" +
                "</div>"

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
    json.forEach(function(data){
      $('#searchResult').html(result_html(data));
    });
  })
  .fail(function(json){
  });
}





$(function(json){






  $('input#group_users').on('change keyup', ajaxSearch);

  function adddeletebtn{
    var deletebtn =
                "<a class='searchResult__name__deletebtn'>" +
                  "削除" +
                "</a>"
    return deletebtn;
  }


  $('#searchResult').on('click', '.searchResult__name__addbtn', function() {
    $(this).parent('.searchResult__name').remove();
    $('.chatGroupForm__field--right__users__user').append($(this));

  });

  $('.searchResult__name__deletebtn').on('click', '', function(){
    $(this).parent().remove();
  });



});

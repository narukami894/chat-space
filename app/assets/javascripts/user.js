function result_html(data){

    var result =
                  "<div class='searchResult'>" +
                    "<li class='chatGroupForm__field--right__users__user' data-name='" +
                    data.name +
                    "'>" +
                      data.name +
                      "<a class='chatGroupForm__field--right__users__user__addbtn' >" +
                        "追加" +
                      "</a>" +
                      "<input name='group[user_ids][]' type='hidden' data-id='" +
                      data.id +
                       "' value='" +
                        data.id +
                      "'>" +
                    "</li>" +
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
 };

      function added_user_html(data_id, data_name){
        var added_user =
                    "<li class='chatGroupForm__field--right__users__user' data-name='" +
                    data_name +
                    "'>" +
                      data_name +
                      "<a class='chatGroupForm__field--right__users__user__deletebtn' >" +
                        "削除" +
                      "</a>" +
                      "<input name='group[user_ids][]' type='hidden' data-id='" +
                      data_id +
                       "' value='" +
                        data_id +
                      "'>" +
                    "</li>" +
                  "</div>"
      return added_user
}

$(function(){

  $('input#group_users').on('change keyup', ajaxSearch);

  $('#searchResult').on('click', '.chatGroupForm__field--right__users__user__addbtn', function(){

    var $this = $(this);
    var data_id = $this.siblings().data("id");
    var data_name = $this.parent().data("name");

    $(this).parent('.chatGroupForm__field--right__users__user').remove();
    $('.chatGroupForm__field--right__users').append(added_user_html(data_id, data_name));
  });

  $('.chatGroupForm__field--right__users').on('click', '.chatGroupForm__field--right__users__user__deletebtn', function(){
    $(this).parent('.chatGroupForm__field--right__users__user').remove();
  });

});

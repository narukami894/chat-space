$('#new-message').on('submit', function(e) {

  $.ajax({
    url: "groups/58/messages",
    type: 'POST',
    // async: true,
    dataType: 'json',
    data: {  name: hoge,  body: test, created_at: test }

  }).done(function(data) {
      if (data.cod == 201) {
        $('.chatMessage__header__name').append('%li. a');
        $('.chatMessage__header__time').append(a);
        $('.chatMessage__body').append(a);
      }
      else {
          alert('エラー');
      }
      })
    .fail(function() {
      alert('メッセージが空では投稿できません');
    });

  e.preventDefault();
});

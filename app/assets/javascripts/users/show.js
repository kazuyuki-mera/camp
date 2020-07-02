$(function(){
  $('#user-delete').click(function(){
    if (!confirm('退会してよろしいでしょうか？')) {
      return false;
    } else {
      $('p').text('退会が完了しました。');
    }
  })
 });
$(function(){
  $('#reservation-confirm').click(function(){
    if (!confirm('この内容で予約してよろしいでしょうか？')) {
      return false;
    } else {
      $('p').text('予約が完了しました。');
    }
  })
 });
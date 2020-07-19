$(function(){
  // お問い合わせ確認ダイアログ
  $('#contact-confirm').click(function(){
    if (!confirm('この内容でお問い合わせしてよろしいでしょうか？')) {
      return false;
    }
  });
 });
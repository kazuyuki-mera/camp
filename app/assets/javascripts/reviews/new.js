$(function(){
  // レビュー確認ダイアログ
  $('#review-confirm').click(function(){
    if (!confirm('レビューを投稿してよろしいでしょうか？')) {
      return false;
    }
  });
 });
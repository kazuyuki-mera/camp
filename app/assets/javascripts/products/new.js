$(function(){
  // 登録確認ダイアログ
  $('#product-confirm').click(function(){
    if (!confirm('この内容で登録してよろしいでしょうか？')) {
      return false;
    }
  });

  $('#product_image').change(function(){
    let viewArea = $('.view-area');
    let inputFile = $(this).prop('files')[0];
    let inputImg = $(this).next('img');
    let fileRead = new FileReader();

    if(inputImg.length){
      inputImg.nextAll().remove();
      inputImg.remove();
    }

    let img = $('#product-image');
    viewArea.append(img);

    fileRead.onload = function(){
      viewArea.find('img').attr('src', fileRead.result);
    }
    fileRead.readAsDataURL(inputFile);
  });

  $('#product-image').click(function(){
    if (confirm('画像を削除してよろしいでしょうか？')) {
      $(this).attr('src', '');
      $('#product_image').val('');
    }
  });
});
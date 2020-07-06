$(function(){
  $('#product_image').change(function(){
    let viewArea = $('.view-area');
    let inputFile = $(this).prop('files')[0];
    let inputImg = $(this).next('img');
    let fileRead = new FileReader();

    if(inputImg.length){
      inputImg.nextAll().remove();
      inputImg.remove();
    }

    let img = '<img width="100%" class="img-view"><a href="#" class="img-delete">画像を削除する</a>';
    viewArea.append(img);

    fileRead.onload = function(){
      viewArea.find('img').attr('src', fileRead.result);
      deleteimg(viewArea);
    }
    fileRead.readAsDataURL(inputFile);
  });

  function deleteimg(target){
    target.find('a.img-delete').on('click', function(){
      if(window.confirm('画像を削除します。\nよろしいですか？')){
        $(this).parent().find('input[type=file]').val('');
        $(this).parent().find('.img-view, br').remove();
        $(this).remove();
      }
      return false;
    });
  }
});
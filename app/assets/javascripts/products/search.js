$(function(){
  // 検索フォームに入力された時
  $('#product-search').on('keyup', function(){
    let input = $(this).val();
    $.ajax({
      type: 'GET',
      url:  '/products',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(products){
      // 検索結果をリセット
      $(".results").empty();

      // 検索結果が存在する場合、検索結果を表示
      if (products.length !== 0) {
        products.forEach(function(product){
          addResult(product);
        });
      } else {
        noResult();
      }
    })
    .fail(function(){
      alert("通信エラーのため、検索ができません");
    });
  })

  // 検索結果html生成
  function addResult(product) {
    let html = `
                <a class="form-control mr-sm-2" href="/products/${product.id}">
                  ${product.name}
                </a>
               `;
    $(".results").append(html);
  }

  // 検索結果無しhtml生成
  function noResult() {
    let html = `
               <div class="form-control mr-sm-2">
                該当するサイトはありません
               </div>
               `;
    $(".results").append(html);
  }
})
$(function(){
  // 予約確認ダイアログ
  $('#reservation-confirm').click(function(){
    if (!confirm('この内容で予約してよろしいでしょうか？')) {
      return false;
    }
  });

  // 宿泊開始日変更メソッド
  $('#reservation_start_date').change(function(){
    let startDate = new Date($('#reservation_start_date').val());
    let endDate = new Date($('#reservation_end_date').val());
    let totalPrice = calcPrice(startDate, endDate);
    $('#total_price').text(totalPrice + '円');
    $('#reservation_total_price').val(totalPrice);
  });

  // 宿泊終了日変更メソッド
  $('#reservation_end_date').change(function(){
    let startDate = new Date($('#reservation_start_date').val());
    let endDate = new Date($('#reservation_end_date').val());
    let totalPrice = calcPrice(startDate, endDate);
    $('#total_price').text(totalPrice + '円');
    $('#reservation_total_price').val(totalPrice);
  });

  // 宿泊料金計算
  function calcPrice(startDate, endDate) {
    let diffDate = (endDate - startDate) / 86400000;
    const reservationPrice = $('#hidde-price').data('price');
    if (diffDate == 0) {
      return reservationPrice.toString();
    } else if (diffDate > 0) {
      return (reservationPrice * diffDate).toString();
    } else {
      return '0';
    }
  }
 });
$(document).on('turbolinks:load', function() {
  $('.add-to-cart').click(function() {
    var id = $(this).attr('data');
    var quantity = $('#item_quantity').val();
    $.ajax({
      url: '/cart/' + id,
      data: {
        product_id: id,
        quantity: quantity
      },
      method: 'POST',
      success: function(result) {
        $('.cart-head').text('  (' + result + ')');
      }
    })
  });
});

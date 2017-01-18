$(document).on('turbolinks:load', function() {
  $('body').on('click', '.btn-edit-product', function(e) {
    e.preventDefault();
    $('.product-modal-edit').css('display', 'block')
    $.ajax({
      dataType: 'html',
      url: $(this).attr('href'),
      method: 'get',
      success: function(data) {
        $('.modal-body-edit').html(data);
      }
    });
    return false
  });

  $('body').on('click', '.btn-new-product', function(e) {
    e.preventDefault();
    $('.product-modal-new').css('display', 'block')
    $.ajax({
      dataType: 'html',
      url: $(this).attr('href'),
      method: 'get',
      success: function(data) {
        $('.modal-body-new').html(data);
      }
    });
    return false
  });
});

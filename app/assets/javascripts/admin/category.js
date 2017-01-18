$(document).on('turbolinks:load', function() {
  $('body').on('click', '.btn-edit-category', function(e) {
    e.preventDefault();
    $('.category-modal-edit').css('display', 'block')
    $.ajax({
      dataType: 'html',
      url: $(this).attr('href'),
      method: 'get',
      success: function(data) {
        $('.modal-body-category-edit').html(data);
      }
    });
    return false
  });
});

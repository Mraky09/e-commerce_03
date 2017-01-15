$(document).on('turbolinks:load', function() {
  $('body').on('click', '.new_comment', function() {
    $form = $(this);
    $form.submit(function(e) {
      e.preventDefault();
      e.stopImmediatePropagation();
      $.ajax({
        url: $form.attr('action'),
        method: $form.attr('method'),
        data: $form.serialize(),
        dataType: 'html',
        success: function(data) {
          $('#comments').append(data);
          $form[0].reset();
        },
        error: function(jqXHR, exception) {
          sweetAlert(I18n.t('ops'), I18n.t('create_comment_error'), 'error');
        }
      })
    })
  });

  $('body').on('click', '.delete-comment', function(e) {
    e.preventDefault();
    if (confirm(I18n.t('confirm_delete'))) {
      $cmt_id = $(this).attr('href').split('/')[4]
      $div_id = '#comment_' + $cmt_id
      $.ajax({
        dataType: 'html',
        url: $(this).attr('href'),
        method: 'DELETE',
        success: function() {
          $($div_id).hide();
        }
      })
    } else {

    }
    return false;
  })
});

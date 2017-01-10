function new_item(button, container, error_message) {
  $('body').on('click', button, function() {
    $form = $(this);
    $form.submit(function(e) {
      e.preventDefault();
      e.stopImmediatePropagation();
      $.ajax({
        dataType: 'html',
        method: $form.attr('method'),
        url: $form.attr('action'),
        data: $form.serialize(),
        success: function(data) {
          if($('modal-new').length > 0) {
            $('modal-new').hide();
          }
          $new_row = $('' + data);
          if (data == null) {
            alert(I18n.t('error'));
          }
          $(container + ' tr:last').after($new_row);
          $form[0].reset()
        },
        error: function(jqXHR, exception) {
          alert(error_message);
        }
      });
    });
  });
}

function delete_item(button, type) {
  $('body').on('click', button, function(e) {
    e.preventDefault();
    $type_id = $(this).attr('href').split('/')[3]
    $tr_id = '#' + type + '_' + $type_id
    $url = $(this).attr('href')
    swal({
      title: I18n.t('you_sure'),
      text: I18n.t('warning_delete'),
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#DD6B55',
      confirmButtonText: I18n.t('confirm_button'),
      cancelButtonText: I18n.t('cancel_button'),
      closeOnConfirm: false,
      closeOnCancel: false
    }, function(isConfirm) {
      if (isConfirm) {
        $.ajax({
          dataType: 'html',
          url: $url,
          method: 'DELETE',
          data: {
            id: $type_id
          },
          success: function() {
            swal(I18n.t('done_delete'),
              I18n.t('delete_desc'),
              'success');
            $($tr_id).fadeOut();
          },
          error: function(jqXHR, exception) {
            sweetAlert(I18n.t('something_wrong'),
              I18n.t('delete_cate_error'), 'error');
          }
        })
      } else {
        swal(I18n.t('canceled'), I18n.t('dont_delete'), 'error');
      }
    });
    return false;
  })
}

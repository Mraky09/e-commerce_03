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

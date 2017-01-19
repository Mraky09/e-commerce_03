$(document).on('turbolinks:load', function() {
  $(function() {
     $("#start_at").datepicker({
      dateFormat: "yy-mm-dd"
     });
     $("#end_at").datepicker({
      dateFormat: "yy-mm-dd"
     });
   });
});

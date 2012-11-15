// Generated by CoffeeScript 1.4.0
(function() {

  jQuery(function($) {
    var form;
    form = $('#image-form form');
    return form.find(':file').change(function() {
      var _this = this;
      return form.ajaxForm({
        url: '/image_upload/',
        dataType: 'JSON',
        success: function(result) {
          if (result.status === 'Success') {
            return form.find('input[name=image]').val(result.content);
          } else {
            return alert(result.content);
          }
        }
      });
    });
  });

}).call(this);

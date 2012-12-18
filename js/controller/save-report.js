// Generated by CoffeeScript 1.4.0
(function() {

  jQuery(function($) {
    return $('#publish').click(function() {
      var data, form, match;
      form = $('#about-form form');
      data = form.getFormData();
      data.blocks = [];
      $('#editor > .widget').each(function() {
        return data.blocks.push($(this).data('model').get());
      });
      match = location.href.match(/\/edit\/(\d+)/);
      if (match) {
        data.id = match[1];
      }
      form.find('button').prop('disabled', true);
      $.ajax({
        url: match ? '/update/' + match[1] : '/create/',
        data: {
          report: JSON.stringify(data)
        },
        type: 'POST',
        dataType: 'JSON',
        success: function(result) {
          form.find('button').prop('disabled', false);
          if (result.status === 'Success') {
            alert('Your report is created and published');
            return location.href = '/view/' + result.object.id + '/';
          } else {
            return alert(result.content);
          }
        }
      });
      return false;
    });
  });

}).call(this);

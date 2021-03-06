// Generated by CoffeeScript 1.4.0
(function() {

  jQuery(function($) {
    var colorBtn, dropDown;
    dropDown = $('#status-form .drop-down');
    colorBtn = $('#status-form .choose-color a').click(function() {
      dropDown.toggle();
      return false;
    });
    $('body').click(function() {
      return dropDown.hide();
    });
    dropDown.find('li').click(function() {
      var color;
      color = $(this).find('input').val();
      return colorBtn.attr('class', 'color ' + color);
    });
    $('#status-form').on('setFormData', function(e, data) {
      return colorBtn.attr('class', 'color ' + data.status);
    });
    return $('#status-form').on('clearForm', function() {
      return colorBtn.attr('class', 'color green');
    });
  });

}).call(this);

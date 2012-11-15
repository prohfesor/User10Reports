// Generated by CoffeeScript 1.4.0
(function() {

  jQuery(function($) {
    $('#edit-tab, #share-tab').hide();
    $('#toggle-tab').click(function() {
      var $this;
      $this = $(this);
      if ($this.hasClass('close')) {
        return showTypeForm();
      } else {
        $('#forms').toggle();
        return $(this).toggleClass('active');
      }
    });
    $('#about-tab').click(function() {
      $('#about-form').showForm();
      $('#forms').show();
      return $('#toggle-tab').addClass('active');
    });
    window.showTypeForm = function() {
      $('#toggle-tab').removeClass('close').addClass('switch active');
      $('#about-tab').show().removeClass('active');
      $('#add-widget-tab').show().addClass('active');
      $('#edit-tab').hide();
      $('#types-form').showForm();
      return $('#forms').show();
    };
    $('#add-widget-tab').click(function() {
      return showTypeForm();
    });
    $('#add-widget').click(function() {
      return showTypeForm();
    });
    $('#tabs .button').click(function() {
      $(this).closest('ul').find('.button').removeClass('active');
      return $(this).addClass('active');
    });
    return $('#share-tab').click(function() {
      return $('#share-form').showForm();
    });
  });

}).call(this);

// Generated by CoffeeScript 1.4.0
(function() {

  jQuery(function($) {
    $('#edit-tab, #share-tab').hide();
    $('#toggle-tab').click(function() {
      var $this;
      $this = $(this);
      if ($this.hasClass('close')) {
        $this.toggleClass('switch close');
        $('#about-tab').show();
        $('#add-widget-tab').show().addClass('active');
        $('#edit-tab').hide();
        return $('#types-form').showForm();
      } else {
        $('#forms').toggle();
        return $(this).toggleClass('active');
      }
    });
    $('#about-tab').click(function() {
      return $('#about-form').showForm();
    });
    $('#add-widget-tab').click(function() {
      return $('#types-form').showForm();
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

// Generated by CoffeeScript 1.4.0
(function() {

  jQuery(function($) {
    return $('#types-form li').click(function() {
      var $this, className;
      $this = $(this);
      className = $this.data('class');
      return $('#' + className + '-form').clearForm().showForm();
    });
  });

}).call(this);

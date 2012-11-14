// Generated by CoffeeScript 1.4.0
(function() {

  jQuery(function($) {
    window.showWidgetForm = function(form) {
      $('#forms > *').hide();
      return $('#forms > ' + form).show();
    };
    $('#forms form').submit(function() {
      var $this, addBtn, className, coord, newAddBtn, view, widget;
      $this = $(this);
      className = $this.attr('id').replace('-form', '');
      addBtn = $('#add-widget');
      newAddBtn = addBtn.clone();
      coord = addBtn.coords().grid;
      widget = new widgetMap[className].model();
      view = new widgetMap[className].view(widget);
      addBtn.hide();
      Editor.remove_widget(addBtn, function() {
        Editor.add_widget(view.getHtml(), 1, 1, coord.col, coord.row);
        return Editor.add_widget(newAddBtn, 1, 1, coord.col + 1, coord.row);
      });
      return false;
    });
    return $('#forms form .cancel').click(function() {
      return showWidgetForm('#types-form');
    });
  });

}).call(this);
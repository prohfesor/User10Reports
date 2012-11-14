// Generated by CoffeeScript 1.4.0
(function() {

  jQuery(function($) {
    $('.gridster > ul').gridster({
      widget_margins: [0, 0],
      widget_base_dimensions: [200, 200]
    });
    window.Editor = $('.gridster > ul').gridster().data('gridster');
    $('#types-form').showForm();
    return window.widgetMap = {
      custom: {
        model: CustomWidget,
        view: CustomView
      },
      image: {
        model: ImageWidget,
        view: ImageView
      },
      list: {
        model: ListWidget,
        view: ListView
      },
      quote: {
        model: QuoteWidget,
        view: QuoteView
      },
      status: {
        model: StatusWidget,
        view: StatusView
      }
    };
  });

}).call(this);

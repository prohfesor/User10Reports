// Generated by CoffeeScript 1.4.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.ImageWidget = (function(_super) {

    __extends(ImageWidget, _super);

    function ImageWidget() {
      return ImageWidget.__super__.constructor.apply(this, arguments);
    }

    ImageWidget.prototype.data = {
      id: 0,
      report_id: 0,
      position: 0,
      type: 'image',
      caption: '',
      picture: '',
      source: ''
    };

    return ImageWidget;

  })(Model);

  jQuery(function($) {
    return window.ImageView = (function(_super) {

      __extends(ImageView, _super);

      function ImageView() {
        return ImageView.__super__.constructor.apply(this, arguments);
      }

      ImageView.prototype.html = $('#image-tpl').html();

      ImageView.prototype.template = {
        '': {
          on: {
            'click': function() {
              return $('#image-form').setFormModel(this).showForm();
            }
          },
          style: {
            'background-image': {
              '@picture': function(url) {
                return "url(" + url + ")";
              }
            }
          }
        }
      };

      return ImageView;

    })(View);
  });

}).call(this);

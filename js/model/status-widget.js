// Generated by CoffeeScript 1.4.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.StatusWidget = (function(_super) {

    __extends(StatusWidget, _super);

    function StatusWidget() {
      return StatusWidget.__super__.constructor.apply(this, arguments);
    }

    StatusWidget.prototype.data = {
      id: 0,
      report_id: 0,
      type: 'status',
      row: 1,
      col: 1,
      title: '',
      name: '',
      status: '',
      source: ''
    };

    return StatusWidget;

  })(Model);

  jQuery(function($) {
    return window.StatusView = (function(_super) {

      __extends(StatusView, _super);

      function StatusView() {
        return StatusView.__super__.constructor.apply(this, arguments);
      }

      StatusView.prototype.html = $('#status-tpl').html();

      StatusView.prototype.template = {
        '': {
          on: {
            'click': function() {
              return $('#status-form').setFormData(this.get()).setFormModel(this).showForm();
            }
          },
          cssClass: {
            'green': {
              '@status': function(status) {
                return status === 'green';
              }
            },
            'yellow': {
              '@status': function(status) {
                return status === 'yellow';
              }
            },
            'red': {
              '@status': function(status) {
                return status === 'red';
              }
            },
            'grey': {
              '@status': function(status) {
                return status === 'grey';
              }
            }
          }
        },
        '.block-caption': {
          html: '@title'
        },
        '.area': {
          html: '@name'
        },
        '.tipsy-inner': {
          html: '@source'
        },
        '.widget-hint': {
          cssClass: {
            'empty': {
              '@source': function(text) {
                return $.trim(text).length === 0;
              }
            }
          }
        }
      };

      return StatusView;

    })(View);
  });

}).call(this);

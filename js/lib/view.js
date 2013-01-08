// Generated by CoffeeScript 1.4.0
(function() {
  var checkOps, dom, setEventTo, up, util,
    __slice = [].slice;

  window.View = (function() {

    View.prototype.html = '';

    View.prototype.template = {};

    function View(model, defOps) {
      var helper, helperOps, node, ops, selector, _ref;
      if (defOps == null) {
        defOps = {};
      }
      this._html = dom.htmlToNode(defOps.html || this.html);
      _ref = this.template;
      for (selector in _ref) {
        ops = _ref[selector];
        node = selector === '' ? this._html : dom.getNodeBySelector(this._html, selector);
        for (helper in ops) {
          helperOps = ops[helper];
          View.helpers[helper](helperOps, node, model);
        }
      }
      return this;
    }

    View.prototype.getHtml = function() {
      return this._html;
    };

    return View;

  })();

  View.helpers = {
    "do": function(ops, node, model) {
      return ops.call(model, node);
    },
    html: function(ops, node, model) {
      var event, func, _fn, _ref;
      _ref = checkOps(ops);
      _fn = function(func) {
        return setEventTo(model, event, function() {
          var args;
          args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
          args.push(node);
          return dom.setHtml(node, func.apply(model, args));
        });
      };
      for (event in _ref) {
        func = _ref[event];
        _fn(func);
      }
      return this;
    },
    attr: function(ops, node, model) {
      var attrOps, event, func, name, _fn, _ref;
      for (name in ops) {
        attrOps = ops[name];
        _ref = checkOps(attrOps);
        _fn = function(name, func) {
          return setEventTo(model, event, function() {
            var args;
            args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
            args.push(node);
            return dom.setAttr(node, name, func.apply(model, args));
          });
        };
        for (event in _ref) {
          func = _ref[event];
          _fn(name, func);
        }
      }
      return this;
    },
    prop: function(ops, node, model) {
      var event, func, name, propOps, _fn, _ref;
      for (name in ops) {
        propOps = ops[name];
        _ref = checkOps(propOps);
        _fn = function(name, func) {
          return setEventTo(model, event, function() {
            var args;
            args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
            args.push(node);
            return dom.setProp(node, name, func.apply(model, args));
          });
        };
        for (event in _ref) {
          func = _ref[event];
          _fn(name, func);
        }
      }
      return this;
    },
    bind: function(ops, node, model) {
      var field, prop;
      for (prop in ops) {
        field = ops[prop];
        model.on('set' + up(field), function(value) {
          return dom.setProp(node, prop, value);
        });
        node.on('change', function() {
          return model.set(field, dom.getProp(node, prop));
        });
        dom.setProp(node, prop, model.get(field));
      }
      return this;
    },
    cssClass: function(ops, node, model) {
      var clssOps, event, func, name, _fn, _ref;
      for (name in ops) {
        clssOps = ops[name];
        _ref = checkOps(clssOps);
        _fn = function(name, func) {
          return setEventTo(model, event, function() {
            var args;
            args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
            args.push(node);
            if (func.apply(model, args)) {
              return dom.addClass(node, name);
            } else {
              return dom.delClass(node, name);
            }
          });
        };
        for (event in _ref) {
          func = _ref[event];
          _fn(name, func);
        }
      }
      return this;
    },
    style: function(ops, node, model) {
      var event, func, name, styleOps, _fn, _ref;
      for (name in ops) {
        styleOps = ops[name];
        _ref = checkOps(styleOps);
        _fn = function(name, func) {
          return setEventTo(model, event, function() {
            var args;
            args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
            args.push(node);
            return dom.setStyle(node, name, func.apply(model, args));
          });
        };
        for (event in _ref) {
          func = _ref[event];
          _fn(name, func);
        }
      }
      return this;
    },
    on: function(ops, node, model) {
      var event, func, _fn;
      _fn = function(func) {
        return dom.setEvent(node, event, function() {
          var args;
          args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
          args.push(node);
          return func.apply(model, args);
        });
      };
      for (event in ops) {
        func = ops[event];
        _fn(func);
      }
      return this;
    },
    onModel: function(ops, node, model) {
      var event, func, _fn;
      _fn = function(func) {
        return model.on(event, function() {
          var args;
          args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
          args.push(node);
          return func.apply(model, args);
        });
      };
      for (event in ops) {
        func = ops[event];
        _fn(func);
      }
      return this;
    },
    each: function(ops, node, model) {
      var arrItem, arrView, defaults, item, onAddField, onDelField, viewClass, _i, _len, _ref;
      defaults = {
        template: {},
        emptyContainer: true,
        addHandler: function(node, item) {
          return dom.addChild(node, item);
        },
        delHandler: function(node, item) {
          return dom.delNode(item);
        }
      };
      ops = util.extend(defaults, ops);
      if ('html' in ops === false && 'view' in ops === false) {
        ops.html = dom.getHtml(node);
      }
      if (ops.emptyContainer) {
        dom.clearNode(node);
      }
      viewClass = 'view' in ops ? ops.view : View.extend({
        html: ops.html,
        template: ops.template
      });
      arrItem = [];
      arrView = [];
      onAddField = function(item) {
        var itemViewClass, view;
        if ('__super__' in viewClass) {
          view = new viewClass(item);
        } else {
          itemViewClass = viewClass.call(this, item);
          view = new itemViewClass(item);
        }
        ops.addHandler.call(model, node, view.getHtml(), item);
        arrItem.push(item);
        return arrView.push(view);
      };
      onDelField = function(item, i) {
        ops.delHandler.call(model, node, arrView[i].getHtml(), item);
        arrItem.splice(i, 1);
        return arrView.splice(i, 1);
      };
      model.on('add' + up(ops.field), onAddField);
      model.on('del' + up(ops.field), onDelField);
      _ref = model.get(ops.field);
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        item = _ref[_i];
        onAddField.call(model, item);
      }
      return this;
    }
  };

  checkOps = function(ops) {
    var obj;
    switch (typeof ops) {
      case 'function':
        return {
          '': ops
        };
      case 'string':
        obj = {};
        obj[ops] = function(value) {
          return value;
        };
        return obj;
      default:
        return ops;
    }
  };

  setEventTo = function(model, event, callback) {
    if (model instanceof Model) {
      model.on(event, callback);
    } else {
      callback();
    }
    return this;
  };

  up = Model.util.up;

  View.extend = Model.extend;

  View.util = util = {
    checkOps: checkOps,
    setEventTo: setEventTo,
    extend: function() {
      var field, obj, src, target, val, _i, _len;
      target = arguments[0], src = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
      for (_i = 0, _len = src.length; _i < _len; _i++) {
        obj = src[_i];
        for (field in obj) {
          val = obj[field];
          target[field] = val;
        }
      }
      return target;
    }
  };

  View.dom = dom = {
    htmlToNode: function(html) {
      return jQuery(html);
    },
    getNodeBySelector: function(node, selector) {
      return node.find(selector);
    },
    setHtml: function(node, html) {
      return node.html(html);
    },
    getHtml: function(node) {
      return node.html();
    },
    setAttr: function(node, name, val) {
      return node.attr(name, val);
    },
    getAttr: function(node, name) {
      return node.attr(name);
    },
    setProp: function(node, name, val) {
      return node.prop(name, val);
    },
    getProp: function(node, name) {
      return node.prop(name);
    },
    addClass: function(node, name) {
      return node.addClass(name);
    },
    delClass: function(node, name) {
      return node.removeClass(name);
    },
    setStyle: function(node, prop, val) {
      return node.css(prop, val);
    },
    getStyle: function(node, prop) {
      return node.css(prop);
    },
    setEvent: function(node, event, callback) {
      return node.on(event, callback);
    },
    addChild: function(node, val) {
      return node.append(val);
    },
    delNode: function(node) {
      return node.remove();
    },
    clearNode: function(node) {
      return node.empty();
    }
  };

}).call(this);
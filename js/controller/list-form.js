// Generated by CoffeeScript 1.4.0
(function() {

  jQuery(function($) {
    var addLastInp, liTpl, list, listType, max;
    list = $('#form-list');
    max = list.data('max');
    liTpl = list.find('> li:first').detach();
    addLastInp = function() {
      if (list.children().length < max) {
        return list.append(liTpl.clone(true));
      }
    };
    liTpl.find('input').focus(function() {
      var parent;
      parent = $(this).closest('li');
      if (!parent.next().length) {
        return addLastInp();
      }
    });
    liTpl.find('input').blur(function() {
      var parent;
      parent = $(this).closest('li');
      if (this.value.length === 0 && parent.next().length > 0) {
        parent.remove();
        if (list.children().last().find('input').val() !== '') {
          return addLastInp();
        }
      }
    });
    list.append(liTpl.clone(true));
    $('#list-form input[name=list_type]').change(function() {
      list.removeClass('square digit').addClass(this.value);
      list.next().removeClass('square digit').addClass(this.value);
      $(this).closest('.input-block').find('li').removeClass('active');
      $(this).closest('li').addClass('active');
      return listType.hide();
    });
    $('#status-form input[type=radio]').change(function() {
      $(this).closest('ul').find('> li').removeClass('active');
      return $(this).closest('li').addClass('active');
    });
    $('#list-form').on('clearForm', function() {
      var lis;
      lis = list.find('> li');
      return lis.slice(0, lis.length - 1).remove();
    });
    $('#list-form').on('setFormData', function(e, data) {
      var li, value, _i, _len, _ref;
      list.empty();
      _ref = data.list;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        value = _ref[_i];
        li = liTpl.clone(true);
        li.find('input').val(value);
        list.append(li);
      }
      return addLastInp();
    });
    listType = $('#list-type').hide().css('position', 'absolute');
    $('body').on('click', '#form-list > li', function(e) {
      var $this, offset;
      if (e.target !== this) {
        return null;
      }
      $this = $(this);
      offset = $this.offset();
      listType.css({
        left: offset.left - 1 + 'px',
        top: offset.top + $this.innerHeight() + 'px',
        width: $this.innerWidth() + 'px'
      });
      listType.show();
      return false;
    });
    $('body').on('click', function() {
      return listType.hide();
    });
    return true;
  });

}).call(this);

// Generated by CoffeeScript 1.4.0
(function() {

  jQuery(function($) {
    var liTpl, list, listType, max;
    list = $('#form-list');
    max = list.data('max');
    liTpl = list.find('> li:first').detach();
    liTpl.find('input').focus(function() {
      var parent;
      parent = $(this).closest('li');
      if (parent.next().length === 0 && parent.siblings().length + 1 < max) {
        return $(this).closest('li').after(liTpl.clone(true));
      }
    });
    liTpl.find('input').blur(function() {
      var parent;
      parent = $(this).closest('li');
      if (this.value.length === 0 && parent.siblings().length > 0) {
        return parent.remove();
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
      var li, value, _i, _len, _ref, _results;
      _ref = data.list;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        value = _ref[_i];
        li = liTpl.clone(true);
        li.find('input').val(value);
        _results.push(list.append(li));
      }
      return _results;
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

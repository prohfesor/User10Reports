jQuery ($) ->
    $('#types-form li').click ->
        $this = $(this)
        className = $this.data('class');
        $('#' + className + '-form').clearForm().showForm()

    $('body').on 'click', '#types-form li, #editor .widget', ->
        $('#toggle-tab').removeClass('switch').addClass('close')
        $('#edit-tab').show().addClass('active')
        $('#about-tab, #add-widget-tab').hide()


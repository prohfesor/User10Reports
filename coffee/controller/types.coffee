jQuery ($) ->
    $('#types-form li').click ->
        $('#toggle-tab').toggleClass('switch close')
        $('#edit-tab').show().addClass('active')
        $('#about-tab, #add-widget-tab').hide()
        $this = $(this)
        className = $this.data('class');
        $('#' + className + '-form').clearForm().showForm()


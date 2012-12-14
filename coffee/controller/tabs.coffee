jQuery ($) ->

    $('#edit-tab, #share-tab').hide()

    $('#toggle-tab').click ->
        $this = $(this)
        if $this.hasClass('close')
            showTypeForm()
        else
            $('#forms').toggle()
            $('.wrap.edit-page').toggleClass('centered-body')
            $(this).toggleClass('active')

    $('#about-tab').click ->
        $('#about-form').showForm()
        $('#forms').show()
        $('#toggle-tab').addClass('active')

    window.showTypeForm = ->
        $('#toggle-tab').removeClass('close').addClass('switch active')
        $('#about-tab').show().removeClass('active')
        $('#add-widget-tab').show().addClass('active')
        $('#edit-tab').hide()
        $('#types-form').showForm()
        $('#forms').show()

    $('#add-widget-tab').click ->
        showTypeForm()

    $('#add-widget').click ->
        showTypeForm()

    $('#tabs .button').click ->
        $(this).closest('ul').find('.button').removeClass('active')
        $(this).addClass('active')

    $('#share-tab').click ->
        $('#share-form').showForm()


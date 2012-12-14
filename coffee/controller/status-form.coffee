jQuery ($) ->

    dropDown = $('#status-form .drop-down')

    colorBtn = $('#status-form .choose-color a').click ->
        dropDown.toggle()

        return false

    $('body').click ->
        dropDown.hide()

    dropDown.find('li').click ->
        color = $(this).find('input').val()
        colorBtn.attr('class', 'color ' + color)

    $('#status-form').on 'setFormData', (e, data) ->
        colorBtn.attr('class', 'color ' + data.status)

    $('#status-form').on 'clearForm', ->
        colorBtn.attr('class', 'color green')
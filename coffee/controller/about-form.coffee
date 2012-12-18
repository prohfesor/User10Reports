jQuery ($) ->

    caption = $('.main > .caption')

    inp = $('#report-date').DatePicker
        format: 'b d, Y'
        mode: 'range'
        date: new Date()
        calendars: 2
        onChange: (formated, dates) ->
            inp.trigger('set-date', [dates[0], dates[1]])

    $('#about-form input[name=name]').change ->
        caption.find('h1').html(this.value)

    inp.on 'set-date', (e, from, to) ->
        formated = inp.DatePickerFormatDate(from, 'b d, Y - ') + inp.DatePickerFormatDate(to, 'b d, Y')
        inp.val(formated)
        caption.find('.date').html(formated)
        caption.addClass('with-date')
        $('#date_from').val(inp.DatePickerFormatDate(from, 'Y-m-d 00:00:00'))
        $('#date_to').val(inp.DatePickerFormatDate(to, 'Y-m-d 00:00:00'))
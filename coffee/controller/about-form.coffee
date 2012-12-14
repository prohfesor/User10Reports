jQuery ($) ->

    caption = $('.main > .caption')

    inp = $('#report-date').DatePicker
        format: 'b d, Y'
        mode: 'range'
        date: new Date()
        calendars: 2
        onChange: (formated, dates) ->
            inp.val(formated.join(' - '))
            caption.find('.date').html(formated.join(' - '))
            caption.addClass('with-date')
            $('#date_from').val(inp.DatePickerFormatDate(dates[0], 'Y-m-d 00:00:00'))
            $('#date_to').val(inp.DatePickerFormatDate(dates[1], 'Y-m-d 00:00:00'))

    $('#about-form input[name=name]').change ->
        caption.find('h1').html(this.value)

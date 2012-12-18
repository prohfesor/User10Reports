jQuery ($) ->
    $('#publish').click ->
        form = $('#about-form form')
        data = form.getFormData()
        data.blocks = []
        $('#editor > .widget').each ->
            data.blocks.push($(this).data('model').get())

        match = location.href.match(/\/edit\/(\d+)/)
        if match
            data.id = match[1]

        form.find('button').prop('disabled', true)
        $.ajax
            url:  if match then '/update/' + match[1] + '/' else '/create/'
            data: {report: JSON.stringify(data)}
            type: 'POST'
            dataType: 'JSON'
            success: (result) ->
                form.find('button').prop('disabled', false)

                if result.status is 'Success'
                    alert('Your report is created and published')
                    location.href = '/view/' + result.object.id + '/'
                else
                    alert(result.content)

        false
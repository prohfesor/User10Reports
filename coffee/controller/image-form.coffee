jQuery ($) ->

    form = $('#image-form form')
    form.find(':file').change ->
#        this.disabled = true
#        form.find('button').prop('disabled', true)
        form.ajaxSubmit
            url: '/image_upload/'
            dataType: 'JSON'
            success: (result) =>
#                this.disabled = false
#                form.find('button').prop('disabled', false)

                if result.status is 'Success'
                    form.find('input[name=picture]').val(result.content)
                else
                    alert(result.content)


jQuery ($) ->

    $.fn.showForm = () ->
        $('#forms > .side-block').hide()
        this.show()

    $.fn.setFormData = (data) ->
        this.clearForm()

        for name, value of data
            inp = this.find('*[name=' + name + ']')
            if inp.attr('type') is 'radio'
                inp.filter(-> this.value is value).prop('checked', true).trigger('change')
            else
                inp.val(value)

        this.trigger('setFormData', [data])

        return this

    $.fn.getFormData = ->
        data = {}
        this.find(':input').each ->
            return null if this.type is 'radio' and this.checked is false

            if this.name.length > 0
                if this.name.indexOf('[]') > 0
                    if this.value.length > 0
                        name = this.name.replace('[]', '')
                        if name of data
                            data[name].push(this.value)
                        else
                            data[name] = [this.value]
                else
                    data[this.name] = this.value
        return data

    $.fn.setFormModel = (model) ->
        form = this.find('form')
        form = if form.length then form else this
        form.data('model', model)
        return this

    $.fn.getFormModel = ->
        form = this.find('form')
        form = if form.length then form else this
        form.data('model')

    $.fn.clearForm = ->
        this.find('input:text, textarea, select').val('')
        this.find('input[type=radio]:first').prop('checked', true).trigger('change')
        this.setFormModel(null)
        this.trigger('clearForm')

    window.addWidget = (className, data) ->
        return null unless className of widgetMap

        widget = new widgetMap[className].model(data)
        view   = new widgetMap[className].view(widget)
        widget.$node = view.getHtml()
        widget.$node.data('model', widget)

        $('#add-widget').before(widget.$node)

        return widget

    $('#forms form').submit ->
        $this = $(this)
        className = $this.closest('.side-block').attr('id').replace('-form', '')

        return null unless className of widgetMap

        data = $this.getFormData()

        if $this.getFormModel()
            $this.getFormModel().set(data)
        else
            addWidget(className, data)

        $('#types-form').showForm()

        return false

    $('#forms .delete-data').click ->
        return null if confirm('Are you sure?') is no

        widget = $(this).closest('.side-block').getFormModel()
        widget.$node.remove() if widget
        showTypeForm()

        return false

    $('.side-block li').has(':radio').click ->
        $(this).find(':radio').prop('checked', true).trigger('change')

    $('#forms form').has('.chars').find('textarea').keyup ->
        inp = $(this).closest('form').find('.chars span')
        inp.html(inp.data('max') - this.value.length)
        inp.parent().toggleClass('red', inp.data('max') - this.value.length is 0)

    $('body').on 'mouseover', 'li.widget', ->
        hint = $(this).find('.widget-hint')
        if hint.length
            hint.css('right', (200 - hint.innerWidth()) / 2 + 'px')
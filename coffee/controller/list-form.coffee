jQuery ($) ->

    list = $('#form-list')
    max  = list.data('max')
    liTpl = list.find('> li:first').detach()

    addLastInp = ->
        if list.children().length < max
            list.append(liTpl.clone(true))

    liTpl.find('input').focus ->
        parent = $(this).closest('li')
        unless parent.next().length
            addLastInp()

    liTpl.find('input').blur ->
        parent = $(this).closest('li')
        if this.value.length == 0 and parent.next().length > 0
            parent.remove()
            if list.children().last().find('input').val() isnt ''
                addLastInp()

    liTpl.find('input').keydown (e) ->
        if e.keyCode is 13
            parent = $(this).closest('li')
            if parent.next().length
                parent.next().find('input').focus()
            return false

    list.append(liTpl.clone(true))

    $('#list-form input[name=list_type]').change ->
        list.removeClass('square digit').addClass(this.value)
        list.next().removeClass('square digit').addClass(this.value)
        $(this).closest('.input-block').find('li').removeClass('active')
        $(this).closest('li').addClass('active')
        listType.hide()

    $('#status-form input[type=radio]').change ->
        $(this).closest('ul').find('> li').removeClass('active')
        $(this).closest('li').addClass('active')

    $('#list-form').on 'clearForm', ->
        lis = list.find('> li')
        lis.slice(0, lis.length - 1).remove()

    $('#list-form').on 'setFormData', (e, data) ->
        list.empty()
        for value in data.list
            li = liTpl.clone(true)
            li.find('input').val(value)
            list.append(li)
        addLastInp()

    listType = $('#list-type').hide().css('position', 'absolute')

    $('body').on 'click', '#form-list > li', (e) ->
        return null if e.target isnt this

        $this  = $(this)
        offset = $this.offset()
        listType.css
            left:  offset.left - 1 + 'px'
            top:   offset.top + $this.innerHeight()  + 'px'
            width: $this.innerWidth() + 'px'

        listType.show()
        return false

    $('body').on 'click', ->
        listType.hide()

    true
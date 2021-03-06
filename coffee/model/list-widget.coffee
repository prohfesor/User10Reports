class window.ListWidget extends Model
    data:
        id:         0
        report_id:  0
        position:   0
        type:       'list'
        name:       ''
        list:       []
        list_type:  'bullet'
        source:     ''

jQuery ($) ->

    class window.ListView extends View
        html: $('#list-tpl').html()
        template:
            '':
                on: 'click': ->
                    $('#list-form')
                        .setFormModel(this)
                        .showForm()

            '.area':
                html: '@name'

            '.tipsy-inner':
                html: '@source'

            '.widget-hint':
                cssClass:
                    'empty': '@source': (text) -> $.trim(text).length == 0

            'ul':
                onModel:
                    '@list_type': (type, ul) ->
                        ul.removeClass('square digit').addClass(type)

                each:
                    field: 'list'
                    template:
                        'span':
                            html: -> this.valueOf()


class window.CustomWidget extends Model
    data:
        id:        0
        report_id: 0
        order:     0
        type:      'custom'
        name:      ''
        data:      ''
        source:    ''

jQuery ($) ->

    class window.CustomView extends View
        html: $('#custom-tpl').html()
        template:
            '':
                on: 'click': ->
                    $('#custom-form')
                        .setFormModel(this)
                        .showForm()

            '.block-caption':
                html: '@data'

            '.area':
                html: '@name'

            '.tipsy-inner':
                html: '@source'

            '.widget-hint':
                cssClass:
                    'empty': '@source': (text) -> $.trim(text).length == 0

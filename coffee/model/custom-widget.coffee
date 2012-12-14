class window.CustomWidget extends Model
    data:
        id: 0
        report_id: 0
        type: 'custom'
        row: 1
        col: 1
        name:  ''
        data:   ''
        source: ''

jQuery ($) ->

    class window.CustomView extends View
        html: $('#custom-tpl').html()
        template:
            '':
                on:
                    'click': ->
                        $('#custom-form')
                            .setFormData(this.get())
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
class window.QuoteWidget extends Model
    data:
        id:        0
        report_id: 0
        position:  0
        type:      'quote'
        source:    ''
        quote:     ''

jQuery ($) ->
    class window.QuoteView extends View
        html: $('#quote-tpl').html()
        template:
            '':
                on: 'click': ->
                    $('#quote-form')
                        .setFormModel(this)
                        .showForm()

            'p':
                html: '@quote'

            '.area':
                html: '@source'

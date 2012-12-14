class window.QuoteWidget extends Model
    data:
        id: 0
        report_id: 0
        type: 'quote'
        row: 1
        col: 1
        source: ''
        quote:  ''

jQuery ($) ->

    class window.QuoteView extends View
        html: $('#quote-tpl').html()
        template:
            '':
                on: 'click': ->
                    $('#quote-form')
                        .setFormData(this.get())
                        .setFormModel(this)
                        .showForm()

            'span.text':
                html: '@quote'

            '.area':
                html: '@source'

class window.ImageWidget extends Model
    data:
        id: 0
        report_id: 0
        type: 'image'
        row: 1
        col: 1
        caption: ''
        picture: ''
        source: ''

jQuery ($) ->

    class window.ImageView extends View
        html: $('#image-tpl').html()
        template:
            '':
                on: 'click': ->
                    $('#image-form')
                        .setFormData(this.get())
                        .setFormModel(this)
                        .showForm()

                onModel: '@picture': (li, url) ->
                    li.css('background-image', "url(#{url})")

            'p':
                html: '@caption'
                onModel: '@source': (node, text) ->
                    node.attr('title', text).tipsy()

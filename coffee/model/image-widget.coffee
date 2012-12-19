class window.ImageWidget extends Model
    data:
        id:        0
        report_id: 0
        position:  0
        type:      'image'
        caption:   ''
        picture:   ''
        source:    ''

jQuery ($) ->
    class window.ImageView extends View
        html: $('#image-tpl').html()
        template:
            '':
                on: 'click': ->
                    $('#image-form')
                        .setFormModel(this)
                        .showForm()

                style:
                    'background-image': '@picture': (url) -> "url(#{url})"

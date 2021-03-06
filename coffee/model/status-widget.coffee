class window.StatusWidget extends Model
    data:
        id:        0
        report_id: 0
        position:  0
        type:      'status'
        title:     ''
        name:      ''
        status:    ''
        source:    ''

jQuery ($) ->

    class window.StatusView extends View
        html: $('#status-tpl').html()
        template:
            '':
                on: 'click': ->
                    $('#status-form')
                        .setFormModel(this)
                        .showForm()

                cssClass:
                    'green':  '@status': (status) -> status is 'green'
                    'yellow': '@status': (status) -> status is 'yellow'
                    'red':    '@status': (status) -> status is 'red'
                    'grey':   '@status': (status) -> status is 'grey'

            '.block-caption':
                html: '@title'

            '.area':
                html: '@name'

            '.tipsy-inner':
                html: '@source'

            '.widget-hint':
                cssClass:
                    'empty': '@source': (text) -> $.trim(text).length == 0

jQuery ($) ->

    $("#editor").sortable(items: "> li.widget")
    $("#editor").disableSelection()

    $('#about-form').showForm()

    window.widgetMap =
        custom:
            model: CustomWidget
            view:  CustomView
        image:
            model: ImageWidget
            view:  ImageView
        list:
            model: ListWidget
            view:  ListView
        quote:
            model: QuoteWidget
            view:  QuoteView
        status:
            model: StatusWidget
            view:  StatusView


    $('*[title]').tipsy
        gravity: 'n'

    addWidget('custom', {data: 'Click', name: 'to edit data block'})
    addWidget('custom', {data: 'Drag',  name: 'block to re-arrange'})

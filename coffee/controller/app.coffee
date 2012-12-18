jQuery ($) ->

    $("#editor")
        .disableSelection()
        .sortable
            items: "> li.widget"
            update: (e, ui) ->
                $("#editor > li.widget").each (i) ->
                    $(this).data('model').setPosition(i)

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


    $('*[title]').tipsy(gravity: 'n')

    match = location.href.match(/\/edit\/(\d+)/)
    if match
        $.getJSON '/object/' + match[1] + '/', (report) ->
            $('#about-form input[name=name]').val(report.name).change()
            $('#about-form input[name=email]').val(report.user.email).change()
            $('#report-date').trigger('set-date', [new Date(report.date_from), new Date(report.date_to)])

            for block in report.blocks
                data = block.data
                delete block.data
                $.extend(data, block)
                addWidget(block.type, data)
            null
    else
        addWidget('custom', {data: 'Click', name: 'to edit data block'})
        addWidget('custom', {data: 'Drag',  name: 'block to re-arrange'})


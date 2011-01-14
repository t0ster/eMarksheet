class StudiesIndex extends Chester.View
  render: (options) ->
    Ti.API.debug('In views.studies.index.StudiesIndex.render')
    @tab = @parent.parent.container.studies_tab

    table_view = Ti.UI.createTableView({
      data: [
        {title: 'Семестры', hasChild: true, id: 'semestrs'},
        {title: 'Предметы', hasChild: true, id: 'subjects'},
      ]
    })

    table_view.addEventListener('click', (e) =>
      @tab.window.remove(@parent.parent.container.current_view)
      Chester._('app').run({
        controller: "StudiesController",
        action: '_' + e.rowData.id,
      })
    )

    Ti.API.debug("In views.studies.index.StudiesIndex.render:" + @tab)
    # Because this is the first displayed view `current_view` var
    # may not be set yet
    # TODO(t0ster): this should be moved somewhere else
    if @parent.parent.container.current_view
      @tab.window.remove(@parent.parent.container.current_view)
    Ti.API.debug("In views.studies.index.StudiesIndex.render: after remove")
    @tab.window.add(table_view)
    @parent.parent.container.current_view = table_view

Ti.API.debug('In views.studies.index.StudiesIndex.render: registering')
# Register view to Patients Controller
Chester._('app')._("StudiesController").add(new StudiesIndex('studies_index'))

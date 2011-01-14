class StudiesIndex extends Chester.View
  render: (options) ->
    Ti.API.debug('In views.studies.index.StudiesIndex.render')
    @tab = @parent.parent.container.studies_tab

    table_view = Ti.UI.createTableView({
      data: [
        {title: 'Семестры', hasChild: true, id: 'semestrs'},
        {title: 'Предметы', hasChild: true, id: 'studies'},
      ]
    })

    table_view.addEventListener('click', (e) =>
      @tab.window.remove(table_view)
      Chester._('app').run({
        controller: "StudiesController",
        action: '_' + e.rowData.id,
      })
    )

    Ti.API.debug("In views.studies.index.StudiesIndex.render:" + @tab)
    @tab.window.add(table_view)

Ti.API.debug('In views.studies.index.StudiesIndex.render: registering')
# Register view to Patients Controller
Chester._('app')._("StudiesController").add(new StudiesIndex('studies_index'))

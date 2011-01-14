class StudiesIndex extends Chester.View
  render: (options) ->
    tab = @parent.parent.container.studies_tab

    @semestrs_list = Ti.UI.createTableView()
    @semestrs_list.appendRow(Ti.UI.createTableViewRow({
      title: '... Добавить новый семестр ...',
      semestr_id: -1
    }))

    for obj in options.semestrs
      @s_add_row(obj.semestr, @semestrs_list)

    tab.window.add(@semestrs_list)

  #
  # Adds Semestr item to TableView
  #
  s_add_row: (semestr, view) ->
    view_row = Ti.UI.createTableViewRow {
      title: "#{ semestr.start_date } — #{ semestr.end_date }",
      semestr_id: semestr.id
    }
    view.appendRow(view_row)

Chester._('app')._("StudiesController").add(new StudiesIndex('studies_semestrs'))

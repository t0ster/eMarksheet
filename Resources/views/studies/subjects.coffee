class StudiesIndex extends Chester.View
  render: (options) ->
    tab = @parent.parent.container.studies_tab

    @subjects_list = Ti.UI.createTableView()
    @subjects_list.appendRow(Ti.UI.createTableViewRow({
      title: '... Добавить новый предмет ...',
      subject_id: -1
    }))

    for obj in options.subjects
      @s_add_row(obj.subject, @subjects_list)

    tab.window.add(table_view)

  #
  # Adds Subject item to TableView
  #
  s_add_row: (subject, view) ->
    view_row = Ti.UI.createTableViewRow {
      title: subject.shortname,
      subject_id: subject.id
    }
    view.appendRow(view_row)

Chester._('app')._("StudiesController").add(new StudiesIndex('studies_subjects'))

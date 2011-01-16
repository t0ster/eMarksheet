class StudiesSubjectsIndex extends Chester.View
  render: (options) ->
    Ti.API.debug "views.studies.subjects:StudiesSubjectsIndex.render"
    tab = @parent.parent.container.studies_tab

    @subjects_list = Ti.UI.createTableView()
    @subjects_list.appendRow(Ti.UI.createTableViewRow({
      title: '... Добавить новый предмет ...',
      subject_id: -1
    }))

    for obj in options.subjects
      @s_add_row(obj, @subjects_list)

    tab.window.remove(@parent.parent.container.current_view)
    tab.window.add(@subjects_list)
    @parent.parent.container.current_view = @subjects_list

    @subjects_list.addEventListener('click', (e) =>
      Ti.API.debug("views.studies.subjects: e.row = " + JSON.stringify(e.row))
      tab.window.remove(@parent.parent.container.current_view)
      if e.row.subject_id is -1
        @parent.parent.run({
          controller: 'StudiesController',
          action: '_subject_new',
          params: {}
        })
      else
        @parent.parent.run({
          controller: 'StudiesController',
          action: '_subject_edit',
          params: {subject_id: e.row.subject_id}
        })
    )

  #
  # Adds Subject item to TableView
  #
  s_add_row: (subject, view) ->
    Ti.API.debug "subject_id: #{ subject.id }"
    Ti.API.debug "subject_shortname: #{ subject.shortname }"
    Ti.API.debug "subject_name: #{ subject.name }"
    view_row = Ti.UI.createTableViewRow {
      title: "#{ subject.shortname } (#{ subject.group.name })",
      subject_id: subject.id
    }
    view.appendRow(view_row)

Chester._('app')._("StudiesController").add(new StudiesSubjectsIndex('studies_subjects'))

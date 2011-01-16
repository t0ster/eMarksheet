class StudiesSubjectEdit extends Chester.View
  render:  (options) ->
    tab = @parent.parent.container.studies_tab
    tab.window.remove(@parent.parent.container.current_view)
    view = Ti.UI.createView()

    name = Ti.UI.createLabel({
      text: 'Название',
      top: 10,
      left: 30,
      width: 250,
      height: 'auto'
    })
    view.add(name)

    name_field = Ti.UI.createTextField({
      height: 35,
      top: 35,
      left: 30,
      width: 250,
      borderStyle: Ti.UI.INPUT_BORDERSTYLE_ROUNDED,
      value: options.subject.name,
    })
    view.add(name_field)

    shortname = Ti.UI.createLabel({
      text: 'Сокращенное название',
      top: 75,
      left: 30,
      width: 250,
      height: 'auto'
    })
    view.add(shortname)

    shortname_field = Ti.UI.createTextField({
      height: 35,
      top: 100,
      left: 30,
      width: 250,
      borderStyle: Ti.UI.INPUT_BORDERSTYLE_ROUNDED,
      value: options.subject.shortname,
    })
    view.add(shortname_field)

    save = Ti.UI.createButton({
      title: 'Сохранить',
      top: 170,
      left: 30,
      height: 30,
      width: 250
    });
    view.add(save);

    save.addEventListener('click', (e) =>
      tab.window.remove(@parent.parent.container.current_view)
      Chester._('app').run({
        controller: "StudiesController",
        action: '_subject_update',
        params: {
          subject: {
              id: options.subject.id,
              group_id: options.subject.group_id,
              semestr_id: options.subject.semestr_id,
              name: name_field.value,
              shortname: shortname_field.value,
          }
        }
      })
    )

    tab.window.add(view)
    @parent.parent.container.current_view = view


Chester._('app')._("StudiesController").add(new StudiesSubjectEdit('studies_subject_edit'))

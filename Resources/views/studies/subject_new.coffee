class StudiesSubjectNew extends Chester.View
  render:  (options) ->
    Ti.API.debug('In subject_new view render')
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
      borderStyle: Ti.UI.INPUT_BORDERSTYLE_ROUNDED
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
      borderStyle: Ti.UI.INPUT_BORDERSTYLE_ROUNDED
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
      Ti.API.debug('In subject_new view event')
      tab.window.remove(@parent.parent.container.current_view)
      Chester._('app').run({
        controller: "StudiesController",
        action: '_subject_create',
        params: {
          subject: {
              name: name_field.value,
              shortname: shortname_field.value,
              group_id: 2,
              semestr_id: 1,
          }
        }
      })
    )

    tab.window.add(view)
    @parent.parent.container.current_view = view


Chester._('app')._("StudiesController").add(new StudiesSubjectNew('studies_subject_new'))


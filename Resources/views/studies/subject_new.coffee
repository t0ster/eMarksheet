class StudiesIndex extends Chester.View
  render: (options) ->
    tab = @parent.parent.container.studies_tab

    mock = Titanium.UI.createLabel({
      color: '#999',
      text: 'To be done',
      font: {fontSize: 20,fontFamily: 'Helvetica Neue'},
      textAlign: 'center',
      width: 'auto'
    })
    tab.window.remove(@parent.parent.container.current_view)
    tab.window.add(mock)
    @parent.parent.container.current_view = mock


Chester._('app')._("StudiesController").add(new StudiesIndex('studies_subject_new'))

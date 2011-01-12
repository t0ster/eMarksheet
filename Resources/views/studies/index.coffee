class StudiesIndex extends Chester.View
  render: (options) ->
    Ti.API.debug('In views.studies.index.StudiesIndex.render')
    tab = @parent.parent.container.studies_tab

    mock = Titanium.UI.createLabel({
      color: '#999',
      text: 'I am Studies Window',
      font: {fontSize: 20,fontFamily: 'Helvetica Neue'},
      textAlign: 'center',
      width: 'auto'
    })

    Ti.API.debug("In views.studies.index.StudiesIndex.render:" + tab)
    tab.window.add(mock)

Ti.API.debug('In views.studies.index.StudiesIndex.render: registering')
# Register view to Patients Controller
Chester._('app')._("StudiesController").add(new StudiesIndex('studies_index'))

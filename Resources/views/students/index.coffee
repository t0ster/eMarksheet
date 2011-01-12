class StudentsIndex extends Chester.View
  render: (options) ->
    tab = @parent.parent.container.students_tab
    Ti.API.debug("In views.students.index.StudentsIndex.render: tab = " + tab)

    mock = Titanium.UI.createLabel({
      color: '#999',
      text: 'I am Students Window',
      font: {fontSize: 20,fontFamily: 'Helvetica Neue'},
      textAlign: 'center',
      width: 'auto'
    })
    tab.window.add(mock)

Ti.API.debug("In views.students.index.StudentsIndex.render: registering")
# Register view to Patients Controller
Chester._('app')._("StudentsController").add(new StudentsIndex('students_index'))

class StudentsController extends Chester.Controller
  _index: (params) ->
    Ti.API.debug('In controllers.students_controller.StudentsController._index')
    @find('students_index').render params

  _new: (params) ->
    #TODO NEW VIEW

  _create: (params) ->
    #TODO NEW VIEW


# Register Controller to application
Chester._('app').add(new StudentsController('StudentsController'))

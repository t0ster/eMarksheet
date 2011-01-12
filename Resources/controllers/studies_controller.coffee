class StudiesController extends Chester.Controller
  _index: (params) ->
    Ti.API.debug('In controllers.studies_controller.StudiesController._index')
    @find('studies_index').render params

  _new: (params) ->
    #TODO NEW VIEW

  _create: (params) ->
    #TODO NEW VIEW


# Register Controller to application
Chester._('app').add(new StudiesController('StudiesController'))

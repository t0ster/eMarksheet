class StudiesController extends Chester.Controller
  _index: (params) ->
    @find('studies_index').render params

  _semestrs: (params) ->
    params.semestrs = @parent.Models._('Semestr')._all()
    @_('studies_semestrs').render params

  _subjects: (params) ->
    params.subjects = @parent.Models._('Subject')._all()
    @_('studies_subjects').render params

  _new: (params) ->
    #TODO NEW VIEW

  _create: (params) ->
    #TODO NEW VIEW


# Register Controller to application
Chester._('app').add(new StudiesController('StudiesController'))

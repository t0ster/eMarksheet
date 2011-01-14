class StudiesController extends Chester.Controller
  _index: (params) ->
    @find('studies_index').render params

  _semestrs: (params) ->
    params.semestrs = @parent.Models._('Semestr')._all()
    @_('studies_semestrs').render params

  _subjects: (params) ->
    params.subjects = @parent.Models._('Subject')._all()
    @_('studies_subjects').render params

  _subject_create: (params) ->
    params.project = @parent.Models._('Subject')._create params.subject
    @find('studies_subjects').render params
    # if params.subject.errors
    #   @find('studies_subjects').render params
    # else
    #   Ti.API.debug 'Add to List'
    #   @find('subjects').add_subject(params.subject)
    #   Ti.API.debug 'Render Show'
    #   @find('show').render params

  _create: (params) ->
    #TODO NEW VIEW


# Register Controller to application
Chester._('app').add(new StudiesController('StudiesController'))

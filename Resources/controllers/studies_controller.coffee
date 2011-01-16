class StudiesController extends Chester.Controller
  _index: (params) ->
    @find('studies_index').render params

  _semestrs: (params) ->
    params.semestrs = models.Semestr.all()
    @_('studies_semestrs').render params

  _subjects: (params) ->
    subjects = models.Subject.all()
    for subject in subjects
      subject.group = models.Subject.get_group(subject)
    params.subjects = subjects
    @_('studies_subjects').render params

  _subject_new: (params) ->
    Ti.API.debug('In _subject_new controller')
    @_('studies_subject_new').render params

  _subject_create: (params) ->
    Ti.API.debug('In _subject_create controller')
    subject = models.Subject.newRecord(params.subject)
    subject.save()
    @_subjects({})
    # if params.subject.errors
    #   @find('studies_subjects').render params
    # else
    #   Ti.API.debug 'Add to List'
    #   @find('subjects').add_subject(params.subject)
    #   Ti.API.debug 'Render Show'
    #   @find('show').render params

  _subject_update: (params) ->
    joli.connection.execute("UPDATE 'subject' SET name='#{ params.subject.name }', shortname='#{ params.subject.shortname }' WHERE id=#{ params.subject.id }")
    @_subjects({})

  _subject_edit: (params) ->
    params.subject = models.Subject.findOneById(params.subject_id)
    @find('studies_subject_edit').render params


# Register Controller to application
Chester._('app').add(new StudiesController('StudiesController'))

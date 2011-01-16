models.Subject = new joli.model({
  table: 'subject',
  columns: {
    id: 'INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE',
    semestr_id: 'INTEGER NOT NULL',
    group_id: 'INTEGER NOT NULL',
    name: 'TEXT NOT NULL',
    shortname: 'TEXT NOT NULL',
  },
  methods: {
    # This shit doesn't work as expected
    get_semestr: () ->
      semestr = joli.models.get('semestr').findOneById(@semestr_id)
      "#{ semestr.start_date } -- #{ semestr.end_date }"
    get_group: () ->
      joli.models.get('group_').findOneById(@group_id).name
  }
})
models.Subject.get_group = (subject) ->
  models.Group.findOneById(subject.group_id)

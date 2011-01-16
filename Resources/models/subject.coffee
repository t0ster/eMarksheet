Subject = new joli.model({
  table: 'subject',
  columns: {
    id: 'INTEGER',
    semestr_id: 'INTEGER',
    name: 'TEXT',
    shortname: 'TEXT',
  },
  methods: {
    semestr: () ->
      joli.models.get('semestr').findById(@semestr_id)
  }
})

# Chester._('app').Models.add(new Subject('Subject'))

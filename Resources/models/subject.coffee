class Subject
  constructor: (name) ->
    @name = name
    @db = Ti.Database.open('emark')
    @db.execute('CREATE TABLE IF NOT EXISTS "subject"
                 (id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
                 semestr_id INTEGER NOT NULL REFERENCES semestr (id)
                   ON DELETE CASCADE ON UPDATE CASCADE,
                 name TEXT NOT NULL,
                 shortname TEXT NULL)')
    # Load fixtures
    @db.execute('INSERT INTO "subject" VALUES(1,1,"СТАУ","СТАУ")')

  _all: ->
    @subjects = []
    rows = @db.execute('SELECT * FROM "subject"')
    @p_add_to_subjects(rows) while (rows.isValidRow())
    rows.close()
    @subjects

  _find_by_id: (id) ->
    # Get model record by id

  _create: (subject) ->
    @db.execute('INSERT INTO "subject" (semestr_id, name) VALUES (1, ?)', subject.name)
    return {
      id: @db.lastInsertRowId,
      semestr_id: 1,
      name: subject.name,
      shortname: subject.shortname
    }

  p_add_to_subjects: (rows) ->
    @subjects[@subjects.length] = {
      subject: {
        id: rows.fieldByName('id'),
        semestr_id: rows.fieldByName('semestr_id'),
        name: rows.fieldByName('name'),
        shortname: rows.fieldByName('shortname')
      }
    }
    rows.next()

  # Insert your code here

Chester._('app').Models.add(new Subject('Subject'))

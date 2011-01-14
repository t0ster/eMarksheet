class Semestr
  constructor: (name) ->
    @name = name
    @db = Ti.Database.open('emark')
    # TODO(t0ster): Better we should use some javascript ORM that
    #               will handle this automatically
    @db.execute('CREATE TABLE IF NOT EXISTS "semestr" (
                 id INTEGER  PRIMARY KEY AUTOINCREMENT,
                 start_date DATE   NOT NULL,
                 end_date DATE   NOT NULL,
                 starts_from_first_week BOOLEAN   NOT NULL  DEFAULT "1"
                 )')

    # Load fixtures
    # TODO(t0ster): Should be extracted to method
    @db.execute('INSERT INTO "semestr" VALUES(1,"2011-02-01","2011-06-30",1)')

    Ti.API.debug 'Opened Database!'

  _all: ->
    @semestrs = []
    # Get All Records
    rows = @db.execute('SELECT * FROM "semestr"')
    @p_add_to_semestrs(rows) while (rows.isValidRow())
    rows.close()
    @semestrs

  _find_by_id: (id) ->
    # Get model record by id
  _create: (semestr) ->
    # create Record

  p_add_to_semestrs: (rows) ->
    @semestrs[@semestrs.length] = {
      semestr: {
        id: rows.fieldByName('id'),
        start_date: rows.fieldByName('start_date'),
        end_date: rows.fieldByName('end_date'),
        starts_from_first_week: rows.fieldByName('starts_from_first_week')
      }
    }
    rows.next()

Chester._('app').Models.add(new Semestr('Semestr'))

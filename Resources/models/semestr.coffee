class Semestr
  constructor: (name) ->
    @name = name
    @db = Ti.Database.open('emark')
    @db.execute('CREATE TABLE IF NOT EXISTS "semestr" (
                 id INTEGER  PRIMARY KEY AUTOINCREMENT,
                 start_date DATE   NOT NULL,
                 end_date DATE   NOT NULL,
                 starts_from_first_week BOOLEAN   NOT NULL  DEFAULT "1"
                 )')
    Ti.API.info 'Opened Database!'

  _all: ->
    @semestrs = []
    # Get All Records
    rows = @db.execute('SELECT * FROM "subject"')
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

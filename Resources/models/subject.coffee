class Subject
  constructor: (name) ->
    @name = name

  _all: ->
    # Get All Records
  _find_by_id: (id) ->
    # Get model record by id
  _create: (subject) ->
    # create Record

  # Insert your code here

Chester._('app').Models.add(new Subject('Subject'))

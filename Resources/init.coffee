# Include MVC Framework
Ti.include 'chester.js'
Ti.include 'libs/joli.js/joli.js'

Ti.include 'container.js'

# Register Controllers
Ti.include 'controllers/students_controller.js'
Ti.include 'controllers/studies_controller.js'

# Register Models
this.models = {}
joli.connection = new joli.Connection('emark.db')
Ti.include 'models/group.js'
Ti.include 'models/semestr.js'
Ti.include 'models/subject.js'
joli.models.initialize()

# Register Views
Ti.include 'views/studies/index.js'
Ti.include 'views/studies/semestrs.js'
Ti.include 'views/studies/subjects.js'
Ti.include 'views/studies/subject_new.js'
Ti.include 'views/studies/subject_edit.js'
Ti.include 'views/students/index.js'

# Fixtures (Loading dummy data)
Ti.API.debug "Before fixture run"
Ti.API.debug "Semestrs count: #{ models.Semestr.count()}"

joli.connection.execute('DROP TABLE "semestr"')
joli.connection.execute('DROP TABLE "subject"')
joli.connection.execute('DROP TABLE "group_"')
joli.models.initialize()
Ti.API.debug "Cleared tables"

if models.Semestr.count() is 0

  Ti.API.debug "Runing fixtures"
  semestr = models.Semestr.newRecord({
    start_date: '2011-02-01',
    end_date: '2011-06-30',
    starts_from_first_week: 1
  })
  semestr.save()
  semestr = models.Semestr.findOneById(joli.connection.lastInsertRowId())
  Ti.API.debug "Created semestr"

  group_ia61 = models.Group.newRecord({
    name: 'ИА-61'
  })
  group_ia61.save()
  group_ia62 = models.Group.newRecord({
    name: 'ИА-62'
  })
  group_ia62.save()
  group_ia63 = models.Group.newRecord({
    name: 'ИА-63'
  })
  group_ia63.save()
  Ti.API.debug "Created groups"
  Ti.API.debug "Groups count: #{ models.Group.count() }"

  group_ia62 = models.Group.findOneBy('name', 'ИА-62')
  subject = models.Subject.newRecord({
    semestr_id: semestr.id,
    group_id: group_ia62.id,
    name: 'Современная Теория Автоматического Управления',
    shortname: 'СТАУ',
  })
  subject.save()
  subject = models.Subject.findOneBy('name', 'СТАУ')
  Ti.API.debug "Subject name: #{ subject.name }"
  Ti.API.debug "Subject group: #{ subject.group_id }"
  # Ti.API.debug "Subject semestr: #{ subject.get_semestr() }"
  Ti.API.debug "Subject group: #{ models.Subject.get_group(subject).name }"
  Ti.API.debug "Fixtures OK"

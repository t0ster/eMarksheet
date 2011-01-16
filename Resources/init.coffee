# Include MVC Framework
Ti.include 'chester.js'
Ti.include 'libs/joli.js/joli.js'

Ti.include 'container.js'

# Register Controllers
Ti.include 'controllers/students_controller.js'
Ti.include 'controllers/studies_controller.js'

# Register Models
joli.connection = new joli.Connection('emark.db')
Ti.include 'models/semestr.js'
Ti.include 'models/subject.js'
joli.models.initialize()

# Register Views
Ti.include 'views/studies/index.js'
Ti.include 'views/studies/semestrs.js'
Ti.include 'views/studies/subjects.js'
Ti.include 'views/studies/subject_new.js'
Ti.include 'views/students/index.js'

# Fixtures
Ti.API.debug "Before fixture run"
Ti.API.debug "Semestrs count: #{ joli.models.get('semestr').count() is 0 }"
if joli.models.get('semestr').count() is 0
  Ti.API.debug "Runing fixtures"
  semestr = joli.models.get('semestr').newRecord({
    start_date: '2011-02-01',
    end_date: '2011-06-30',
    starts_from_first_week: 1
  })
  semestr.save()
  subject = joli.models.get('subject').newRecord({
    semestr_id: semestr.id,
    name: 'СТАУ',
    shortname: 'СТАУ',
  })
  subject.save()
  Ti.API.debug "Fixtures OK"

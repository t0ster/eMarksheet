# Load all files
Ti.include 'init.js'

Chester._('app').container = new AppContainer()

# Proccess StudiesController on startup
Chester._('app').run({
  controller: 'StudiesController',
  action: '_index',
  params: { start: 1 }
})

Ti.API.debug('In app. Before open window')
Chester._('app').container.w.open()
Ti.API.debug('In app. After open window')

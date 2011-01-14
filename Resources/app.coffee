# Load all files
Ti.include 'init.js'

Chester._('app').container = new AppContainer()
default_tab = Chester._('app').container.default_tab

# Proccess default tab Controller on startup
Chester._('app').run({
  controller: "#{ default_tab.id }Controller",
  action: '_index',
  params: { start: 1 }
})

Ti.API.debug('In app. Before open window')
Chester._('app').container.w.open()
Ti.API.debug('In app. After open window')

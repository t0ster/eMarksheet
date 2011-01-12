class AppContainer
  constructor:  ->
    @w = Ti.UI.createTabGroup()  # Base Widget

    @studies_window = Titanium.UI.createWindow({
        title: 'Studies',
        backgroundColor: '#fff'
    })
    @studies_tab = Titanium.UI.createTab({
        icon: 'KS_nav_views.png',
        title: 'Studies',
        window: @studies_window
    })

    @students_window = Titanium.UI.createWindow({
        title: 'Students',
        backgroundColor: '#fff'
    })
    @students_tab = Titanium.UI.createTab({
        icon: 'KS_nav_views.png',
        title: 'Students',
        window: @students_window
    })

    @w.addTab(@studies_tab)
    @w.addTab(@students_tab)

    @w.addEventListener('focus', (e) =>
      Ti.API.debug('Clicked on ' + e.tab.title)
    )

root = exports ? this
root.AppContainer = AppContainer

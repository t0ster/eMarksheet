class AppContainer
  constructor:  ->
    @w = Ti.UI.createTabGroup()  # Base Widget

    @studies_window = Titanium.UI.createWindow({
        title: 'Studies',
        backgroundColor: '#fff'
    })
    @studies_tab = Titanium.UI.createTab({
        icon: 'KS_nav_views.png',
        title: 'Предметы',
        id: 'Studies',
        window: @studies_window
    })

    @students_window = Titanium.UI.createWindow({
        title: 'Students',
        backgroundColor: '#fff'
    })
    @students_tab = Titanium.UI.createTab({
        icon: 'KS_nav_views.png',
        title: 'Студенты',
        id: 'Students',
        window: @students_window
    })

    @w.addTab(@studies_tab)
    @w.addTab(@students_tab)
    @default_tab = @studies_tab

    # Run SomeController.index every time some controller gets focus
    @w.addEventListener('focus', (e) =>
      Ti.API.debug("Clicked on #{ e.tab.title }")
      Chester._('app').run({
        controller: "#{ e.tab.id }Controller",
        action: '_index',
        params: { start: 1 }
      })
    )

root = exports ? this
root.AppContainer = AppContainer

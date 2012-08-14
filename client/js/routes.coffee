class NavigationMenu
	# Wrapper for path.js API that updates the navigation menu automatically
	# Unfortunately, Path.map(...).enter(...) does not allow us to access
	# the 'this.path' property, hence why this uses custom code.
	map: (route) ->
		to: (action) ->
			Path.map(route).to ->
				updateNavMenu.apply(this)
				action.apply(this)

	updateNavMenu = ->
		$(".nav .active").removeClass("active")
		$('.nav [href="' + this.path + '"]').parent().addClass("active")

class Router
	nav = new NavigationMenu

	defineRoutes: ->
		Path.root("/")

		nav.map("/").to ->
			# Do nothing

		nav.map("/about").to ->
			alert("About")

		nav.map("/contact").to ->
			alert("Contact")

		Path.rescue ->
			alert("404: Page Not Found")

	# Route all link clicks through PathJS
	rerouteAllHyperlinks: ->
		$("body").on "click", "a", (event) ->
			event.preventDefault()

			Path.history.pushState {}, "", $(this).attr("href")

Meteor.startup ->
	router = new Router
	router.defineRoutes()
	router.rerouteAllHyperlinks()
	# Activate Path.js routing
	Path.history.listen()
	# Initialise with current location
	Path.history.pushState {}, "", window.document.location.pathname

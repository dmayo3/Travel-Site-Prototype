# Configure and setup: routing, history and link handling
#
# All other routes are defined automatically by classes in the controllers
# directory. This script must be loaded after the controllers, which meteor
# will do because the controllers are in a subdirectory.

Meteor.startup ->

	mainRoutes = ->
		Path.root("/")

		Path.rescue ->
			alert("404: Page Not Found")

	rerouteAllHyperlinks = ->
		$("body").on "click", "a", (event) ->
			event.preventDefault()
			
			url = $(this).attr("href")

			if url
				Path.history.pushState {}, "", url

	mainRoutes()
	rerouteAllHyperlinks()

	# Activate path.js routing
	Path.history.listen()

	# Initialise page with current location
	Path.history.pushState {}, "", window.document.location.pathname

# Configure and setup: routing, history and link handling
#
# All other routes are defined automatically by classes in the controllers
# directory. This script must be loaded after the controllers, which meteor
# will do because the controllers are in a subdirectory.

Meteor.startup ->

	mainRoutes = ->
		Path.root("/")

		Path.rescue ->
			Views.notFound()

	rerouteHyperlinks = ->
		$("body").on "click", "a", (event) ->		
			url = $(this).attr("href")

			relativeUrl = /^\/.*/ # Starts with #

			if url && url.match(relativeUrl)
				event.preventDefault()
				Views.redirectTo(url)

	mainRoutes()
	rerouteHyperlinks()

	# Activate path.js routing
	Path.history.listen()

	# Initialise page with current location
	Views.redirectTo(window.document.location.pathname)

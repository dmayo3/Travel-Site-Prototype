# Helper function used by controllers
#map = (route, action) ->
#	BaseController.map.call(this, route, action)

# Simple base controller class built atop the path.js routing library
class BaseController

	constructor: ->
		# This must be defined by the subclass
		@requests()

	map: (route, action) ->
		controller = this
		Path.map(route).to ->
			request = this
			process.call(controller, request, action)

	process = (request, action) ->
		view = action(request)

		if view
			Views.display(view)
			# Trigger a page change event
			$(window.location).triggerHandler("change", request.path)

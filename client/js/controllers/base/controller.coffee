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
		# Call before method if defined by subclass
		if @before
			@before(request)

		view = action(request)

		if view
			switchTo(view)

	switchTo = (page) ->
		# TODO error handling
		liveHtml = Meteor.ui.render ->
			Session.get("render")
			Template[page]()

		Meteor.defer ->
			$(".main.container").html(liveHtml)
			Session.set("currentPage", page)

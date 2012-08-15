class NavigationController extends BaseController
	
	before: (request) ->
		updateNavMenu(request.path)

	requests: ->

		@map "/", ->
			"chooseDestination"

		@map "/about", ->
			"about"

		@map "/contact", ->
			"contact"

	updateNavMenu = (path) ->
		$(".nav .active").removeClass("active")
		$(".nav [href='#{path}']").parent().addClass("active")

new NavigationController

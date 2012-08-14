class NavigationController extends BaseController
	
	before: (request) ->
		updateNavMenu(request.path)

	requests: ->

		@map "/", ->
			"chooseDestination"

		@map "/about", ->
			alert("About")
			false

		@map "/contact", ->
			alert("Contact")
			false

	updateNavMenu = (path) ->
		$(".nav .active").removeClass("active")
		$(".nav [href='#{path}']").parent().addClass("active")

new NavigationController

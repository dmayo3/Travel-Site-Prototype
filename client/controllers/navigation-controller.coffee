class NavigationController extends BaseController

	requests: ->

		@map "/", ->
			Views.redirectTo("/destinations/find")
			false

		@map "/about", ->
			"about"

		@map "/contact", ->
			"contact"

new NavigationController

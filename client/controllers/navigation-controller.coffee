class NavigationController extends BaseController

	requests: ->

		@map "/", ->
			Views.redirectTo("/destinations")
			false

		@map "/about", ->
			"about"

		@map "/contact", ->
			"contact"

new NavigationController

class FindHolidayDestinationsController extends BaseController
	
	requests: ->

		@map "/destinations/find", ->
			"findHolidayDestinations"

		@map "/destinations/categories/:category", (request) ->
			category = request.params["category"]

			filter = {}
			filter.categories = {$exists: true}
			filter["categories.#{category}"] = true

			Template.listDestinations.destinations = ->
				Destinations.find(filter)
			
			Template.listDestinations.category = ->
				category
			
			"listDestinations"

new FindHolidayDestinationsController

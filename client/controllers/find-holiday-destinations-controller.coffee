class FindHolidayDestinationsController extends BaseController
	
	requests: ->

		@map "/destinations/find", ->
			"findHolidayDestinations"

		@map "/destinations/categories/:category", (request) ->
			category = Categories.findOne({urlId: request.params["category"]})

			if !category? 
				Views.notFound()
				return false

			Template.listDestinations.destinations = ->
				DestinationService.listBy(category)

			Template.listDestinations.category = ->
				category.label
			
			"listDestinations"

new FindHolidayDestinationsController

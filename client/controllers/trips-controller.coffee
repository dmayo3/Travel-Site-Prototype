class TripsController extends BaseController

	requests: ->

		@map "/trips/new/for-destination/:destinationId", (request) ->
			Template.newTrip.destination = ->
				Destinations.findOne({_id: request.params["destinationId"]})

			"newTrip"

new TripsController

class TripsController extends BaseController

	requests: ->

		@map "/trips/new/for-destination/:destinationId", ->
			"newTrip"

new TripsController

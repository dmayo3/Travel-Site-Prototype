class DestinationController extends BaseController
	
	requests: ->

		@map "/create-destination", ->
			"chooseDestination"

		@map "/destination/new/:destination/photo/:id", (request) ->
			# TODO error handling
			Template.newDestination.photo = ->
				Photos.findOne({"photo.id": request.params["id"]})

			Template.newDestination.destination = ->
				decodeURIComponent(request.params["destination"])

			"newDestination"

		@map "/destination/:id", (request) ->
			Template.viewDestination.destination = ->
				DestinationService.get(request.params["id"])

			"viewDestination"

		@map "/destinations", ->
			Template.listDestinations.destinations = ->
				Destinations.find({})

			Template.listDestinations.category = ->
				false
			
			"listDestinations"

new DestinationController

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
				if destinationsLoaded()
					return getDestination(request.params["id"])
				else
					return null

			"viewDestination"

		@map "/destinations", ->
			Template.listDestinations.destinations = ->
				getAllDestinations()
			
			"listDestinations"

	# TODO move to service
	destinationsLoaded = ->
		Session.get("destinationsLoaded") == true

	getAllDestinations = ->
		if destinationsLoaded()
			return Destinations.find({})
		else
			return null

	getDestination = (id) ->
		Destinations.findOne({_id: id})

new DestinationController

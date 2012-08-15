class DestinationController extends BaseController
	
	requests: ->

		@map "/destination/new/:destination/photo/:id", (request) ->
			Template.newDestination.photo = ->
				Photos.findOne({"photo.id": request.params["id"]})

			Template.newDestination.destination = ->
				decodeURIComponent(request.params["destination"])

			"newDestination"

		@map "/destination/:id", (request) ->
			destination = Destinations.findOne({_id: request.params["id"]})

			if destination
				console.log("Found destination " + request.params["id"])
				console.log("Destination: " + destination.name)
			
			# placeholder
			Path.history.pushState {}, "", "/"

			false

new DestinationController

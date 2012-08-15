class DestinationController extends BaseController
	
	requests: ->

		@map "/destination/new/:destination/photo/:id", (request) ->
			# TODO error handling
			Template.newDestination.photo = ->
				Photos.findOne({"photo.id": request.params["id"]})

			Template.newDestination.destination = ->
				decodeURIComponent(request.params["destination"])

			"newDestination"

		@map "/destination/:id", (request) ->
			# TODO error handling
			destination = Destinations.findOne({_id: request.params["id"]})

			if !destination
				Views.notFound()

			Template.viewDestination.destination = ->
				destination

			"viewDestination"

new DestinationController

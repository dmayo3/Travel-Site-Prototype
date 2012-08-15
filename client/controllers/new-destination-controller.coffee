class NewDestinationController extends BaseController
	
	requests: ->

		@map "/destination/new/:destination/photo/:id", (request) ->
			Template.newDestination.photo = ->
				Photos.findOne({"photo.id": request.params["id"]})

			Template.newDestination.destination = ->
				decodeURIComponent(request.params["destination"])

			"newDestination"

new NewDestinationController

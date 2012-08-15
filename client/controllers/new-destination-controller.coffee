class NewDestinationController extends BaseController
	
	requests: ->

		@map "/new-destination/photo/:id", (request) ->
			Template.newDestination.photo = ->
				Photos.findOne({"photo.id": request.params["id"]})

			"newDestination"

new NewDestinationController

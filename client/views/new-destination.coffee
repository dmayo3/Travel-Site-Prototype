Template.newDestination.events =
	'submit .new-destination': (event) ->
		event.preventDefault()
		
		destination =
			name: Template.newDestination.destination()
			photo: Template.newDestination.photo()
			description: $("#description").val().substr(0, 2000)

		id = DestinationService.create(destination)

		# Need some sort of a wrapper for this!
		Path.history.pushState {}, "", "/destination/#{id}"

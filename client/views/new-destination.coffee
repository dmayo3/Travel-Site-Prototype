Template.newDestination.events =
	'submit .new-destination': (event) ->
		event.preventDefault()
		
		destination =
			destination: Template.newDestination.destination()
			photo: Template.newDestination.photo()
			description: $("#description").val().substr(0, 2000)

		console.log("Create destination: " + destination)
		#DestinationService.create(destination)

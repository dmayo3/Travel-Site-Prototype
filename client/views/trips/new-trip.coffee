Template.newTrip.events = 
	'submit .new-trip': (event) ->
		event.preventDefault()
		trip = $(".new-trip").serializeObject()
		TripService.create(Template.newTrip.destination(), trip)

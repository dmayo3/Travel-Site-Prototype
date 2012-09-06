class TripService
	
	@create: (destination, trip) ->
		criteria = { _id: destination._id }
		
		modification =
			$push:
				trips: { trip: trip }

		Destinations.update(criteria, modification)

		Views.redirectTo("/destination/#{destination._id}")

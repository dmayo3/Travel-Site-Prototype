class TripService
	
	@create: (destination, trip) ->
		Destinations.update( {_id: destination._id}, { $push: { trips: trip }} )

		Views.redirectTo("/destination/#{destination._id}")

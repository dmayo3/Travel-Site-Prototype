Meteor.startup ->
	Migrations.run()

class Migrations

	@fixTrips: ->
		criteria =
			trips: {$exists: true}
			"trips.trip": {$exists: false}

		cursor = Destinations.find(criteria)

		cursor.forEach (destination) ->
			# Wrap all trip objects in another object with a 'trip' property
			destination.trips = _.map destination.trips, (trip) ->
				{trip: trip}

			Destinations.update({_id: destination._id}, destination)

	@run: ->
		Migrations.fixTrips()

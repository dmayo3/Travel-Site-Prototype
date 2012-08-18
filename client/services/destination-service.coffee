class DestinationService
	
	@create: (destination) ->
		id = Destinations.insert(destination)

		ApiService.call "findLocation", destination.name, (geocodingResult) ->
			# If result is for a valid location, update destination record
			if geocodingResult.countrycode != 'ZZ'
				Destinations.update({_id: id}, {$set : { location : geocodingResult }})

		return id

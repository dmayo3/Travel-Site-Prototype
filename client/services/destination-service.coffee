class DestinationService
	
	@create: (destination) ->
		id = Destinations.insert(destination)

		ApiService.call "findLocation", destination.name, (geocodingResult) ->
			# If result is for a valid location, update destination record
			if geocodingResult.countrycode != 'ZZ'
				Destinations.update({_id: id}, {$set : { location : geocodingResult }})

		return id

	@get: (id) ->
		destination = Destinations.findOne({_id: id})

		if destination
			destination.costEstimates = getCostEstimatesFor(destination)

		destination

	getCostEstimatesFor = (destination) ->
		currency = "&euro;"
		flights = getFlightCostEstimateFor(destination)
		accommodation = getAccommodationCostEstimateFor(destination)

		costEstimates =
			flights:
				cost: flights
				unit: currency
			accommodation:
				cost: accommodation
				unit: currency
			total:
				cost: flights + accommodation
				unit: currency

	getFlightCostEstimateFor = (destination) ->
		if destination.trips?
			averagePrice(trip.flightPrice for trip in destination.trips)
		else 0

	getAccommodationCostEstimateFor = (destination) ->
		if destination.trips?
			averagePrice(trip.accommodationPrice for trip in destination.trips)
		else 0

	averagePrice = (priceData) ->
		validPriceData = _.reject priceData, (data) -> !data
		numericPrices = _.map validPriceData, (numString) -> parseInt(numString)
		average(numericPrices)

	average = (numbers) ->
		total = _.reduce numbers, (sum, n) -> sum + n

		total / numbers.length

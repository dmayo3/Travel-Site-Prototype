class GeocodingApi
	
	@search: (query) ->
		endPoint = "http://where.yahooapis.com/geocode"

		apiKey = "dj0yJmk9S2U5MWEwTVdiRFluJmQ9WVdrOWNYQTBjMDAyTjJrbWNHbzlNakUxTXpRME1qWXkmcz1jb25zdW1lcnNlY3JldCZ4PTc0"

		parameters =
			appid: apiKey
			location: query
			flags: "JQ" # JSON format + include nearest airport info

		response = Meteor.http.get endPoint, {params: parameters, timeout: 10000}

		if response.statusCode == 200 && response.data && response.data.ResultSet.Found >= 1
			results = response.data.ResultSet.Results
			return results[0]

Meteor.methods
	findLocation: (query) ->
		this.unblock()
		GeocodingApi.search(query)

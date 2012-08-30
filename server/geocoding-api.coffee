class GeocodingApi
	
	@search: (apiKey, query) ->
		endPoint = "http://where.yahooapis.com/geocode"

		parameters =
			appid: apiKey
			location: query
			flags: "JQ" # JSON format + include nearest airport info

		response = Meteor.http.get endPoint, {params: parameters, timeout: 10000}

		if response.statusCode == 200 && response.data && response.data.ResultSet.Found >= 1
			results = response.data.ResultSet.Results
			return results[0]

DeployConfig.get "geocodingApiKey", (key) ->
	Meteor.methods
		findLocation: (query) ->
			this.unblock()
			GeocodingApi.search(key, query)

# DEPRECATED. Use ApiService instead
class GeocodingApi

	@findLocation: (query, callback) ->
		Meteor.call "findLocation", query, (error, result) ->
			if error
				throw {
					message: "Could not retrieve geocoding location"
					"error": error
				}

			callback result

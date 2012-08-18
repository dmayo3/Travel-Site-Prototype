class ApiService

	@call: (service, query, callback) ->
		Meteor.call service, query, (error, result) ->
			if error
				throw {
					message: "Error calling #{service} with query: #{query}"
					"error": error
				}

			callback result

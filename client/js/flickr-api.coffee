class PhotoApi

	search: (query, callback) ->
		Meteor.call "searchPhotos", query, (error, result) ->
			if error
				throw {
					message: "Could not retrieve photos"
					"error": error
				}

			callback new Photos(result.list)

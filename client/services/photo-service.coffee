class PhotoService
	
	@displayPhotos: (query) ->
		Session.set("loadingPhotos", true)

		PhotoApi.search(query, processPhotos)

	processPhotos = (photos) ->
		# Replace existing photos
		Photos.remove({})

		_.each photos, (photo) ->
			Photos.insert(photo)

		Session.set("loadingPhotos", false)

class PhotoApi
	licenses =
		attribution: 4
		noDerivatives: 6
		shareAlike: 5
		unrestricted: 7

	privacyPublic = 1
	safeSearch = 1
	photosOnly = 1

	endPoint = "http://api.flickr.com/services/rest/"

	defaultParameters =
		method: "flickr.photos.search"
		api_key: "ce0df84cb253ea9614b4e11c65c03d73"
		license: [licenses.attribution, licenses.noDerivatives, licenses.shareAlike, licenses.unrestricted].join()
		sort: "interestingness-desc",
		privacy_filter: privacyPublic
		safe_search: safeSearch
		content_type: photosOnly
		format: "json"
		nojsoncallback: 1
		extras: "owner_name"
		per_page: 12

	search: (query) ->
		parameters = _.extend defaultParameters, {text: query}
		
		result = Meteor.http.get endPoint, {params: parameters, timeout: 5000}

		if !responseOK(result)
			console.log("Could not fetch images from Flickr")
			console.log(result)
			throw {
				"message": "Could not fetch images from Flickr"
				"result": result
			}

		parse(result.data)

	responseOK = (result) ->
		result.statusCode == 200 && result.data && result.data.stat && result.data.stat == "ok"

	parse = (response) ->
		photos = []

		_.each response.photos.photo, (photo) ->
			size = "n"

			imageUrl = "http://farm" + photo.farm +
				".static.flickr.com/" + photo.server + "/" +
				photo.id + "_" + photo.secret + "_" + size + ".jpg"
			
			photos.push
				photo:
					id: photo.id
					link: "http://www.flickr.com/photos/" + photo.owner + "/" + photo.id
					title: photo.title
					url: imageUrl
					owner: photo.ownername

		photos

api = new PhotoApi

Meteor.methods
	searchPhotos: (query) ->
		this.unblock()
		api.search(query)

class PhotoApi
	licenses =
		attribution: 4
		noDerivatives: 6
		shareAlike: 5
		unrestricted: 7

	privacyPublic = 1
	safeSearch = 1

	endPoint = "http://api.flickr.com/services/rest/"

	defaultParameters =
		method: "flickr.photos.search"
		api_key: "ce0df84cb253ea9614b4e11c65c03d73"
		license: [licenses.attribution, licenses.noDerivatives, licenses.shareAlike, licenses.unrestricted].join()
		sort: "interestingness-desc",
		privacy_filter: privacyPublic
		safe_search: safeSearch
		content_type: 1
		format: "json"
		extras: "owner_name"
		per_page: 12

	search: (query, callback) ->
		parameters = $.extend defaultParameters, {text: query}
		
		requestUri = endPoint + "?" + $.param(parameters) + "&jsoncallback=?"
		
		$.getJSON requestUri, (response) ->
			callback(parse(response))

	parse = (response) ->
		if (response.stat != "ok")
			# TODO some kind of error handling!
			return []

		results = []

		$.each response.photos.photo, (i, photo) ->
			size = "n"

			imageUrl = "http://farm" + photo.farm +
				".static.flickr.com/" + photo.server + "/" +
				photo.id + "_" + photo.secret + "_" + size + ".jpg"
			
			results.push
				photo:
					id: photo.id
					link: "http://www.flickr.com/photos/" + photo.owner + "/" + photo.id
					title: photo.title
					url: imageUrl
					owner: photo.ownername

		new Photos(results)

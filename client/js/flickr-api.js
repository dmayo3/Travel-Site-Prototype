function displayPhotos(search) {
	Meteor.defer(function() {
		$('#loadingPhotos').show();
	});

	var licenses = {
		"attribution": 4,
		"noDerivatives": 6,
		"shareAlike": 5,
		"unrestricted": 7
	};

	var privacyPublic = 1;
	var safeSearch = 1;

	var endPoint = "http://api.flickr.com/services/rest/";

	var parameters = {
		"method": "flickr.photos.search",
		"api_key": "ce0df84cb253ea9614b4e11c65c03d73",
		"text": search,
		"license": [licenses.attribution, licenses.noDerivatives, licenses.shareAlike, licenses.unrestricted].join(),
		"sort": "interestingness-desc",
		"privacy_filter": privacyPublic,
		"safe_search": safeSearch,
		"content_type": 1,
		"format": "json",
		"extras": "owner_name",
		"per_page": 12
	};

	var requestUri = endPoint + "?" + $.param(parameters) + "&jsoncallback=?"

	$.getJSON(requestUri, processFlickrResponse);
}

function processFlickrResponse(response) {
	if (response.stat != "ok"){
		// TODO some kind of error handling!
		return;
	}

	var photos = [];

	$.each(response.photos.photo, function(i, photo) {
		var size = "n";

		var imageUrl = "http://farm" + photo.farm
			+ ".static.flickr.com/" + photo.server + "/"
			+ photo.id + "_" + photo.secret + "_" + size + ".jpg";
		
		photos.push({
			"photo": {
				"id": photo.id,
				"link": "http://www.flickr.com/photos/" + photo.owner + "/" + photo.id,
				"title": photo.title,
				"url": imageUrl,
				"owner": photo.ownername
			}
		});
	});

	remember(photos);
	render(photos);
}

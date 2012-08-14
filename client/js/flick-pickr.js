Meteor.startup(function() {
	photoApi = new PhotoApi();

	displayPhotos("beautiful beaches");
});

Photos = new Meteor.Collection(null);

Session.set("loadingPhotos", true);

Template.flickrImages.photos = function() {
	var photos = Photos.find({});
	console.log(photos);
	return photos;
};
Template.chooseDestination.loadingPhotos = function() {
	return Session.get("loadingPhotos");
};

Meteor.autosubscribe(function() {
	var page = Session.get("currentPage");
	var loading = Session.get("loadingPhotos");
	
	if (page == "chooseDestination" && loading === false) {
		Meteor.defer(function() {
			PhotoDisplay.show();
		});
	}
});

Template.chooseDestination.events = {
	'submit .choose-destination': function(event) {
		event.preventDefault();
		var search = $("#destination").val().substr(0, 50);
		displayPhotos(search);
	}
};

function displayPhotos(query) {
	Session.set("loadingPhotos", true);

	photoApi.search(query, processPhotos);
}

function processPhotos(photos) {
	// Replace existing photos
	Photos.remove({});

	_.each(photos, function(photo) {
		Photos.insert(photo);
	});

	Session.set("loadingPhotos", false);
}

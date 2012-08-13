Meteor.startup(function() {
	photoApi = new PhotoApi();

	displayPhotos("beautiful beaches");
});

Template.chooseDestination.events = {
	'submit .choose-destination': function(event) {
		event.preventDefault();
		var search = $("#destination").val().substr(0, 50);
		displayPhotos(search);
	}
};

function displayPhotos(query) {
	Meteor.defer(function() {
		$('#loadingPhotos').show();
	});

	photoApi.search(query, processPhotos);
}

function processPhotos(photos) {
	window.photos = photos;

	PhotoDisplay.show(photos);
}

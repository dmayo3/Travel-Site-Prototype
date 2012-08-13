Template.chooseDestination.events = {
	'submit .choose-destination': function(event) {
		event.preventDefault();
		displayPhotos($("#destination").val().substr(0, 50));
	}
};

$(document).ready(function() {
	displayPhotos("beautiful beaches");

	$("body").on("click", ".photo-link", photoClicked);
});

function photoClicked() {
	var id = $(this).attr("id");
	var photo = getPhotoInfo(id);
	if (photo) {
		render([{"photo": photo}]);
	}
	return false;
}

function remember(photos) {
	window.photos = photos;
}

function getPhotoInfo(id) {
	var element = findOne(photos, function(element) {
		return element.photo.id === id;
	});
	if (element) {
		return element.photo;
	} else {
		return null;
	}
}

function findOne(array, filter) {
	var results = $.grep(array, filter);
	if (results && results.length === 1) {
		return results[0];
	} else {
		return null;
	}
}

function render(photos) {
	var liveHtml = Meteor.ui.render(function () {
		return Template.flickrImages({"photos": photos});
	});
	Meteor.defer(function() {
		$(".images").html(liveHtml);
		$('.thumbnails').imagesLoaded(applyMasonryEffect);
	});
}

function applyMasonryEffect() {
	var thumbnails = this;

	Meteor.defer(function() {
		thumbnails.show();

		thumbnails.masonry({
			itemSelector: '.photo-container',
			columnWidth: function(containerWidth) {
				return containerWidth / 4;
			}
		});

		$('#loadingPhotos').hide();
	});
}

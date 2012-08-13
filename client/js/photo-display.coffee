class PhotoDisplay
	@show: (photos) ->
		liveHtml = Meteor.ui.render ->
			Template.flickrImages(photos)

		Meteor.defer ->
			$(".images").html(liveHtml)
			$('.thumbnails').imagesLoaded(applyMasonryEffect)

	applyMasonryEffect = () ->
		thumbnails = this

		Meteor.defer ->
			thumbnails.show()

			thumbnails.masonry
				itemSelector: '.photo-container'
				columnWidth: (containerWidth) ->
					containerWidth / 4;

			$('#loadingPhotos').hide()

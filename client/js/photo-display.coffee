class PhotoDisplay
	@minPortraitTabletSize = 768 #px

	@show: (photos) ->
		liveHtml = Meteor.ui.render ->
			Template.flickrImages(photos)

		Meteor.defer ->
			$(".images").html(liveHtml)

			if window.screen.width >= @minPortraitTabletSize
				displayAction = showPhotos withMasonryLayout
			else
				displayAction = showPhotos withFluidLayout

			$('.thumbnails').imagesLoaded(displayAction)

	showPhotos = (layoutFunction) ->
		# Return function that wraps layoutFunction
		->
			thumbnails = this
			thumbnails.show()
			layoutFunction(thumbnails)
			$('#loadingPhotos').hide()

	withFluidLayout = ->
		# No-op

	withMasonryLayout = (thumbnails) ->
		thumbnails.masonry
			itemSelector: '.photo-container'
			columnWidth: (containerWidth) ->
				containerWidth / 4;

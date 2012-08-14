class PhotoDisplay
	@minPortraitTabletSize = 768 #px

	@show: ->
		if window.document.documentElement.clientWidth >= PhotoDisplay.minPortraitTabletSize
			displayAction = showPhotos withMasonryLayout
		else
			displayAction = showPhotos withFluidLayout

		$('.thumbnails').imagesLoaded(displayAction)

	showPhotos = (layoutFunction) ->
		# Return function that wraps layoutFunction
		->
			thumbnails = this
			this.show()
			layoutFunction(thumbnails)

	withFluidLayout = ->
		# No-op

	withMasonryLayout = (thumbnails) ->
		thumbnails.masonry
			itemSelector: '.photo-container'
			columnWidth: (containerWidth) ->
				containerWidth / 4;

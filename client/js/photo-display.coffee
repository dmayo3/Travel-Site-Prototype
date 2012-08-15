class PhotoDisplay
	@minPortraitTabletSize = 768 #px

	# Display photos with the correct layout
	@show: ->
		if window.document.documentElement.clientWidth >= PhotoDisplay.minPortraitTabletSize
			displayAction = showPhotos withMasonryLayout
		else
			displayAction = showPhotos withFluidLayout

		$('.thumbnails').imagesLoaded(displayAction)

	# Runs in context of the thumbnails container
	showPhotos = (layoutFunction) ->
		# Return function that wraps layoutFunction
		->
			@show()
			layoutFunction.apply(this)

	withFluidLayout = ->
		# No-op

	# Runs in context of the thumbnails container
	withMasonryLayout = ->
		@masonry()
			itemSelector: '.photo-container'
			columnWidth: (containerWidth) ->
				containerWidth / 4;

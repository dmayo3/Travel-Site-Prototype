Template.flickrImages.photos = ->
	Photos.find({})

Template.flickrImages.applyLayout = ->
	# This is hack that gets called when the images are loaded into view
	Meteor.defer ->
		PhotoDisplay.show()

	# Return empty string to render inside the view template
	""

Template.listDestinations.applyPhotoLayout = ->
	if !Session.get("loadingDestinations")
		Meteor.defer ->
			PhotoDisplay.show()

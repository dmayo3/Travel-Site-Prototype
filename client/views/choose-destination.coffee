Meteor.startup ->
	PhotoService.displayPhotos("beautiful beaches")

Template.chooseDestination.loadingPhotos = ->
	Session.get("loadingPhotos")

Template.chooseDestination.events =
	'submit .choose-destination': (event) ->
		event.preventDefault()
		search = $("#destination").val().substr(0, 50)
		PhotoService.displayPhotos(search)

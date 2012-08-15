Meteor.startup ->
	PhotoService.displayPhotos("beautiful beaches")

Template.chooseDestination.loadingPhotos = ->
	Session.get("loadingPhotos")

# TODO this is a placeholder
Template.photoForDestination.destination = ->
	"unknown"

Template.chooseDestination.events =
	'submit .choose-destination': (event) ->
		event.preventDefault()
		search = $("#destination").val().substr(0, 50)
		PhotoService.displayPhotos(search)

		Template.photoForDestination.destination = ->
			search

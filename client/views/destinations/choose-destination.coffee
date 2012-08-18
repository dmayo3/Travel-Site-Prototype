Template.chooseDestination.loadingPhotos = ->
	Session.get("loadingPhotos")

Template.chooseDestination.events =
	'submit .choose-destination': (event) ->
		event.preventDefault()
		search = $("#destination").val().substr(0, 50)
		PhotoService.displayPhotos(search)

		Template.photoForDestination.destination = ->
			search

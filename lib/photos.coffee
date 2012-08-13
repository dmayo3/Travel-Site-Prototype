class Photos
	constructor: (@list) ->

	photos: ->
		@list

	get: (id) ->
		_.find @list, (element) ->
			element.photo.id == id

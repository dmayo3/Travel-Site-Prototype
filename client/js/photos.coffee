class Photos
	constructor: (@list) ->

	photos: ->
		@list

	get: (id) ->
		findOne @list, (element) ->
			element.photo.id == id

	findOne = (array, filter) ->
		results = $.grep(array, filter)
		if results && results.length == 1
			results[0]
		else
			null

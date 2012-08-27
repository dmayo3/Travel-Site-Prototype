Template.destinationCategories.allCategories = ->
	Categories.find({})

Template.category.checked = ->
	categoryId = this.id

	this.categories?[categoryId]

Template.destinationCategories.events =
	"submit .categories": (event) ->
		event.preventDefault()

		categories = {}

		$(".category input").each (i, checkbox) ->
			categories[$(checkbox).attr("id")] = $(checkbox).is(":checked")
			true

		destinationId = this._id
		Destinations.update {_id: destinationId}, {$set: {categories: categories}}

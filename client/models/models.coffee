Photos = new Meteor.Collection(null)
Categories = new Meteor.Collection(null)

class Category
  constructor: (@label) ->
  	# For use in object property names
  	@id = label.toLowerCase().replace(/&/g, "and").replace(/[^A-Za-z]+/g, "_")
  	# For use in urls
  	@urlId = @id.replace(/_/g, "-")

Meteor.startup ->
	# Clear out old categories in case they have changed
	Categories.remove()

	Categories.insert new Category("Sun, Sea & Sand")
	Categories.insert new Category("Culture")
	Categories.insert new Category("Adventure")
	Categories.insert new Category("Sports & Activity")
	Categories.insert new Category("Sightseeing")
	Categories.insert new Category("Nature")
	Categories.insert new Category("Romance")
	Categories.insert new Category("Food & Drink")

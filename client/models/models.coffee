Photos = new Meteor.Collection(null)
Categories = new Meteor.Collection(null)

class Category
  constructor: (@label, @attribution) ->
  	# For use in object property names
  	@id = label.toLowerCase().replace(/&/g, "and").replace(/[^A-Za-z]+/g, "_")
  	# For use in urls
  	@urlId = @id.replace(/_/g, "-")
  	@icon = @urlId + ".png"

# Create holiday categories
Meteor.startup ->
	# Clear out old categories in case they have changed
	Categories.remove()

	# Icon attributions
	visualpharm = {url: "http://www.visualpharm.com", name: "visualpharm"}
	iconka = {url: "http://www.iconka.com/ ", name: "iconka"}
	iconsland = {url: "http://www.icons-land.com/", name: "icons-land"}
	iconfinder = {url: "http://www.iconfinder.net/", name: "iconfinder"}

	Categories.insert new Category("Sun, Sea & Sand", visualpharm)
	Categories.insert new Category("Culture", iconka)
	Categories.insert new Category("Adventure")
	Categories.insert new Category("Sports & Activity", visualpharm)
	Categories.insert new Category("Sightseeing", iconsland)
	Categories.insert new Category("Nature", iconfinder)
	Categories.insert new Category("Romance")
	Categories.insert new Category("Food & Drink")

# Code for this helper comes from the Treehouse Blog: http://teamtreehouse.com/blog/handlebars-js-part-3-tips-and-tricks

Handlebars.registerHelper "debug", (optionalValue) ->
	console.log("Current Context")
	console.log("====================")
	console.log(this)

	if optionalValue
		console.log("Value")
		console.log("====================")
		console.log(optionalValue)

# Handlebars block helper to enumerate properties in an object
Handlebars.registerHelper "eachProperty", (context, options) ->

	content = for key, value of context
		options.fn({key: key, value: value})

	content.join("")

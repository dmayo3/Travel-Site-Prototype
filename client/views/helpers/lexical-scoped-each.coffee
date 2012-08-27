# An each helper that inherits the parent context as well (lexical scoping)
# The properties of each element override any properties in the parent context
# of the same name.

# This involves some hackery / proxying so might not work in future versions!

originalEachHelper = Handlebars._default_helpers.each

lexicalEachHelper = (iterable, options) ->
	
	parentContext = this

	# Creates functions that invoke the callback with the extended context
	proxyWithExtendedContext = (callback) ->
		(context) ->
			extendedContext = _.extend {}, parentContext, context
			callback(extendedContext)

	# Proxy the original rendering functions
	options.fn = proxyWithExtendedContext(options.fn)
	options.inverse = proxyWithExtendedContext(options.inverse)

	originalEachHelper.call(this, iterable, options)

Handlebars._default_helpers.each = lexicalEachHelper

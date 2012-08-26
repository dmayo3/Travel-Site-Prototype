# Partials with parameters!
# Thanks to http://zachsnow.com/#!/blog/2012/handlebarsjs/

Handlebars.registerHelper "partial", (template, options) ->
  # Find the partial in question.
  partial = Template[template]
  
  # Extend the current context
  context = _.extend({}, this, options.hash)
  
  # Render, marked as safe so it isn't escaped.
  new Handlebars.SafeString(partial(context))

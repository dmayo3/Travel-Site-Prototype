class Views

	@display: (page) ->
		Meteor.defer ->
			# TODO handle page not found
			liveHtml = Meteor.ui.render ->
				Template[page]()

			$(".main.container").html(liveHtml)

	@notFound: ->
		Views.display("notFound")

	@redirectTo: (url) ->
		Path.history.pushState {}, "", url

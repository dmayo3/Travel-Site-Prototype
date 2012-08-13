$ ->
	$("body").on "click", ".photo-link", ->

		id = $(this).attr("id")

		photo = photos.get(id)

		if photo
			PhotoDisplay.show(new Photos([photo]))

		false

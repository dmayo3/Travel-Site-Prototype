$ ->
	$("body").on "click", ".photo-link", ->

		id = $(this).attr "id"

		photo = photos.get(id)

		if photo
			render(new Photos([photo]))

		false

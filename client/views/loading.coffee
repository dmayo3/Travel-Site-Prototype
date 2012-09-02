Template.loading.loading = ->
	if Session.get("loadingPhotos") then return { resources: "Photos" }
	if Session.get("loadingDestinations") then return { resources: "Destinations" }

	return false

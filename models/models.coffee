Destinations = new Meteor.Collection("destinations")

Session.set("loadingDestinations", true)

if Meteor.is_server
	Meteor.publish "destinations", ->
		Destinations.find({})
	Destinations.allow
		insert: -> true
		update: -> true
		remove: -> true
else
	Meteor.subscribe "destinations", ->
		Session.set("loadingDestinations", false)

Destinations = new Meteor.Collection("destinations")

if Meteor.is_server
	Meteor.publish "destinations", ->
		Destinations.find({})
	Destinations.allow
		insert: -> true
		update: -> true
		remove: -> true
else
	Meteor.subscribe "destinations", ->
		Session.set("destinationsLoaded", true)

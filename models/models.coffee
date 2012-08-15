Destinations = new Meteor.Collection("destinations")

if Meteor.is_server
	Meteor.publish "destinations", ->
		Destinations.find({})
else
	Meteor.subscribe "destinations"

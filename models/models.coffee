Destinations = new Meteor.Collection("destinations")

if Meteor.is_server
	Meteor.publish("destinations")
else
	Meteor.subscribe("destinations")

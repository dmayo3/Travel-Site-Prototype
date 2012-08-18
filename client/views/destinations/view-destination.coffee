Template.showTweets.tweets = ->
	destination = Template.viewDestination.destination()

	if destination
		# Get cached results
		tweets = Session.get("tweets-#{destination.name}")
		if tweets
			return tweets
		else
			# Populate session cache
			ApiService.call "searchTweets", destination.name, (twitterResults) ->
				Session.set("tweets-#{destination.name}", twitterResults)

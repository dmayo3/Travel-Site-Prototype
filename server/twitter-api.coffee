class TwitterApi
	
	@search: (query) ->
		endPoint = "http://search.twitter.com/search.json"

		parameters =
			q: query
			result_type: "mixed"
			rpp: 5 # results per page

		response = Meteor.http.get endPoint, {params: parameters, timeout: 10000}

		console.log("Got twit response")
		console.log("Status code:" + response.statusCode)
		console.log("Content: " + response.content)

		if response.statusCode == 200 && response.data && response.data.results.length > 0
			return response.data.results
		else
			return []


Meteor.methods
	searchTweets: (query) ->
		this.unblock()
		TwitterApi.search(query)

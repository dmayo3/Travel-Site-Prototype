$ ->
	$(window.location).bind "change", (event, path) ->
		$(".nav .active").removeClass("active")
		$(".nav [href='#{path}']").parent().addClass("active")

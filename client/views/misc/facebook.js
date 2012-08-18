Template.facebookAPI.loadJS = function() {
	Meteor.defer(function() {
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) return;
			js = d.createElement(s); js.id = id;
			js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	});
};

Template.facebookComments.thisPageURL = function() {
	return document.location.href;
};

Template.facebookComments.render = function() {
	Meteor.defer(function() {
		 FB.XFBML.parse();
	});
};

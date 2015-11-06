var UserLogin = Backbone.Model.extend({
  		url: '/api/login/',
  		paramRoot: 'user',
  		defaults: {
			"password": ""
  		},
  		validate: function (attrs) {
	        if (attrs.email === undefined && attrs.username === "") {
	        	console.log(attrs.email === undefined);
	        	console.log(attrs.username === "");
	            return 'Please provide an email or username.';
	        }

	        if (attrs.email) {
	        	if (attrs.email.indexOf('@') === -1 || attrs.email.indexOf('@') === (attrs.email.length - 1)) {
	        		return 'Please provide a valid email address';
	        	}
	        }
	        if (!attrs.password) {
	            return 'Please provide a password';
	    	}
    	}
});

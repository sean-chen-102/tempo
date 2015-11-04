var UserRegistration = Backbone.Model.extend({
    	url: '/api/users/',
    	paramRoot: 'user',

    	defaults: {
    		"user" : {
    			"name": "",
      			"email": "",
      			"username": "",
      			"password": "",
      			"password_confirmation": ""
    		}
    	}
});

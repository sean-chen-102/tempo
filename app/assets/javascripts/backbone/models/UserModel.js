var User = Backbone.Model.extend({
  		url: '/users/',
  		paramRoot: 'user',
  		defaults: {
    		"email": "",
    		"username": "",
    		"id": "",
    		"interests": "",
    		"password": ""
  		}
});
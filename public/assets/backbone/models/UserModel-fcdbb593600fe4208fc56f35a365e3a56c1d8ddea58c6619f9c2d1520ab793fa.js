var User = Backbone.Model.extend({
  		url: '/api/users/',
  		paramRoot: 'user',
  		defaults: {
    		"email": "",
    		"username": "",
    		"id": "",
    		"interests": "",
    		"password": "",
    		"name" : ""
  		}
});

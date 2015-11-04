var UserLogin = Backbone.Model.extend({
  		url: '/api/login/',
  		paramRoot: 'user',
  		defaults: {
			"password": ""
  		}
});
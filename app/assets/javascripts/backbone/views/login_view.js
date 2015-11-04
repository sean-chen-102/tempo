var LoginView = Backbone.View.extend({
		el: ".testDiv",
		tagName : 'div',
		options: null,
		events:{
        	"click .login-submit":"login",
        	"click .create": "create"
    	},
		initialize: function(options){
			this.model = new UserLogin();

		},
		render : function (options){
			console.log("render login");
			var that = this;
			//TODO: Move template to separate page, custom welcome name
			//populate the home_template with times collection
			var home_template = JST["backbone/templates/unauthenticated/login"]({
    	    });
        	this.$el.html(home_template);
		},
		login : function(options){
			console.log("attempting login");
			//called when the go button is clicked

			var usernameOrEmail = $('#username-or-email').val();

			var password = $('#password').val();
			if(usernameOrEmail.indexOf('@') === -1) {
				this.model.attributes.username = usernameOrEmail;
			} else {
				this.model.attributes.email = usernameOrEmail;
			}
			this.model.attributes.password = password
			console.log(this.model.attributes);
		    this.model.save(this.model.attributes, {
	      		success: function(userSession, response) {
	      			console.log("success!");
	      			Cookies.set("login-token", response.token);
	      			console.log(response);
	      			Backbone.Events.trigger("user-interests", [response.user.interests, response.user.id]);
	      			Backbone.history.navigate('home', {trigger: true});  
	      },
	      error: function(userSession, response) {
	      	console.log("failure!");
	      }
	    });
		},
		create : function(options) {
			Backbone.history.navigate('signup', {trigger: true}); 
		}
	});
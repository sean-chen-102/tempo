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
			this.loginDetails = {}

		},
		render : function (options){
			console.log("render login");
			this.model = new UserLogin();
			var that = this;
			//TODO: Move template to separate page, custom welcome name
			//populate the home_template with times collection
			var home_template = JST["backbone/templates/unauthenticated/login"]({
    	    });
        	this.$el.html(home_template);
        	$("input").keyup(function(e) {
        		if (e.which == 13) {
    				that.login(options);
  				}
			});

		},
		login : function(options){
			console.log("attempting login");
			//called when the go button is clicked

			var usernameOrEmail = $('#username-or-email').val();

			var password = $('#password').val();
			this.loginDetails.username = usernameOrEmail
			this.loginDetails.password = password;
		    this.model.save(this.loginDetails, {
	      		success: function(userSession, response) {
	      			if (response.status === 1 ) {
	      				console.log("success!");
	      				Cookies.set("login-token", response.token);
	      				Backbone.Events.trigger("user-interests", [response.user.interests, response.user.id]);
	      				Backbone.history.navigate('home', {trigger: true}); 
	      			} else {
	      				notie.alert(3, response.errors[0], 1.5);
	      			}
	        },
	        error: function(userSession, response) {
	      	  console.log("failure!");
	        }
	        });
		    if (this.model.validationError) {
		    	notie.alert(3, "please enter a username and password", 1.5);
  		    // validate error(s) accessible in model.validationError
		    }
		},
		create : function(options) {
			Backbone.history.navigate('signup', {trigger: true}); 
		}
	});
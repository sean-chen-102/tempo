var HomeView = Backbone.View.extend({
		el: ".testDiv",
		tagName : 'div',
		options: null,
		events:{
        	"click .go-btn":"makeGoRequest",
        	"click .login-submit":"login"
    	},
		initialize: function(options){
			this.options = options;

			this.times = new Times(null, {
	            view: this
	        });

	        this.model = new UserLogin();
			//TODO: Find better way to do this
			//add all the times we want the user to  be able to select
	        this.times.add(new Time({duration: "5"}));
	        this.times.add(new Time({duration: "15"}));
	        this.times.add(new Time({duration: "30"}));
	        this.times.add(new Time({duration: "60"}));
		},
		render : function (options){
			console.log("render home");
			var that = this;
			//TODO: Move template to separate page, custom welcome name
			//populate the home_template with times collection
			var home_template = JST["backbone/templates/activities/home"]({
            	times: that.times.toJSON(),
            	labelValue: 'Times'
    	    });
        	this.$el.html(home_template);
		},
		makeGoRequest : function(options){
			//called when the go button is clicked
			var index = $('#time-selector')[0].selectedIndex;
			var duration = this.times.models[index].get('duration');
			//save duration to activity view object
			App.Views['activityView'].time = duration;
			//switch view to activities view
			window.location = '/tempo#activities';
		},
		login : function(options){
			console.log("hi");
			//called when the go button is clicked
			var username = $('#username-login').val();
			var password = $('#password-login').val();
			this.model.attributes.username = username;
			this.model.attributes.password = password
			console.log(this.model.attributes);
		    this.model.save(this.model.attributes, {
	      		success: function(userSession, response) {
	      			console.log("success!");
	      			console.log(userSession);
	      			console.log(response);
	      			Cookies.set("login-token", response.token);
	      			Backbone.Events.trigger("user-interests", [response.user.interests, response.user.id]);
	      			alert("you successfully logged in!");
	      },
	      error: function(userSession, response) {
	      	console.log("failure!");
	      }
	    });
		}
	});
var SignupView = Backbone.View.extend({
		el: ".testDiv",
		tagName : 'div',

	  events: {
	    'submit form': 'signup'
	  },

	  initialize: function() {
	  	console.log("signup init");
	    this.model = new UserRegistration();
	  },

	  render: function() {
	    console.log("render signup");
			var that = this;
			var signup_template = JST["backbone/templates/unauthenticated/signup"];
    	    console.log(signup_template);
        	this.$el.html(signup_template);
		},

	  signup: function(e) {

	    var self = this,
	        el = $(this.el);

	    e.preventDefault();


	    el.find('input.btnprimary').prop('value', 'loading');

	    this.model.attributes.user.username = $('#username').val();
	    this.model.attributes.user.name = $('#name').val();
	    this.model.attributes.user.email = $('#email').val();
	  	//TODO validation for form on the front end
	    this.model.attributes.user.password = $('#password').val();
	    this.model.attributes.user.password_confirmation = $('#password').val();
	    console.log(this.model.attributes);
	    this.model.save(this.model.attributes, {
	      success: function(userSession, response) {
	      	console.log("success!");
	      	console.log(userSession);
	      	console.log(response);
	        el.find('input.btnprimary').prop('value', 'reset');
	        currentUser = new User(response);
	      },
	      error: function(userSession, response) {
	      	console.log("failure!");
	        var result = $.parseJSON(response.responseText);
	        el.find('form').prepend(BD.Helpers.Notifications.error("Unable to complete signup."));
	        _(result.errors).each(function(errors,field) {
	          $('#'+field+'_group').addClass('error');
	          _(errors).each(function(error, i) {
	            $('#'+field+'_group .controls').append(BD.Helpers.FormHelpers.fieldHelp(error));
	          });
	        });
	        el.find('input.btnprimary').button('reset');
	      }
	    });
	  }
	});

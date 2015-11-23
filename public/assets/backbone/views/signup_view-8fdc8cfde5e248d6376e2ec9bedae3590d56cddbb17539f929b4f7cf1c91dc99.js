var SignupView = Backbone.View.extend({
		el: ".testDiv",
		tagName : 'div',

	  events: {
	    'click #signup': 'signup'
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
        	$("#password").keyup(function() {
	  			if ($("#password").val().length < 8) {
	  				$("#password-error").css("visibility", "visible");
	  			} else {
	  				$("#password-error").css("visibility", "hidden");
	  			}
			});
			$("#password_confirmation").keyup(function() {
	  			if ($("#password").val() === $("#password_confirmation").val() 
	  				|| $("#password_confirmation").val().length == 0) {
	  				$("#password-confirmation-error").css("visibility", "hidden");
	  			} else {
	  				$("#password-confirmation-error").css("visibility", "visible");

	  			}
			});
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
	      	if (response.status === 1) {
	      		el.find('input.btnprimary').prop('value', 'reset');
		        currentUser = new User(response);
	  			Cookies.set("login-token", response.user.token);
	  			Backbone.history.navigate('home', {trigger: true});
  			} else {
  				notie.alert(3, response.errors[0], 1.5);
  			}
	      },
	      error: function(userSession, response) {
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

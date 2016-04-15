// Creating View for Interests
var SettingsView = Backbone.View.extend({
	el: ".testDiv",
	tagName : 'div',
	options: null,
	events:{
    	"click #submit-interests":"saveInterests",
    	"click #change-password" : "changePassword",
	},
	renderData : function(data){
		var that = this;
		//Iterate throught he collections of Activities and create a template
		var numInterests = 0;
		data.each(function(model){
			var checked = "";
			if (that.userInterests.indexOf(model.get('name')) > -1) { 
				checked = "checked";
			}
			that.templateData.push({"name": model.get("name"), "checked" : checked, "index": numInterests})
			numInterests += 1
		});
		that.numInterests = numInterests;
	   	var template = JST["backbone/templates/activities/settings"]({
			data: that.templateData,
    	});
        this.$el.html(template);
        $("#new-password").keyup(function() {
  			if ($("#new-password").val().length < 8) {
  				$("#new-password-error").css("visibility", "visible");
  			} else {
  				$("#new-password-error").css("visibility", "hidden");
  			}
  			if ($("#new-password-confirmation").val().length > 0){
	  			if ($("#new-password").val() === $("#new-password-confirmation").val()) {
	  				$("#new-password-confirmation-error").css("visibility", "hidden");
	  			} else {
	  				$("#new-password-confirmation-error").css("visibility", "visible");
	  			}
  			}
		});
		$("#new-password-confirmation").keyup(function() {
  			if ($("#new-password").val() === $("#new-password-confirmation").val()) {
  				$("#new-password-confirmation-error").css("visibility", "hidden");
  			} else {
  				$("#new-password-confirmation-error").css("visibility", "visible");

  			}
		});
    },
	initialize: function(options){
		console.log("settings initialize called");
		this.userInterests = [];
		this.templateData = [];
		this.user = null;
		this.options = options;
		this.numInterests = 0;
	},
	saveInterests : function(options) {
		var that = this;
		var newInterests = []
		for (var j = 0; j < that.numInterests; j++) {
			var currInterest = $('#interest-' + j);
			var name = currInterest.attr('name')
			if (currInterest.is(":checked")) {
				newInterests.push(name);
			}
		}
		var interest = new Interest();
		interest.url = "/api/users/" + this.user.id + "/interests";
		var token = Cookies.get('login-token');
		interest.attributes = {id:this.user.id, interests:newInterests, token:token};
		interest.save(interest.attributes, {
      		success: function(userSession, response) {
      			console.log("Saved Interest");
      			if (response.status === 1) {
      				notie.alert(1, 'Interests Saved!', 1.5);
      			} else {
      				notie.alert(3, response.errors[0], 1.5);
      			}
      		},
      		error: function(userSession, response) {
      			console.log("failed to save interest");
      			notie.alert(3, 'Interests could not be saved.', 1.5);
      		}
    	});
    },
	getUserInterests : function(){
		// Fetches the user interests from the database
		var interests = new Interests();
		interests.url = "/api/users/" + this.user.id + "/interests";
		var token = Cookies.get('login-token');
		interests.url += "?token=" + token;
		var that = this;
		interests.fetch({
			success: function(data){
				that.userInterests = [];
				data.each(function(model){
					that.userInterests.push(model.get('name'));
				});
				that.getInterests();
			}
		});
	},
	changePassword : function() {
		var oldPassword = $("#old-password").val();
		var newPassword = $("#new-password").val();

		if (newPassword === $("#new-password-confirmation").val()){
			var passwordChange = new PasswordChange();
			passwordChange.url = "/api/users/" + this.user.id + "/change_password";
			var token = Cookies.get('login-token');
			passwordChange.attributes = {id:this.user.id, old_password: oldPassword, new_password: newPassword, token:token};
			passwordChange.save(passwordChange.attributes, {
	      		success: function(userSession, response) {
	      			console.log("password Changed");
	      			if (response.status === 1) {
	      				notie.alert(1, 'Password Changed!', 1.5);
	      			} else {
	      				notie.alert(3, response.errors[0], 1.5);
	      			}
	      			$("#old-password").val("");
	      			$("#new-password").val("");
	      			$("#new-password-confirmation").val("");
	      		},
	      		error: function(userSession, response) {
	      			console.log("failed to change password");
	      			notie.alert(3, "failed to change password", 1.5);
	      		}
	    	});
		} else {
			notie.alert(3, "Passwords must match", 1.5);
		}

	},
	getInterests : function(){
		var interests = new Interests();
		var that = this;
		interests.fetch({
			success: function(data){
				that.renderData(data);
			}
		});
	},
	render : function (options){
		this.templateData = [];
		this.user = options["user"];
		this.getUserInterests();
		// Set scope, construct new activity collection, call fetch, render data on callback function
		var that = this; // To fix callback scoping error
	}, 
});

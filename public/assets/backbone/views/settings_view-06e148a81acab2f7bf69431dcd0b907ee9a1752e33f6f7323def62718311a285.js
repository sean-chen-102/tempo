// Creating View for Interests
var SettingsView = Backbone.View.extend({
	el: ".testDiv",
	tagName : 'li',
	options: null,
	events:{
    	"click #submit-interests":"saveInterests",
	},
	initialize: function(options){
		console.log("settings initialize called");
		this.userInterests = [];
		this.user = null;
		this.options = options;
		this.numInterests = 0;
		// Backbone.Events.on("user-interests", function(interests) {
		// 	console.log("user-interests");
		// 	console.log(interests[1]);
  //  			this.userInterests = interests[0];
  //  			this.id = interests[1];
  //  			console.log(this.id);

		// 	});
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
		interest.save({
      		success: function(userSession, response) {
      			console.log("Saved Interest");
      		},
      		error: function(userSession, response) {
      			console.log("failed to save interest");
      		}
    	});


	},
	getUserInterests : function(callback, args){
		// Fetches the user interests from the database
		var that = this;
		var interests = new Interests();
		interests.url = "/api/users/" + this.user.id + "/interests";
		var token = Cookies.get('login-token');
		interests.url += "?token=" + token;
		interests.fetch({
			success: function(data){
				that.userInterests = [];
				data.each(function(model){
					that.userInterests.push(model.get('name'));
				});
				if (args){
					callback(args);
				} else {
					callback();
				}
			}
		});
	},
	getInterests : function(that){
		var interests = new Interests();
		interests.fetch({
			success: function(data){
				that.renderData(data, that);
			}
		});
	},
	render : function (options){
		this.user = options["user"];
		// Set scope, construct new activity collection, call fetch, render data on callback function
		var that = this; // To fix callback scoping error
		var template = JST["backbone/templates/activities/settings"]({
    	    });
        this.$el.html(template);
		this.getUserInterests(this.getInterests, this);
	}, 
	renderData : function(data, that){	    	
		//TODO: Create and import handlebars for templating			
		var html = "<h4 style='color: #1abc9c;'> Interest List </h4> <br>"
					+ "<table> <thead> <tr> <th> </th>"
					+ "<th colspan='3'></th> </tr> </thead>" 
					+ " <tbody> ";
		//Iterate throught he collections of Activities and create a template
		var numInterests = 0;
		console.log(that.userInterests);
		data.each(function(model){
			var checked = "";
			if (that.userInterests.indexOf(model.get('name')) > -1) { 
				checked = "checked";
			}
			html += "<tr>" 
					+   " <td> <input type=checkbox name=" + model.get('name') +  " id=interest-" + numInterests + " " + checked + " >  </td>"
					+ "<td> " +  model.get('name') + " </td>"
				+ "</tr>";	
			numInterests += 1
		});
		that.numInterests = numInterests;
		html += " </tbody> </table> </br> ";
		html += "<button id=submit-interests> save </button> <br>"; 
		$(that.el).append(html);
    }
});

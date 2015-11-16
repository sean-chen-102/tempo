// Creating View for Interests
var SettingsView = Backbone.View.extend({
	el: ".testDiv",
	tagName : 'li',
	options: null,
	events:{
    	"click #submit-interests":"saveInterests",
	},
	renderData : function(data){
		var that = this;
		console.log(data);
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
      		},
      		error: function(userSession, response) {
      			console.log("failed to save interest");
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
					console.log("hi")
					that.userInterests.push(model.get('name'));
				});
				that.getInterests();
			}
		});
	},
	getInterests : function(){
		console.log("pls");
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
		console.log("render");
		this.user = options["user"];
		this.getUserInterests();
		// Set scope, construct new activity collection, call fetch, render data on callback function
		var that = this; // To fix callback scoping error
		console.log(that.templateData);
	} 
	// renderData : function(data, that){	    	
	// 	//TODO: Create and import handlebars for templating			
	// 	var html = "<div class='settingInterests'> <h4 style='color: #1abc9c;'> Interest List </h4> <br>"
	// 				+ "<table class='settingInterestTable'> <thead> <tr> <th> </th>"
	// 				+ "<th colspan='3'></th> </tr> </thead>" 
	// 				+ " <tbody> ";
	// 	//Iterate throught he collections of Activities and create a template
	// 	var numInterests = 0;
	// 	console.log(that.userInterests);
	// 	data.each(function(model){
	// 		var checked = "";
	// 		if (that.userInterests.indexOf(model.get('name')) > -1) { 
	// 			checked = "checked";
	// 		}
	// 		html += "<tr>" 
	// 				+   " <td> <input type=checkbox name=" + model.get('name') +  " id=interest-" + numInterests + " " + checked + " >  </td>"
	// 				+ "<td> " +  model.get('name') + " </td>"
	// 			+ "</tr>";	
	// 		numInterests += 1
	// 	});
	// 	that.numInterests = numInterests;
	// 	html += " </tbody> </table> </br> ";
	// 	html += "<footer> <button id=submit-interests> save </button> <br> </div> </footer>"; 
	// 	$(that.el).append(html);
 //    }

});

// Creating View for Interests
var InterestView = Backbone.View.extend({
	el: ".testDiv",
	tagName : 'li',
	options: null,
	events:{
    	"click #submit-temp-interests":"saveInterests",
	},
	initialize: function(options){
		console.log("interests initialize called");
		this.userInterests = [];
		this.id = -500;
		this.options = options;
		this.user = null;
		this.numInterests = 0;
		// Backbone.Events.on("user-interests", function(interests) {
		// 	console.log("user-interests");
		// 	console.log(interests[1]);
  //  			this.userInterests = interests[0];
  //  			this.id = interests[1];
  //  			console.log(this.id);

		// 	});
		this.model = new User();

	},
	saveInterests : function(options) {
		var that = this;
		var newInterests = []
		for (var j = 0; j < that.numInterests; j++) {
			var currInterest = $('interest-' + j);
			var name = currInterest.attr('name')
			if (currInterest.is(":checked") && that.userInterests.indexOf(name) > -1) {
				newInterests.append(name);
			}
		}
		this.model.url = "/api/users/" + this.id + "/interests";
		this.model.attributes.interests = newInterests;

		this.model.save(this.model.attributes, {
      		success: function(userSession, response) {
      			console.log("success!");
      			console.log(userSession);
      			console.log(response);
      			Cookies.set("login-token", response.token);
      			// Backbone.Events.trigger("user-interests", [response.user.interests, response.user.id]);
      			alert("you successfully logged in!");
      		},
      		error: function(userSession, response) {
      			console.log("failure!");
      		}
    	});

	},
	getInterests : function(options){
		var that = this;
		// Fetches the user interests from the database
		var interests = new Interests();
		interests.url = "/api/users/" + this.user.id + "/interests";
		console.log(interests.url);
		interests.fetch({
			data: {token:that.model.attributes.user},
			success: function(data){
				that.renderData(data);
				that.userInterests = data;
			}
		});
	},
	render : function (options){
		this.user = options["user"];
		// Set scope, construct new activity collection, call fetch, render data on callback function
		var that = this; // To fix callback scoping error
		var template = JST["backbone/templates/activities/interest"]({
    	    });
        this.$el.html(template);

		this.getInterests();
	},
	renderData : function(data){	    	
		//TODO: Create and import handlebars for templating			
		var html = "<h4 style='color: #1abc9c;'> Interest List </h4> <br>"
					+ "<table> <thead> <tr> <th> </th><th>Name</th>"
					+ "<th colspan='3'></th> </tr> </thead>" 
					+ " <tbody> ";
		//Iterate throught he collections of Activities and create a template
		var that = this;
		data.each(function(model){
			var checked = "checked";
			// if (that.userInterests.indexOf(model.get('name')) > -1) { 
			// 	checked = "checked";
			// }
			html += "<tr>" 
					+   " <td> <input type=checkbox name=" + model.get('name') +  " id=interest-" + that.numInterests + " " + checked + " >  </td>"
					+ "<td> " +  model.get('name') + " </td>"
				+ "</tr>";	
			that.numInterests += 1
		});
		html += " </tbody> </table> </br> ";
		html += "<button id=submit-temp-interests> save </button> <br>"; 
		//Adding activity link
		html += " <a href='/tempo#settings' id='add'> Add interest </a>";
		$(this.el).append(html);	
	}
});

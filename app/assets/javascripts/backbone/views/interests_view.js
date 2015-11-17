// Creating View for Interests
var InterestView = Backbone.View.extend({
	el: ".testDiv",
	tagName : 'li',
	options: null,
	events:{
    	"click #submit-temp-interests":"getSelectedInterests",
	},
	initialize: function(options){
		console.log("interests initialize called");
		this.userInterests = [];
		this.id = -500;
		this.options = options;
		this.user = null;
		this.numInterests = 0;
		this.selectedInterests = null;
	},
	getSelectedInterests : function(options) {
		//TODO; change so that it can be accessed in other view
		var that = this;
		var selectedInterests = [];
		console.log('hi');
		for (var j = 0; j < that.numInterests; j++) {
			var currInterest = $('#interest-' + j);
			var name = currInterest.attr('name')
			if (currInterest.is(":checked")) {
				selectedInterests.push(name);
			}
		}
		this.selectedInterests = selectedInterests;
		window.location = '/tempo#home';
		return selectedInterests;
	},
	getInterests : function(options){
		var that = this;
		// Fetches the user interests from the database
		var interests = new Interests();
		interests.url = "/api/users/" + this.user.id + "/interests";
		var token = Cookies.get('login-token');
		interests.url += "?token=" + token;
		interests.fetch({
			success: function(data){
				that.userInterests = data;
				if (options['callback']){
					options['callback'](data, options['scope']);
				}
			}
		});
	},
	render : function (options){
		console.log('interest view rendering');
		this.user = options["user"];
		// Set scope, construct new activity collection, call fetch, render data on callback function
		var that = this; // To fix callback scoping error
		var template = JST["backbone/templates/activities/interest"]({
    	    });
        this.$el.html(template);

		this.getInterests({callback:this.renderData, scope:this});
	},
	renderData : function(data, that){    	
		//TODO: Create and import handlebars for templating			
		var html = "<div class='interestContainer'> <header> <h4 id='interestsTitle' style='color: #1abc9c;'> Interest List </h4> </header> <br>"
					+ "<table class='interestTable'> <thead> <tr> <th>Name</th>"
					+ "<th colspan='3'></th> </tr> </thead>" 
					+ " <tbody> ";
		//Iterate throught he collections of Activities and create a template
		var numInterests = 0;
		data.each(function(model){
			var checked = "checked";
			// if (that.userInterests.indexOf(model.get('name')) > -1) { 
			// 	checked = "checked";
			// }
			html += "<tr>" 
					+   " <td> <input type=checkbox name=" + model.get('name') +  " id=interest-" + numInterests + " " + checked + " >  "
					+ " <span> " +  model.get('name') + "</span> </td>"
				+ "</tr>";	
			numInterests += 1
		});
		that.numInterests = numInterests;
		html += " </tbody> </table> </br> ";
		html += "<footer> <button id=submit-temp-interests> save </button> <br>"; 
		$(that.el).append(html);	
	}
});
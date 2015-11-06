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
		var html = "<h4 style='color: #1abc9c;'> Interest List </h4> <br>"
					+ "<table> <thead> <tr> <th> </th><th>Name</th>"
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
					+   " <td> <input type=checkbox name=" + model.get('name') +  " id=interest-" + numInterests + " " + checked + " >  </td>"
					+ "<td> " +  model.get('name') + " </td>"
				+ "</tr>";	
			numInterests += 1
		});
		that.numInterests = numInterests;
		html += " </tbody> </table> </br> ";
		html += "<button id=submit-temp-interests> save </button> <br>"; 
		//Adding activity link
		html += " <a href='/tempo#settings' id='add'> Add interest </a> <br>";
		html += " <a href='tempo#home'> Go Back</a>"
		$(that.el).append(html);	
	}
});

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require underscore
//= require backbone
//= require tempo
//= require handlebars.runtime
//= require handlebars
//= require_tree ./backbone/templates
//= require_tree ./backbone/models
//= require_tree ./backbone/collections
//= require_tree ./backbone/views
//= require_tree ./backbone/routers
//= require_tree .

//Test template


// TODO: Move to tempo.js 
$(document).ready(function(){
	//-----------------Temporary Api dummy data
	var dummyActivities = [
		{
			"id": 1,
			"title": "Reading Wikipedia",
			"content": "he Treaties of the European Union are a set of international treaties between the European Union (EU) member states which sets out the EU's constitutional basis. They establish the various EU institutions together with their remit, procedures and objectives. The EU can only act within the competences granted to it through thes",
			"completion_time": 2,
			"content_type": "article"
		},
		{
			"id": 2,
			"title": "Fact of The Day",
			"content": "The Minnesota Vikings and the Buffalo Bills, who have both been to four Super Bowls, have come away with zero championships. And then there's four franchises -- the Cleveland Browns, Detroit Lions, Houston Texans, and Jacksonville Jaguars -- who have never been to the Super Bowl.",
			"completion_time": 1,
			"content_type": "article"
		},
		{
			"id": 3,
			"title": "What is Wedding Soup",
			"content": "The term 'wedding soup' is a mistranslation of the Italian language phrase 'minestra maritata' ('married soup','' which is a reference to the fact that green vegetables and meats go well together. The minestra maritata recipe is also prepared by the families of Lazio and Campania during the Christmas season (a tradition",
			"completion_time": 3,
			"content_type": "article"
		},
		{
			"id": 4,
			"title": "Another soup thing",
			"content": "guage phrase 'minestra maritata' ('married soup','' which is a reference to the fact that green vegetables and meats go well together. The minestra maritata recipe is also prepared by the families of Lazio and Campania during the Christmas season (a tradition",
			"completion_time": 3,
			"content_type": "article"
		}					
	] 

	var dummyInterests = [
		{
			"id": 1,
			"title": "Reading Wikipedia",
			"content": "he Treaties of the European Union are a set of international treaties between the European Union (EU) member states which sets out the EU's constitutional basis. They establish the various EU institutions together with their remit, procedures and objectives. The EU can only act within the competences granted to it through thes",
			"completion_time": 2,
			"content_type": "article"
		},
		{
			"id": 2,
			"title": "Fact of The Day",
			"content": "The Minnesota Vikings and the Buffalo Bills, who have both been to four Super Bowls, have come away with zero championships. And then there's four franchises -- the Cleveland Browns, Detroit Lions, Houston Texans, and Jacksonville Jaguars -- who have never been to the Super Bowl.",
			"completion_time": 1,
			"content_type": "article"
		}]
	//-----------------Temporary Api data

	window.App = {
	  Models: {},
	  Collections: {},
	  Views: {},
	  Routers: {},
	  initialize: function(data){
		console.log('Initilizing the app');
		
		//Start app router and history
		new App.Router;
		Backbone.history.start();	
	  }
	};

	//App router  =================================
	App.Router = Backbone.Router.extend({
		routes: {
			'': 'index',
			'home': 'index',
			"interests": "interests",
			"activities": "activities"
		},
		index: function(){
			console.log("Index router is called");
			App.Views['homeView'] = new HomeView();
		},
		activities: function(){
			console.log("The interests router was called ");
			//Constructing View 
			App.Views['activityView'] = new ActivityView()		
		},		
		interests: function(){
			console.log("The interests router was called ");
			//Constructing View 
			App.Views['interestView'] = new InterestView()			
		}
	});

	//Models =================================
	var Activity = Backbone.Model.extend({});
	var Interest = Backbone.Model.extend({});

	//Collections  =================================
	
	//Activities Collection
	var Activities = Backbone.Collection.extend({
		model: Activity,
		jsonData: null,		
		//TODO: Api endpoint to retrieve JSON data
		url: "/api/activites",
		setData: function(){
			this.fetch({
				success: function(data){
					this.jsonData = data;
				}
			});
		},
		initialize: function(){
			console.log("Created new collection");
			this.setData();
		}
	});

	//Interests Collection
	var Interests = Backbone.Collection.extend({
		model: Interest,
		jsonData: null,		
		//TODO: Api endpoint to retrieve JSON data
		url: "/pages",
		setData: function(){
			this.fetch({
				success: function(data){
					this.jsonData = data;
				}
			});
		},
		initialize: function(){
			console.log("Created new collection");
			this.setData();
		}
	});	

	//Views  =================================
	var ActivityView = Backbone.View.extend({
		el: ".testDiv",
		tagName : 'li',
		options: null,
		initialize: function(options){
			this.options = options;
			this.render();

		},
		render : function (options){

			//Initialize ArtistsArray
			var activityArray = []
			for (var i in dummyActivities){
				activityArray.push(new Activity(dummyActivities[i]));
			}
			
			//Initialize Collection of Artst
			var activities = new Activities(activityArray);			
			
			//TODO: Create and import handlebars for templating			
			var html = "<h4 style='color: #9b59b6;'> Activity List </h4> <br>"
						+ "<table> <thead> <tr> <th>Title</th> <th>Content</th> <th>Completion Time</th> <th>Content type</th> <th>Content</th> "
						+ "<th colspan='3'></th> </tr> </thead>" 
						+ " <tbody> ";
			//Iterate throught he collections of Activities and create a template
			activities.each(function(model){
				html += "<tr>" 
						+ "<td> " +  model.get('title') + " </td>"
						+ "<td> " +  model.get('content') + " </td>"
						+ "<td> " +  model.get('completion_time') + " </td>"
						+ "<td> " +  model.get('content_type') + " </td>"
					+ "</tr>";	
			});

			html += " </tbody> </table> </br> ";
			//Adding activity link
			html += " <a href='/activities#show'> Add activity </a>";
			this.$el.html(html);	
		}
	});


	// Creating View for Interests
	var InterestView = Backbone.View.extend({
		el: ".testDiv",
		tagName : 'li',
		options: null,
		initialize: function(options){
			this.options = options;
			this.render();
		},
		render : function (options){

			//Initialize ArtistsArray
			var interestArray = []
			for (var i in dummyInterests){
				interestArray.push(new Interest(dummyInterests[i]));
			}
			
			//Initialize Collection of Artst
			var interests = new Interests(interestArray);			
			
			//TODO: Create and import handlebars for templating			
			var html = "<h4 style='color: #1abc9c;'> Interest List </h4> <br>"
						+ "<table> <thead> <tr> <th>Title</th> <th>Content</th> <th>Completion Time</th> <th>Content type</th> <th>Content</th> "
						+ "<th colspan='3'></th> </tr> </thead>" 
						+ " <tbody> ";
			//Iterate throught he collections of Activities and create a template
			interests.each(function(model){
				html += "<tr>" 
						+ "<td> " +  model.get('title') + " </td>"
						+ "<td> " +  model.get('content') + " </td>"
						+ "<td> " +  model.get('completion_time') + " </td>"
						+ "<td> " +  model.get('content_type') + " </td>"
					+ "</tr>";	
			});

			html += " </tbody> </table> </br> ";
			//Adding activity link
			html += " <a href='/activities#show'> Add interest </a>";
			this.$el.html(html);	
		}
	});

	// Creating View for Home
	var HomeView = Backbone.View.extend({
		el: ".testDiv",
		tagName : 'li',
		options: null,
		initialize: function(options){
			this.options = options;
			this.render();
		},
		render : function (options){

			html = "<h3 style='color: #e74c3c;'> Welcome Home Owen </h3>";
			//Go button
			html += "<a href='activities#activities'> GO </a> <br>";
			html += "<a href='activities#interests'> See your interests </a> ";
			this.$el.html(html);	
		}
	});

	//Initialize Activity view
	App.initialize();
});




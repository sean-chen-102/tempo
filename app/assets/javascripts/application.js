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
//= require_tree ./backbone/templates
//= require_tree ./backbone/models
//= require_tree ./backbone/collections
//= require_tree ./backbone/views
//= require_tree ./backbone/routers
//= require_tree .

$(document).ready(function(){
	// To fetch one model
	var Activity = Backbone.Model.extend({});
	var activity = new Activity();
	//Temporary Api
	activity.url = "/pages";
	activity.fetch({
		success : function(){
			view = new ActivityView({model : activity });
			$('.testTable').append(view.render());
		}
	});
	//------------------
	//To fetch multiple models
	var Activities = Backbone.Collection.extend({
		model: Activity
	});

	var activities = new Activities();
	activities.url = "/pages";
	activities.fetch({
		success : function() {
			console.log("Success for collections");
			_.each(activities.models, function(collection, model){
				view = new ActivityView({model : model, myVar: "hello"});
				$('.testTable').append(view.render());
			})
		}
	})
	
	//------------------
	var ActivityView = Backbone.View.extend({
		tagName : 'li',
		options: null,
		initialize: function(options){
			this.options = options;
		},
		render : function (options){
			return($(this.el).text(activity.attributes[this.options.model].title + activity.attributes[this.options.model].content));
		}
	});

});

window.App = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function(data){
	console.log('Initilizing the app');
	new App.Router;
	Backbone.history.start();	
  }
};

//Setting up app router
App.Router = Backbone.Router.extend({
	routes: {
		'': 'index',
		"show/:id": "show"
	},
	index: function(){
		console.log("Index router is called");
	},
	show: function(id){
		console.log("The show router was called " + id);
	}
});

//Initialization of app
App.initialize();


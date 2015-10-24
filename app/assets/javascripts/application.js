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
//= require_tree ./backbone/templates
//= require_tree .

//Test template

// TODO: Move to tempo.js 
$(document).ready(function(){
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
			'signup': 'signup',
			'home': 'home',
			"interests": "interests",
			"activities": "activities",
			"show": "show"
		},
		initialize: function() {
			console.log("HEY");
			App.Views['homeView'] = new HomeView();
			App.Views['activityView'] = new ActivityView()
			App.Views['interestView'] = new InterestView()
			App.Views['SignupView'] = new SignupView()
		},
		index: function(){
			console.log("Index router is called");
			App.Views['homeView'].render();
		},
		home: function() {
			console.log("Home router is called");
			App.Views['homeView'].render();
		},
		activities: function(){
			console.log("The activities router was called ");
			//Constructing View 
			App.Views['activityView'].render()		
		},		
		interests: function(){
			console.log("The interests router was called ");
			//Constructing View 
			App.Views['interestView'].render()			
		},
		show: function(){
			//This route doesn't do anything yet
			console.log("The show router was called ");
			document.getElementById('add').style.color = 'green';
			var newNode = document.createElement("p");
			newNode.appendChild(document.createTextNode("This hasn't been implemented yet"));
			var refNode = document.getElementById("add");
			refNode.parentNode.insertBefore(newNode, refNode.nextSibling);			
		},
		signup: function(){
			console.log("The signup router was called ");
			//Constructing View 
			App.Views['SignupView'].render()			


		},

	});

	//Models =================================
	var Activity = Backbone.Model.extend({});
	var Interest = Backbone.Model.extend({});
	var User = Backbone.Model.extend({});
	var Time = Backbone.Model.extend({
			    duration: null
				});
	var UserRegistration = Backbone.Model.extend({
    	url: '/api/users/',
    	paramRoot: 'user',

    	defaults: {
    		"user" : {
    			"name": "",
      			"email": "",
      			"username": "",
      			"password": "",
      			"password_confirmation": ""
    		}
    	}
  	});
  	var UserLogin = Backbone.Model.extend({
  		url: '/users/sign_in.json',
  		paramRoot: 'user',
  		defaults: {
  			"user" : {
    			"email": "",
    			"password": ""
    		}
  		}
	});

  	var UserSession = Backbone.Model.extend({
  		url: '/users/sign_in.json',
  		paramRoot: 'user',
  		defaults: {
    		"email": "",
    		"password": ""
  		}
	});

	//Collections  =================================
	
	//Activities Collection
	var Activities = Backbone.Collection.extend({
		model: Activity,
		url: "/api/activities",
		parse: function(data){
			//TODO: change json key
			return data.activities
		}
	});

	//Interests Collection
	var Interests = Backbone.Collection.extend({
		model: Interest,
		jsonData: null,		
		//TODO: Api endpoint to retrieve JSON data
		url: "/api/interests",
		parse: function(data){
			return data.interests
		}
	});	

	//Time Collection	
	Times = Backbone.Collection.extend({
	    initialize: function(model, options) {}
	});

	//Views  =================================
	var ActivityView = Backbone.View.extend({
		el: ".testDiv",
		tagName : 'li',
		options: null,
		time: null,
		interests: [],
		activities : null,
		initialize: function(options){
			this.options = options;
			this.activities = new Activities();
		},
		render : function (options){
			// Set scope, construct new activity collection, call fetch, render data on callback function
			var that = this; // To fix callback scoping error

			var renderData = function(data) {
				console.log(data);
				//TODO: Create and import handlebars for templating			
				var html = "<h4 style='color: #9b59b6;'> Activity List </h4> <br>"
							+ "<table> <thead> <tr> <th>Title</th> <th>Content</th> <th>Completion Time</th> <th>Content type</th> <th>Id</th> "
							+ "<th colspan='3'></th> </tr> </thead>" 
							+ " <tbody> ";

				//Iterate throught he collections of Activities and create a template
				that.activities.each(function(model){
					html += "<tr>" 
							+ "<td> " +  model.get('title') + " </td>"
							+ "<td> " +  model.get('content') + " </td>"
							+ "<td> " +  model.get('completion_time') + " </td>"
							+ "<td> " +  model.get('content_type') + " </td>"
							+ "<td> " +  model.get('id') + " </td>"
						+ "</tr>";	
				});
				html += " </tbody> </table> </br> ";
				//Adding activity link
				html += " <a href='/activities#show' id='add'> Add activity </a>";
				$(that.el).html(html);	
		    };

		    //TODO: Find better way to do this
		    if(this.interests && this.time){
		    	this.activities.fetch({
				success: function(data){
						renderData(data);
					},
					dataType: "json",
					data: {"interests": this.interests, "time": this.time}
				});
		    } else if (this.interests){
		    	this.activities.fetch({
				success: function(data){
						renderData(data);
					},
					dataType: "json",
					data: {"interests": this.interests}
				});
		    } else if (this.time){
		    	this.activities.fetch({
					success: function(data){
						renderData(data);
					},
					dataType: "json",
					data: {"time": this.time}
				});
		    } else {
				this.activities.fetch({
					success: function(data){
						renderData(data);
					}
				});
		    }
		}
	});


	// Creating View for Interests
	var InterestView = Backbone.View.extend({
		el: ".testDiv",
		tagName : 'li',
		options: null,
		initialize: function(options){
			this.options = options;
		},
		render : function (options){
			// Set scope, construct new activity collection, call fetch, render data on callback function
			var that = this; // To fix callback scoping error
		    var renderData = function(data){	    	
		
				//TODO: Create and import handlebars for templating			
				var html = "<h4 style='color: #1abc9c;'> Interest List </h4> <br>"
							+ "<table> <thead> <tr> <th> </th><th>Name</th> <th>Created at</th> <th>Updated At</th> <th>User Id</th> <th>Content</th> "
							+ "<th colspan='3'></th> </tr> </thead>" 
							+ " <tbody> ";
				//Iterate throught he collections of Activities and create a template
				var i = 0
				interests.each(function(model){
					html += "<tr>" 
							+   " <td> <input type=checkbox name=" + model.get('name') +  " id=interest-" + i + " >  </td>"
							+ "<td> " +  model.get('name') + " </td>"
							+ "<td> " +  model.get('created_at') + " </td>"
							+ "<td> " +  model.get('updated_at') + " </td>"
							+ "<td> " +  model.get('user_id') + " </td>"
						+ "</tr>";	
					i += 1
				});
				html += " </tbody> </table> </br> ";
				html += "<button id=submit-interests> save </button> <br>"; 
				//Adding activity link
				html += " <a href='/activities#show' id='add'> Add interest </a>";
				$(that.el).html(html);	
		    };

			var interests = new Interests();	
			interests.fetch({
				success: function(data){
					renderData(data);
				}
			});
		}
	});

	// Creating View for Home
	var HomeView = Backbone.View.extend({
		el: ".testDiv",
		tagName : 'div',
		options: null,
		events:{
        	"click .go-btn":"makeGoRequest",
        	"click #login": "login"
    	},
		initialize: function(options){
			this.options = options;

			this.times = new Times(null, {
	            view: this
	        });
			//TODO: Find better way to do this
			//add all the times we want the user to  be able to select
	        this.times.add(new Time({duration: "5"}));
	        this.times.add(new Time({duration: "15"}));
	        this.times.add(new Time({duration: "30"}));
	        this.times.add(new Time({duration: "60"}));
		},
		render : function (options){
			console.log("render home");
			var that = this;
			//TODO: Move template to separate page, custom welcome name
			//populate the home_template with times collection
			var home_template = JST["backbone/templates/activities/home"]({
            	times: that.times.toJSON(),
            	labelValue: 'Times'
    	    });
    	    console.log(home_template);
    	    console.log(this.$el);
        	this.$el.html(home_template);
		},
		makeGoRequest : function(options){
			//called when the go button is clicked
			var index = $('#time-selector')[0].selectedIndex;
			var duration = this.times.models[index].get('duration');
			//save duration to activity view object
			App.Views['activityView'].time = duration;
			//switch view to activities view
			window.location = '/activities#activities';
		},
		login : function(options){
			//called when the go button is clicked
			var username = $('#username-login').val();
			var password = $('#password-login').val();
		}
	});

	

	var SignupView = Backbone.View.extend({
		el: ".testDiv",
		tagName : 'div',

	  events: {
	    'submit form': 'signup'
	  },

	  initialize: function() {
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


	    el.find('input.btn-primary').prop('value', 'loading');

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
	        el.find('input.btn-primary').prop('value', 'reset');
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
	        el.find('input.btn-primary').button('reset');
	      }
	    });
	  }
	});

	//Initialize Activity view
	App.initialize();

});




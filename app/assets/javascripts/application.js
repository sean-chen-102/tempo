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
//= require js.cookie
//= require underscore
//= require bootstrap-sprockets
//= require bootstrap
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
		App.Router = new TempoRouter();
		Backbone.history.start();

	  }
	};

	App.initialize();

});




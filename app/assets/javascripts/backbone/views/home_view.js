var HomeView = Backbone.View.extend({
<<<<<<< HEAD
		el: ".testDiv",
		tagName : 'div',
		options: null,
		events:{
        	"click .go-btn":"makeGoRequest",
        	"click .login-submit":"login"
    	},
		initialize: function(options){
			this.options = options;
			this.interestView = options.interestView;
			this.activitiesView = options.activitiesView;

			var tag = document.createElement('script');

		    tag.src = "https://www.youtube.com/iframe_api";
		    var firstScriptTag = document.getElementsByTagName('script')[0];
		    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
		},
		render : function (options){
			console.log("render home");
			this.interestView.user = options.user;
			this.interestView.interests = null;
			var that = this;
	        this.name = options.user.name;
			//TODO: Move template to separate page, custom welcome name
			//populate the home_template with times collection
			var home_template = JST["backbone/templates/activities/home"]({
            	labelValue: 'Times',
            	name: this.name
    	    });
        	this.$el.html(home_template);
        	$(function() {
        		$(".knob").knob({
        			max: 60,
        			min:1,
        			width: 150,
        			height: 150,
        			step: 1,
        			fgColor: "#2C7EBF",
        			inputColor: "#2C7EBF"
        		});
        		$(".knob").val(30).trigger('change');
    		});
		},
		makeGoRequest : function(options){
			//called when the go button is clicked
			var duration = $(".knob").val();
			//save duration to activity view object
			this.activitiesView.time = duration;
			//save interests to activity view object
			var interests = this.interestView.selectedInterests;
			if (interests){
				this.activitiesView.interests = interests;
			} else {
				var that = this;
				App.Views['interestView'].getInterests({callback: function(data, that){
					var userInterests = []
					data.each(function(model){
						userInterests.push(model.get('name'));
					});
					that.activitiesView.interests = userInterests;
				}, scope: that});
=======
	el: ".testDiv",
	tagName : 'div',
	options: null,
	events:{
    	"click .go-btn":"makeGoRequest",
    	"click .login-submit":"login",

	},
	initialize: function(options){
		this.options = options;
		this.activitiesView = options.activitiesView;

       	this.userInterests = [];
		this.id = -500;
		this.options = options;
		this.user = null;
		this.numInterests = 0;
		this.selectedInterests = null;

	},
	render : function (options){
		console.log("render home");
		this.user = options["user"];
        this.name = options.user.name;
		//TODO: Move template to separate page, custom welcome name
		this.renderData();
	},
	makeGoRequest : function(options){
		console.log("hi3e3");
		//called when the go button is clicked
		var duration = $(".knob").val();
		//save duration to activity view object
		var that = this;
		var selectedInterests = [];
		for (var j = 0; j < that.numInterests; j++) {
			var currInterest = $('#interest-' + j);
			var name = currInterest.attr('name')
			if (currInterest.is(":checked")) {
				selectedInterests.push(name);
>>>>>>> e3e31228c47b40703adefbc8d7c46a0983fe23a9
			}
		}
		this.selectedInterests = selectedInterests;
		//save interests to activity view object
		this.activitiesView.interests = this.selectedInterests;
		this.activitiesView.time = duration;
		//switch view to activities view
		this.activitiesView.activities = new Activities();
		window.location = '/tempo#activities?';
	},
	renderData : function(options){
		var that = this;
		// Fetches the user interests from the database
		var interests = new Interests();
		interests.url = "/api/users/" + this.user.id + "/interests";
		var token = Cookies.get('login-token');
		interests.url += "?token=" + token;
		interests.fetch({
			success: function(data) {
				that.userInterests = data;
				that.numInterests = data.length;
				var selectedInterests = []
				data.each(function(model) {
					selectedInterests.push(model.get("name"));
				});
				var home_template = JST["backbone/templates/activities/home"]({
        			name: that.name,
        			interests: selectedInterests
	    		});
    			that.$el.html(home_template);
    			$(function() {
    				$(".knob").knob({
    					max: 60,
    					min:1,
    					width: 150,
    					height: 150,
    					step: 1,
    					fgColor: "#2C7EBF",
    					inputColor: "#2C7EBF"
    				});
    				$(".knob").val(30).trigger('change');
				});
			}
		});
	}
});
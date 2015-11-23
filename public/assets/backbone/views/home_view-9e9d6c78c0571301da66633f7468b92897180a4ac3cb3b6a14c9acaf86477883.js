var HomeView = Backbone.View.extend({
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
			}
			//reset selectedInterests for the next go request
			this.interestView.selectedInterests = null;
			//switch view to activities view
			this.activitiesView.activities = new Activities();
			window.location = '/tempo#activities?';
		},
	});

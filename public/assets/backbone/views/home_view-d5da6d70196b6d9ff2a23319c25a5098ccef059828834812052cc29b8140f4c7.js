var HomeView = Backbone.View.extend({
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
    			if (data.length === 0){
    				$(".interest-wrapper").append("<h1> Looks like you don't have any interests, head to the <a id='settings-link' href='tempo#settings'> settings </a> page to pick some! </h1>");
    			}
    			$(function() {
    				$(".knob").knob({
    					max: 60,
    					min: 0,
    					width: 200,
    					height: 200,
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

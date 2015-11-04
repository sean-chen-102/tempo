// Custom Activities Collection
var CustomActivities = Backbone.Collection.extend({
		model: Activity,
		url: "/api/custom_activities",
		parse: function(data){
			//TODO: change json key
			return data.custom_activities
		}
	});



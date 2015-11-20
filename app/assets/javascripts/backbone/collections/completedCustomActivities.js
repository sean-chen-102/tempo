//Activities Collection
var CompletedCustomActivities = Backbone.Collection.extend({
		model: CustomActivity,
		parse: function(data){
			//TODO: change json key
			return data.completed_custom_activities
		}
	});
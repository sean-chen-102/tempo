//Completed Activities Collection
var CompletedActivities = Backbone.Collection.extend({
		model: Activity,
		parse: function(data){
			//TODO: change json key
			return data.completed_activities
		}
	});
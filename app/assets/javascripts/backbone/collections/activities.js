//Activities Collection
var Activities = Backbone.Collection.extend({
		model: Activity,
		url: "/api/activities",
		parse: function(data){
			//TODO: change json key
			console.log('data');
			return data.activities
		}
	});
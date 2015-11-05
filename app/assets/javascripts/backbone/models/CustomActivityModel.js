var CustomActivity = Backbone.Model.extend({
  		url: '/api/custom_activities',
  		paramRoot: 'activity',
  		defaults: {
    		"title": "",
    		"content": "",
    		"completion_time": ""
  		}	
});

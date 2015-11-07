var CustomActivity = Backbone.Model.extend({
  		url: '/api/custom_activities',
  		paramRoot: 'activity',
  		defaults: {
    		"title": "",
    		"content": "",
    		"completion_time": ""
  		},
		
		validate: function (attrs) {
        if (!attrs.title) {
            return 'Please provide a title.';
        }
        if (!attrs.completion_time) {
            return 'Please provide a completion time';
        } else if (isNaN(attrs.completion_time)) {
        	return 'Completion time must be an integer';
        }
    }	
});

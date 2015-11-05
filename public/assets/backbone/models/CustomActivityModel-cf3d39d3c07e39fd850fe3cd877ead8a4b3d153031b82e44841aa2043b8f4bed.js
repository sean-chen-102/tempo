var CustomActivity = Backbone.Model.extend({
  		url: '/api/custom_activities',
  		paramRoot: 'activity',
  		defaults: {
    		"title": "",
    		"content": "",
    		"completion_time": ""
  		},
		
		validate: function (attrs) {
        if (!attrs.email) {
            return 'Please provide a title.';
        }
        if (!attrs.completion_time) {
            return 'Please provide a completion time';
        } else if (!isNAN(attrs.completion_time)) {
        	return 'Completion time must be an integer';
        }
    }	
});

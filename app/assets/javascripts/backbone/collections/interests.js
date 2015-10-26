//Interests Collection
var Interests = Backbone.Collection.extend({
		model: Interest,
		jsonData: null,		
		//TODO: Api endpoint to retrieve JSON data
		url: "/api/interests",
		parse: function(data){
			return data.interests
		}
	});	
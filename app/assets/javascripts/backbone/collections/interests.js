//Interests Collection
var Interests = Backbone.Collection.extend({
		model: Interest,
		jsonData: null,		
		//TODO: Api endpoint to retrieve JSON data
		url: "/api/interests",
		// sync: function(method, model, options){
		// 	console.log("in mySyncFunction");
		//   if(method=='GET'){
		//     // options.url = model.url; 
		//     console.log(model.url);
		//   }else{
		//      //options.url = model.url + '/save'; 
		//      console.log(model.url);
		//      console.log(options.url);
		//   }
		//   return Backbone.sync(method, model, options);
		// },
		parse: function(data){
			return data.interests
		}
	});	
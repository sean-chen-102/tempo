// Custom Activity View
var CustomActivityView = Backbone.View.extend({
    el: ".testDiv",
    tagName : 'li',
    options: null,
    time: null,
    interests: [],
    customActivities : null,
    activities : null,
    initialize: function(options){
      this.options = options;
      this.customActivities = new CustomActivities();
      this.activities = new Activities();
    },
    render : function (options){
      // Set scope, construct new activity collection, call fetch, render data on callback function
      var that = this; // To fix callback scoping error	
      var renderData = function(data) {
      		console.log(data);


	        //TODO: Create and import handlebars for templating     
	        var html = "<h4 style='color: #9b59b6;'> Custom Activity List </h4> <br>"
	              + "<table> <thead> <tr> <th>Title</th> <th>Content</th> <th>Completion Time</th> <th>Id</th> "
	              + "<th colspan='3'></th> </tr> </thead>" 
	              + " <tbody> ";


	        that.customActivities.each(function(model){
	          html += "<tr>" 
	              + "<td> " +  model.get('title') + " </td>"
	              + "<td> " +  model.get('content') + " </td>"
	              + "<td> " +  model.get('completion_time') + " </td>"
	              + "<td> " +  model.get('id') + " </td>"
	            + "</tr>";  
	        });

	        html += " </tbody> </table> </br> ";
	        
          //Adding activity link
	        html += " <a href='/tempo#createCustomActivity' id='add'> Create a Custom Activity </a>";
          html += " <div class='createCustomActivity'> </div> ";
	        $(that.el).html(html);  
       	};

       	this.customActivities.fetch({
       		success: function(data){
       			renderData(data);
       		},
          	dataType: "json",
          	data: {"interests": this.interests, "time": this.time}       		
       	});

        //TODO: Find better way to do this
        // if(this.interests && this.time){
        //   this.activities.fetch({
        // success: function(data){
        //     renderData(data);
        //   },
        //   dataType: "json",
        //   data: {"interests": this.interests, "time": this.time}
        // });
        // } else if (this.interests){
        //   this.activities.fetch({
        // success: function(data){
        //     renderData(data);
        //   },
        //   dataType: "json",
        //   data: {"interests": this.interests}
        // });
        // } else if (this.time){
        //   this.activities.fetch({
        //   success: function(data){
        //     renderData(data);
        //   },
        //   dataType: "json",
        //   data: {"time": this.time}
        // });
        // } else {
        // this.activities.fetch({
        //   success: function(data){
        //     renderData(data);
        //   }
        // });
        // }
    }
  });

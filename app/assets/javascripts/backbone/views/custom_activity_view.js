// Custom Activity View
var CustomActivityView = Backbone.View.extend({
    el: ".testDiv",
    tagName : 'li',
    options: null,
    time: null,
    interests: [],
    customActivities : null,
    activities : null,
    user: null,
    initialize: function(options){
      this.options = options;
      this.customActivities = new CustomActivities();
      this.activities = new Activities();
    },
    render : function (options){
      // Set scope, construct new activity collection, call fetch, render data on callback function
      var that = this; // To fix callback scoping error	
      this.user = options.user;

      var renderData = function(data) {

          // TODO: templating code needs debugging
          // var template =  JST["backbone/templates/activities/customActivity"]({
          //     title: data['title'],
          //     content: data['content'],
          //     completion_time: data['completion_time'],
          //     name: that.user.name
          // });
          // console.log(template);

	        //TODO: Create and import handlebars for templating     
	        var html = "<h4 style='color: #9b59b6;'> Custom Activity List for " + that.user.name + "</h4> <br>"
	              + "<table class='customActivityTable'> <thead> <tr> <th>Title</th> <th>Content</th> <th>Completion Time</th> "
	              + "<th colspan='3'></th> </tr> </thead>" 
	              + " <tbody> ";

	        that.customActivities.each(function(model){

            // We just want Sally"s Custom Activities
            // if (model.get('id') == that.user.id){
              html += "<tr>" 
                  + "<td> " +  model.get('title') + " </td>"
                  + "<td> " +  model.get('content') + " </td>"
                  + "<td> " +  model.get('completion_time') + " </td>"
                  // + "<td> " +  model.get('id') + " </td>"
                + "</tr>"; 
            // } 
	        });

	        html += " </tbody> </table> </br> ";
	        
          //Adding activity link
	        html += " <a href='/tempo#createCustomActivity' id='add'> Create a Custom Activity </a>";
          // html += " <div class='createCustomActivity'> </div> ";
	        $(that.el).html(html);  
       	};

        // Get users's specific custom activities
        this.customActivities.url = "/api/users/"+ this.user.id + "/custom_activities?token=" + Cookies.get('login-token');
       	this.customActivities.fetch({
       		success: function(data){
       			renderData(data.models);
       		},
          error: function(data){
            console.log("ERROR");
          },
          	dataType: "json",
          	data: {"interests": this.interests, "time": this.time}       		
       	});
    }
  });

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
    events: {
        "click .del-btn":"deleteActivity",
        "click .edit-btn": "editActivity"
    },
    initialize: function(options){
      this.options = options;
      this.customActivities = new CustomActivities();
      this.activities = new Activities();
    },
    renderData : function(data){
      var that = this;
      var templateData = [];
      //Iterate throught he collections of Activities and create a template
      data.each(function(model){
        templateData.push({"title": model.get("title"), "content" : model.get("content"), 
                            "time": model.get("completion_time"), "id" : model.get("id")})
      });
      var template = JST["backbone/templates/activities/customActivity"]({
        data: templateData,
        name: that.user.name
      });
      this.$el.html(template);
    },
    render : function (options){
      // Set scope, construct new activity collection, call fetch, render data on callback function
      var that = this; // To fix callback scoping error	
      this.user = options.user;

      // Get users's specific custom activities
      this.customActivities.url = "/api/users/"+ this.user.id + "/custom_activities?token=" + Cookies.get('login-token');
     	this.customActivities.fetch({
     		success: function(data){
     			that.renderData(data);
     		},
        error: function(data){
          console.log("ERROR");
        },
        	dataType: "json",
        	data: {"interests": this.interests, "time": this.time}       		
     	});
    },
    deleteActivity: function(options){
      //DELETE /api/users/:id/custom_activities/:cid
      var that = this; // To fix callback scoping error 
      var activityId = options.currentTarget.id;
      var activity = new CustomActivity();
      activity.url = "/api/users/" + this.user.id + "/custom_activities/" + activityId;
      var token = Cookies.get('login-token');
      activity.attributes = {token:token, id:activityId};
      activity.destroy({data : activity.attributes, processData: true,
          success: function(userSession, response) {
              console.log("success");
              //remove custom activity from the DOM
              if (response.status === 1) {
                notie.confirm('Are you sure you want to delete this Activity?', 'Yes', 'Cancel', function() {
                  notie.alert(1, 'Activity Deleted!', 1.5);
                  $(".activity."+activityId).remove();
                });
              } else {
                notie.alert(4, "Custom activity could not be deleted.", 1.5);
              }
          },
          error: function(userSession, response) {
              console.log("failure!");
          }
      });
    },   
    editActivity: function(event) {
      // clickedCustomActivity = this.customActivities.get(event.currentTarget.id);
      // var editView = new EditCustomActivityView({activity: clickedCustomActivity});
      // editView.render();
      window.location = "/tempo#customActivities/" + event.currentTarget.id;
    }
  });


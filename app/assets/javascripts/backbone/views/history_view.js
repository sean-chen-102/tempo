// Custom Activity View
var HistoryView = Backbone.View.extend({
    el: ".testDiv",
    tagName : 'li',
    options: null,
    user: null,
    completedActivities: null,
    events: {
        // "click .del-btn":"deleteActivity"
        "click .share-button":"share"  
    },
    initialize: function(options){
      this.options = options;
    },
    saveCustData: function(data){
      var that = this;
      var custData = [];
      data.each(function(model){
        custData.push({"title": model.get("title"), "time": model.get("completion_time"),
                     "id" : model.get("id")})
      });
      this.custData = custData;

      var activities = new CompletedActivities();
      activities.url = "/api/users/"+ this.user.id + "/completed_activities";
      activities.fetch({
        success: function(data){
          that.renderData(data);
        },
        error: function(data){
          console.log("ERROR");
        },
        dataType: "json",
        data: {"token": Cookies.get('login-token')}           
      });
    },
    renderData : function(data){
      var that = this;
      var templateData = [];
      //Iterate throught he collections of Activities and create a template
      data.each(function(model){
        templateData.push({"title": model.get("title"), "time": model.get("completion_time"),
                           "id" : model.get("id")})
      });

      var template = JST["backbone/templates/activities/history"]({
        data: templateData,
        custData: that.custData,
        name: that.user.name
      });
      this.$el.html(template);
    },
    render : function (options){
      // Set scope, construct new activity collection, call fetch, render data on callback function
      var that = this; // To fix callback scoping error	
      this.user = options.user;

      // Get users's specific custom activities
      var custActivities = new CompletedCustomActivities();
      custActivities.url = "/api/users/"+ this.user.id + "/completed_custom_activities";
     	custActivities.fetch({
     		success: function(data){
     			that.saveCustData(data);
     		},
        error: function(data){
          console.log("ERROR");
        },
        dataType: "json",
        data: {"token": Cookies.get('login-token')}       		
     	});
    }, 
    share: function(event) {
      var button = event.currentTarget.id;
      var id = button.split("-")[1];
      var location = window.location.href;
      var link = location.split("#")[0];
      link = link + "#activities/"  + id;
      var $temp = $("<input>");
      $("body").append($temp);
      $temp.val(link).select();
      document.execCommand("copy");
      $temp.remove();
      notie.alert(4, "Link copied to your clipboard!", 1.5);
    } 
  });


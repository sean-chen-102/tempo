var ActivityCustomView = Backbone.View.extend({
    el: ".testDiv",
    tagName: "li",
    options: null,
    activity: null,
    activity_id: null,
    initialize: function(options){
      this.options = options;
      this.activity_id = options['id'];
      this.history = options['history'];
    },
    renderData: function(data){
        if(this.history){
            var backLink = 'history';
        } else {
            var backLink = 'activities';
        }
        var template = JST["backbone/templates/activities/activityCustom"]({
              title: data['title'],
              content: data['content'],
              completion_time: data['completion_time'],
              id: data['id'],
              backLink: backLink,
          });
        $(this.el).html(template);
    },
    render: function(options){
        //mark activity as complete because it has been viewed
        this.markAsComplete(options);
        var that = this;
        this.user = options['user'];
        var activity = new CustomActivity();
        activity.id = this.activity_id;
        activity.url = "/api/users/" + this.user.id + "/custom_activities/" + this.activity_id;
        this.activity = activity;
        this.activity.fetch({
            success: function(data){
                that.renderData(data.attributes['custom_activity']);
            },
            data: {"token": Cookies.get('login-token')}
        });
    },
    markAsComplete: function(options){
        console.log("marking custom as complete");
        var activity = new Activity();
        activity.url = "/api/custom_activities/" + this.activity_id + "/complete";
        var token = Cookies.get('login-token');
        activity.attributes = {id:this.activity_id, user_id:options.user.id,
                              token:token};
        activity.save(activity.attributes,
            {
            success: function(userSession, response) {
                console.log("activity complete!");
            },
            error: function(userSession, response) {
                console.log("failure!");
            }
        });
    }
  });
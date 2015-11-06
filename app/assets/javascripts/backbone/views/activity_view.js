var ActivityView = Backbone.View.extend({
    el: ".testDiv",
    tagName: "li",
    options: null,
    activity: null,
    activity_id: null,
    events: {
        "click .like-btn":"makeLikeRequest",
        "click .dislike-btn":"makeDislikeRequest",
    },
    initialize: function(options){
      this.options = options;
      this.activity_id = options['id'];
    },
    renderData: function(data){
        var template = JST["backbone/templates/activities/activity"]({
              title: data['title'],
              content: data['content'],
              completion_time: data['completion_time'],
              content_type: data['content_type'],
              link: data['link'],
              id: data['id'],
              likes: data['like_count']
          });
        $(this.el).html(template);
    },
    render: function(options){
        console.log("activity view render call");
        var that = this;
        this.user = options['user'];
        var activity = new Activity();
        activity.id = this.activity_id;
        activity.url = "/api/activities/" + this.activity_id;
        this.activity = activity;
        this.activity.fetch({
            success: function(data){
                that.renderData(data.attributes['activity']);
            }
        });
    },
    makeLikeRequest : function(options){
        //called when the like button is clicked
        console.log("liked");
        var activity = new Activity();
        activity.url = "/api/activities/" + this.activity_id + "/like";
        var token = Cookies.get('login-token');
        // activity.attributes = {id:this.activity_id, user_id:this.user.id,
        //                       token:token};
        activity.save({
            id:this.activity_id, user_id:this.user.id,
                token:token},
            {
            success: function(userSession, response) {
                if (response['status']== -1){
                    console.log("user already liked activity");
                } else {
                    console.log("liked!");
                    $("#like-count").html(response['like_count'])
                }
            },
            error: function(userSession, response) {
                console.log("failure!");
            }
        });
    },
    makeDislikeRequest : function(options){
        //called when the dislike button is clicked
        console.log("disliked");
        var activity = new Activity();
        activity.url = "/api/activities/" + this.activity_id + "/dislike";
        var token = Cookies.get('login-token');
        // activity.attributes = {id:this.activity_id, user_id:this.user.id,
        //                       token:token};
        activity.save({
            id:this.activity_id, user_id:this.user.id,
                token:token},
            {
            success: function(userSession, response) {
                if (response['status']== -1){
                    console.log("user already disliked activity");
                } else {
                    console.log("disliked!");
                    $("#like-count").html(response['like_count'])
                }
            },
            error: function(userSession, response) {
                console.log("failure!");
            }
        });
    },
  });
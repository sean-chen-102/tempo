var ActivityView = Backbone.View.extend({
    el: ".testDiv",
    tagName: "li",
    options: null,
    activity: null,
    activity_id: null,
    events: {
        "click .like-btn":"makeLikeRequest",
        "click .dislike-btn":"makeDislikeRequest",
        "click #share": "share",
    },
    initialize: function(options){
      this.options = options;
      this.activity_id = options['id'];
      this.history = options['history'];
      this.link = "";
    },
    renderData: function(data){
        if(data['link'] == "N/A"){
            data['link'] = 'javascript:;';
        }
        this.link = data['link'];
        if(this.history){
            var backLink = '/tempo#history';
        } else {
            var backLink = '/tempo#activities';
        }

        if(data['content_type'] == "video"){
            data['content'] = "<div class='content-video'><iframe width='580' height='300' src='"
                + data['link'] + "'"
                + " frameborder='0' allowfullscreen></iframe></div>";
        }

        var template = JST["backbone/templates/activities/activity"]({
              title: data['title'],
              content: data['content'],
              completion_time: data['completion_time'],
              content_type: data['content_type'],
              link: data['link'],
              id: data['id'],
              likes: data['like_count'],
              dislikes: data['dislike_count'],
              backLink: backLink,
          });
        $(this.el).html(template);
    },
    render: function(options){
        console.log("activity view render call");
        //mark activity as complete because it has been viewed
        this.markAsComplete(options);
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
    markAsComplete: function(options){
        var activity = new Activity();
        activity.url = "/api/activities/" + this.activity_id + "/complete";
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
    },
    makeLikeRequest : function(options){
        //called when the like button is clicked
        console.log("liked");
        var activity = new Activity();
        activity.url = "/api/activities/" + this.activity_id + "/like";
        var token = Cookies.get('login-token');
        activity.attributes = {id:this.activity_id, user_id:this.user.id,
                              token:token};
        activity.save(activity.attributes,
            {
            success: function(userSession, response) {
                if (response['status']== -1){
                    console.log("user already liked activity");
                } else {
                    console.log("liked!");
                    $("#like-count").html(response['like_count']);
                    $("#dislike-count").html(response['dislike_count']);
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
        activity.attributes = {id:this.activity_id, user_id:this.user.id,
                              token:token};
        activity.save(activity.attributes,
            {
            success: function(userSession, response) {
                if (response['status']== -1){
                    console.log("user already disliked activity");
                } else {
                    console.log("disliked!");
                    $("#like-count").html(response['like_count']);
                    $("#dislike-count").html(response['dislike_count']);
                }
            },
            error: function(userSession, response) {
                console.log("failure!");
            }
        });
    },
    share : function() {
        var $temp = $("<input>");
        $("body").append($temp);
        $temp.val(this.link).select();
        document.execCommand("copy");
        $temp.remove();
        notie.alert(4, "Link copied to your clipboard!", 1.5);
    }
  });

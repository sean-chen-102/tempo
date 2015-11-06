var ActivityView = Backbone.View.extend({
    el: ".testDiv",
    tagName: "li",
    options: null,
    activity: null,
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
              id: data['id']
          });
        $(this.el).html(template);
    },
    render: function(){
        console.log("activity view render call");
        var that = this;
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
    },
    makeDislikeRequest : function(options){
        //called when the dislike button is clicked
        console.log("disliked");
    },
  });

var ActivityView = Backbone.View.extend({
    tagName: "li",
    options: null,
    events: {
        "click a": "clicked"
    },
    initialize: function(options){
      this.options = options;
    },
    clicked: function(e){
        e.preventDefault();
        console.log("creating new activityModal");
        modalView = new ActivityModalView({model: this.model}); 
        modalView.show();
        // alert(this.model.get('content'));
    },

    render: function(){
        console.log("activity view render call");
        var that = this;
        var template = JST["backbone/templates/activities/test"]({
              title: that.model.get('title'),
          });
        $(this.el).append(template);

    }  
  });

var ActivitiesView = Backbone.View.extend({
    el: ".testDiv",
    tagName : 'ul',
    options: null,
    time: null,
    template: 'backbone/templates/activities/activityList',
    interests: [],
    activities : null,
    initialize: function(options){
      this.options = options;
      this.activities = new Activities();
    },
    render : function (options){
      console.log("I am rendering the activity view");
      console.log(this.activities);
      // Set scope, construct new activity collection, call fetch, render data on callback function
      var that = this; // To fix callback scoping error

      var renderData = function(data) {
        // TODO: Create and import handlebars for templating   

        // var template = JST["backbone/templates/activities/activityList"]({});
        // $(this.el).html(template);  

        var html = "<div class='actContainer'> <header id='activityTitle'> <h3> Activity List </h3> </header>"
              + "<section> <div class='tableContainer'> <table id='actTable' class='table table-bordered table-hover activityTable'> <thead> <tr> <th>Title</th><th>Type</th><th>Likes</th><th>Dislikes</th>"
              + " </tr> </thead>" 
              + " <tbody> ";

        //Iterate throught he collections of Activities and create a template
        console.log("activity");
        data.each(function(model){
          //jank way to determine if it's a custom activity
          if (model.get('activity_type') == "custom_activity"){
            html += "<tr class='tRow'>" 
                + "<td> <a href='/tempo#customActivity/" +model.get('id') + "'>" +  model.get('title') + " </a> </td>"
                + "<td id='contentType'> text </td>"
                + "<td id='likeCount'> 0 </td>"
                + "<td id='dislikeCount''> 0 </td>"
                + "</tr>";  
          } else {
            html += "<tr class='tRow'>" 
                + "<td> <a href='/tempo#activities/" +model.get('id') + "'>" +  model.get('title') + " </a> </td>"
                + "<td id='contentType'> " +  model.get('content_type') + " </td>"
                + "<td id='likeCount'> " +  model.get('like_count') + " </td>"
                + "<td id='dislikeCount''> " +  model.get('dislike_count') + " </td>"
                + "</tr>";  
          }
        });
        html += " </tbody> </table> </div> </section> <footer>";
        if (data['length'] == 0){
          html += "<div id='no-activities' style='color: #b51c1c;'>No activities found for the interests "
                  + "and amount of time selected</div> </footer> </div>";
        }
        //Adding activity link
        // html += " <a href='/activities#show' id='add'> Add activity </a>";
        $(that.el).html(html);  

      };

      //TODO: Find better way to do this
      var token = Cookies.get('login-token');
      console.log(this.time);
      if (this.activities.length > 0) {
        renderData(this.activities);
      } else if (this.time) {
        this.activities.fetch({
            success: function(data){
            renderData(data);
          },
          dataType: "json",
          data: {"interests": this.interests, "time": this.time, 
                 "user_id": options.user.id, "token":token}
        });
      } else {
          this.activities.fetch({
            success: function(data){
            renderData(data);
          },
          dataType: "json",
          data: {"interests": this.interests, "user_id": options.user.id,
                 "token":token}
        });
      }
     }
  });

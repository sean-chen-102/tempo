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
      // Set scope, construct new activity collection, call fetch, render data on callback function
      var that = this; // To fix callback scoping error

      var renderData = function(data) {
        // TODO: Create and import handlebars for templating   

        // var template = JST["backbone/templates/activities/activityList"]({});
        // $(this.el).html(template);  
        var html = "<div class='actContainer'> <header id='activityTitle'> <h3> Activity List </h3> </header>"
              + "<section> <div class='tableContainer'> <table id='actTable' class='table table-bordered table-hover activityTable'>"
              + " <tbody> ";

        //Iterate throught he collections of Activities and create a template
        data.each(function(model){
          //jank way to determine if it's a custom activity
          if (model.get('activity_type') == "custom_activity"){
            html += "<tr class='tRow'>" 
                + "<td> <a href='/tempo#customActivity/" +model.get('id') + "'>" +  model.get('title') + " </a> <br>"
                + "<div class='interest-type'> Custom </div></td>"
                + "</tr>";  
          } else {
            var completionTime = model.get("completion_time");
            var interest = model.get("interests")[0];
            if (interest === "Explain It Like I'm 5") {
              interest = "ELI5";
            }
            var icon = "";
            if (model.get("content_type") === "text") {
                icon = "<div class='icon'> <i class='fa fa-newspaper-o'></i> </div>";
            } else {
                icon = "<div class='icon'> <i class='fa fa-video-camera'></i> </div>";

            }
            var className = "";
            var count = model.get("like_count") - model.get('dislike_count');
            html += "<tr class='tRow'>" 
                + "<td> <a href='/tempo#activities/" +model.get('id') + "'>" +  model.get('title') + " </a> <br>"
                + "<div class='interest-type'>" + interest + "</div>"
                 + "<div class='completion-time'>" + completionTime + "</div>"
                + icon + "</td>"
                + "<td class='rating-cell'>" + "<p class='rating-text'>" + count +  "</p>  <div class='rating'> <i class='fa fa-signal'> </i> </div> </td>"
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
     }, 
     updateLikeCount : function(activityId, like, dislike) {
      var that = this;
      for (i = 0; i < this.activities.models.length; i++) {
        if (this.activities.models[i].id == activityId) {
            this.activities.models[i].attributes.like_count = like;
            this.activities.models[i].attributes.dislike_count = dislike;
            return;
        }
      }
     }
  });

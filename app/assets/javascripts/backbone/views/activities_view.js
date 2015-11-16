var ActivitiesView = Backbone.View.extend({
    el: ".testDiv",
    tagName : 'ul',
    options: null,
    time: null,
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
        var html = "<h4 style='color: #9b59b6;'> Activity List </h4> <br>"
              + "<table> <thead> <tr> <th>Title</th><th>Type</th><th>Likes</th><th>Dislikes</th>"
              + "<th colspan='3'></th> </tr> </thead>" 
              + " <tbody> ";

        //Iterate throught he collections of Activities and create a template
        console.log("activity");
        data.each(function(model){
          html += "<tr>" 
              + "<td> <a href='/tempo#activities/" +model.get('id') + "'>" +  model.get('title') + " </a> </td>"
              + "<td> " +  model.get('content_type') + " </td>"
              + "<td> " +  model.get('like_count') + " </td>"
              + "<td> " +  model.get('dislike_count') + " </td>"
              + "</tr>";  
        });
        html += " </tbody> </table> </br> ";
        if (data['length'] == 0){
          html += "<div id='no-activities' style='color: #9b59b6;'>No activities found for the interests "
                  + "and amount of time selected</div>";
        }
        //Adding activity link
        // html += " <a href='/activities#show' id='add'> Add activity </a>";
        $(that.el).html(html);  

      };

      //TODO: Find better way to do this
      if(this.time){
        this.activities.fetch({
            success: function(data){
            renderData(data);
          },
          dataType: "json",
          data: {"interests": this.interests, "time": this.time}
        });
      } else {
          this.activities.fetch({
            success: function(data){
            renderData(data);
          },
          dataType: "json",
          data: {"interests": this.interests}
        });
      }
     }
  });

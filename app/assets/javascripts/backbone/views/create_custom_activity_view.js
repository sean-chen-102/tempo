// Custom Activity View
var CreateCustomActivityView = Backbone.View.extend({
    el: ".createCustomActivity",
    options: null,
    events: {
      "click .submitCustomActivity": "createActivity"
    },
    time: null,
    interests: [],
    customActivities : null,
    activities : null,
    initialize: function(options){
      this.options = options;
      this.customActivities = new CustomActivities();
    },
    render : function (options){
      // Set scope, construct new activity collection, call fetch, render data on callback function
      var that = this;

      var renderData = function(){
        // TODO: Move HTML into templates
        var html = "<h3> Create New Custom Activity </h3>";
        html += '<form id="custom-activities-form" name="custom-activity"> '  
                + '<label for="title"> title: </label>'
                + '<input type="text" name"title" id="title" value="">'

                + '<label for="content"> content: </label>'
                + '<input type="text" name"content" id="content" value="">'

                + '<label for="completion_time"> completion time: </label>'
                + '<input type="text" name"completion_time" id="completition_time" value="">'
                + '<br> <button type="button" class="submitCustomActivity"> Submit </button> </form>';
        $('.createCustomActivity').html(html);
      };

      this.customActivities.fetch({
        success: function(data){
          renderData();
        }
      });
    },
    createActivity: function (e){
      alert("Test");
      var self = this,
        el = $(this.el);
      e.preventDefault();

      
      console.log($('#title').val());
      console.log($('#content').val());
      console.log($('#completion_time').val());

    } 
  });

// Custom Activity View
var CreateCustomActivityView = Backbone.View.extend({
    el: ".testDiv",
    options: null,
    events: {
      "click .submitCustomActivity": "createActivity"
    },
    time: null,
    interests: [],
    customActivities : null,
    activities : null,
    user : null,
    initialize: function(options){
      this.options = options;

      this.customActivities = new CustomActivities();
      this.model = new CustomActivity();
      // alert("initialized model for custom activity");
    },
    render : function (options){
      // Set scope, construct new activity collection, call fetch, render data on callback function
      var that = this;
      this.user = options.user;
      var renderData = function(){
        // TODO: Move HTML into templates
        var customActTemplate = JST["backbone/templates/activities/createCustomActivity"]();
        $('.testDiv').html(customActTemplate);
      };
      renderData();
    },
    createActivity: function (e){
      var self = this,
      el = $(this.el);
      e.preventDefault();

      var title = $('#title').val();
      var content = $('#content').val();
      var completion_time = $('#completion_time').val();

      this.model.attributes.title = title;
      this.model.attributes.content = content;
      this.model.attributes.completion_time = completion_time;
      this.model.attributes.token = Cookies.get('login-token');

      console.log(this.model.attributes);
      this.model.url = "/api/users/" + this.user.id + "/custom_activities";
      console.log("Going to create custom activity");

      this.model.save(this.model.attributes, {        
          success: function(userSession, response) {
            window.location = '/tempo#customActivities';
          },
         error: function(userSession, response) {
            alert("failure!");
          }
      });    
       // validate error(s) accessible in model.validationError
      if (this.model.validationError) {
          $("#warning").html(this.model.validationError);
      }  
    },
    deleteActivity: function(e){
      //DELETE /api/users/:id/custom_activities/:cid

    }
  });

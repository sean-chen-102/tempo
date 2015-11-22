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
      var model = new CustomActivity();
      model.attributes.title = title;
      model.attributes.content = content;
      model.attributes.completion_time = completion_time;
      model.attributes.token = Cookies.get('login-token');

      model.url = "/api/users/" + this.user.id + "/custom_activities";
      console.log("Going to create custom activity");

      model.save(model.attributes, {        
          success: function(userSession, response) {
            if (response.status === 1) {
              window.location = '/tempo#customActivities';
            } else {
              notie.alert(3, response.errors[0], 1.5);
            }
          },
         error: function(userSession, response) {
            alert("failure!");
          }
      });    
       // validate error(s) accessible in model.validationError
      if (model.validationError) {
          notie.alert(3, model.validationError, 1.5);
      }  
    }
  });

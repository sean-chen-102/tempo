// Custom Activity View
var EditCustomActivityView = Backbone.View.extend({
    el: ".testDiv",
    options: null,
    user_id:null,
    events: {
      "click .editActivityButton" : "editActivity",
    },
    interests: [],
    user : null,
    initialize: function(options){
      this.options = options;
      this.activity_id = options['id'];
      // this.customActivities = new CustomActivities();
      // alert("initialized model for custom activity");
    },
    render: function (options){
      // this.activity = this.options.activity.attributes;
      // console.log(this.options);
      // this.user_id = this.activity.user_id;
      // console.log(this.user_id);
      // Set scope, construct new activity collection, call fetch, render data on callback function
      var that = this;
      this.user_id = options.user.id;

      var activity = new CustomActivity();
      activity.id = this.activity_id;
      activity.url = "/api/users/" + options.user.id + "/custom_activities/" + this.activity_id;
      activity.fetch({
          success: function(data){
              console.log(data.attributes);
              that.renderData(data.attributes['custom_activity']);
          },
          data: {"token": Cookies.get('login-token')}
      });
    },
    renderData: function(data){
      // TODO: Move HTML into templates
      var that = this;
      var customActTemplate = JST["backbone/templates/activities/editCustomActivity"]({
        title: data['title'],
        content: data['content'],
        completion_time: data['completion_time']
      });
      $(this.el).html(customActTemplate);

      $(function() {
        $(".knob").knob({
          max: 60,
          min: 0,
          width: 150,
          height: 150,
          step: 1,
          fgColor: "#2C7EBF",
          inputColor: "#2C7EBF"
        });
        $(".knob").val(data['completion_time']).trigger('change');
      });
    },
    editActivity: function (e){
      var that = this;
      el = $(this.el);
      e.preventDefault();
      console.log(this.activity_id);
      console.log(this.user_id);

      var title = $('#title').val();
      var content = $('#content').val();
      var completion_time = $('#completion_time').val();
      var model = new CustomActivity();
      model.attributes.title = title;
      model.attributes.content = content;
      model.attributes.id = this.activity_id;
      model.attributes.completion_time = $('.knob').val();
      model.attributes.token = Cookies.get('login-token');
      console.log("hi");
      model.url = "/api/users/" + this.user_id + "/custom_activities/" + this.activity_id;
      model.save(model.attributes, {        
          success: function(userSession, response) {
            if (response.status === 1) {
              that.undelegateEvents();
              notie.alert(1, "Custom Activity Saved!", 1.5);
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
    },
    backButton : function() {
      window.location = "/tempo#customActivities"
    }
  });

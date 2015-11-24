var TempoRouter = Backbone.Router.extend({
    routes: {
      '': 'home',
      'home': 'home',
      'signup': 'signup',
      'login': 'login',
      "activities": "activities",
      "settings":"settings",
      "customActivities": "customActivities",
      "createCustomActivity": "createCustomActivity",
      "customActivities/:customActivity?activity=:activity": "editCustomActivity",
      "activities/:activity?history=:history":"activityHistory",
      "activities/:activity":"activity",
      "customActivity/:activity?history=:history":"customActivityHistory",
      "customActivity/:activity":"customActivity",
      "show": "show",
      "logout": 'logout',
      "history": "history",
    },

    highlightMenu: function(view) {
      $(".menuSelection li").removeClass("selected");
      console.log(view);
      console.log("hellow?");
      $("#" + view + " li").addClass("selected");

    },
    verifyUser: function(view) {
      console.log(Cookies.get("login-token"));
      console.log("Verify USer Called");
      console.log(Cookies.get("login-token"));
      var cookie = Cookies.get("login-token");
      var token = new Token();
      token.url += cookie;
      var response = {
        "status": false,
        "data": ""
      };
      if (cookie === "undefined" || cookie === undefined) {
        return this.renderView("login", "");
      } else {
        var that = this;
        token.fetch({
            success: function(data){
              $("#logout-button").show(); 
              that.renderView(view, data)
          }
      });
      }
    },
    renderView : function(view, data) {
      this.highlightMenu(view);
      console.log(view, data);
      console.log("renderView called");
      if (view === "login") {
        Backbone.history.navigate('login');  
        App.Views['loginView'].render();
      } else {
        var userData = data.attributes.user;
        var user = new User();
        user.username = userData.username;
        user.password = userData.password;
        user.id = userData.id;
        user.email = userData.email;
        user.name = userData.name;
        user.interests = userData.interests;
        App.Views[view].render({
            "user" : user
        });
      }
    },
    initialize: function() {
      App.Views['historyView'] = new HistoryView();
      App.Views['customActivitiesView'] = new CustomActivityView();
      App.Views['createCustomActivityView'] = new CreateCustomActivityView();
      App.Views['activitiesView'] = new ActivitiesView();
      App.Views['settingsView'] = new SettingsView();
      App.Views['loginView'] = new LoginView();
      App.Views['homeView'] = new HomeView({activitiesView: App.Views['activitiesView']});
      $("#logout-button").hide(); 
    },
    home: function() {
      console.log("The home router was called ");
      console.log(this.verifyUser("homeView"));
      this.verifyUser("homeView");

    },
    activities: function(){
      console.log("The activities router was called ");
      this.verifyUser("activitiesView");
   
    },
    history: function(){
      console.log("The history router was called");
      this.verifyUser("historyView");
    },
    settings: function(){
      console.log("The settings router was called ");
      this.verifyUser("settingsView");
     
    },
    activity: function(activity_id) {
      console.log("The activity router was called");
      console.log(activity_id);
      App.Views['activityView']= new ActivityView({id:activity_id, activitiesView: App.Views['activitiesView']});
      this.verifyUser("activityView");
    },
    activityHistory: function(activity_id, history) {
      console.log("The activityHistory router was called");
      App.Views['activityView']= new ActivityView({id:activity_id, history:history});
      this.verifyUser("activityView");
    },
    editCustomActivity: function(activity_id, activity) {
      console.log("The edit custom activity router was called");
      App.Views['editCustomActivity']= new editCustomActivity({id:activity_id, activity:activity});
      this.verifyUser("activityView");
    },
    customActivity: function(activity_id) {
      console.log("The custom activity router was called");
      App.Views['customActivityView']= new ActivityCustomView({id:activity_id, activitiesView: App.Views['activitiesView']});
      this.verifyUser("customActivityView");
    },
    customActivityHistory: function(activity_id, history) {
      console.log("The activityHistory router was called");
      App.Views['customActivityView']= new ActivityCustomView({id:activity_id, history:history});
      this.verifyUser("customActivityView");
    },
    customActivities: function(){
      console.log("The custom Activities router was called ");
      this.verifyUser("customActivitiesView");     
    },    
    createCustomActivity: function(){
      console.log("Creating a custom activity");
      this.verifyUser("createCustomActivityView");
    },
    signup: function(){
      console.log("The signup router was called ");
      //Constructing View 
      App.Views['signupView'] = new SignupView()
      App.Views['signupView'].render()      
    },
    login: function(){
      console.log("The login router was called ");
      //Constructing View 
      App.Views['loginView'].render()      
    },
    logout: function(){
      console.log("logout called");
      var token = new LogoutToken();
      var cookie = Cookies.get("login-token")
      if (cookie === "undefined" || cookie === undefined) {
        return;
      } else {
        var that = this;
        token.url += cookie;
        token.destroy({
            success: function(data){
              Cookies.set("login-token", undefined);
              $("#logout-button").hide(); 
              that.home();
            }
        });
      }
    }
  });
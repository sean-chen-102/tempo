var verifyUser = function(view) {
  var cookie = Cookies.get("login-token");
  var token = new Token();
  token.url += cookie;
  var response = {
    "status": false,
    "data": ""
  };
  if (cookie === "undefined" || cookie === undefined) {
    console.log('undefined');
    return renderView("login", "");
  } else {
    token.fetch({
        success: function(data){
          renderView(view, data)
      }, 
        failure: function(data) {
        return renderView("login", "");
      }
  });
  }
};


var renderView = function(view, data) {
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
};

var TempoRouter = Backbone.Router.extend({
    routes: {
      '': 'home',
      'home': 'home',
      'signup': 'signup',
      'login': 'login',
      "interests": "interests",
      "activities": "activities",
      "settings":"settings",
      "customActivities": "customActivities",
      "createCustomActivity": "createCustomActivity",
      "activities/:activity":"activity",
      "show": "show"
    },
    initialize: function() {
      App.Views['activityView'] = new ActivityView()
      App.Views['interestView'] = new InterestView()
      App.Views['customActivityView'] = new CustomActivityView()
      App.Views['createCustomActivityView'] = new CreateCustomActivityView()
      App.Views['activitiesView'] = new ActivitiesView();
      App.Views['settingsView'] = new SettingsView();
      App.Views['loginView'] = new LoginView();
      App.Views['homeView'] = new HomeView({interestView: App.Views['interestView'],
                                activitiesView: App.Views['activitiesView']});
    },
    home: function() {
      console.log("The home router was called ");
      verifyUser("homeView");

    },
    activities: function(){
      console.log("The activities router was called ");
      verifyUser("activitiesView");
   
    },
    activity: function(options) {
      console.log("The activity router was called");
      console.log(options);
      // App.Views[''].render();
    },
    interests: function(){
      console.log("The interests router was called ");
      verifyUser("interestView");
     
    },
    settings: function(){
      console.log("The settings router was called ");
      verifyUser("settingsView");
     
    },
    customActivities: function(){
      console.log("The custom Activities router was called ");
      verifyUser("customActivityView");     
    },    
    createCustomActivity: function(){
      console.log("Creating a custom activity");
      verifyUser("createCustomActivityView");
    },
    show: function(){
      //This route doesn't do anything yet
      console.log("The show router was called ");
      document.getElementById('add').style.color = 'green';
      var newNode = document.createElement("p");
      newNode.appendChild(document.createTextNode("This hasn't been implemented yet"));
      var refNode = document.getElementById("add");
      refNode.parentNode.insertBefore(newNode, refNode.nextSibling);      
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

  });
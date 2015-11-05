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
      App.Views['homeView'] = new HomeView();
      App.Views['activityView'] = new ActivityView()
      App.Views['interestView'] = new InterestView()
      App.Views['customActivity'] = new CustomActivityView()
      App.Views['createCustomActivity'] = new CreateCustomActivityView()
      App.Views['activitiesView'] = new ActivitiesView();
      App.Views['settingsView'] = new SettingsView();
      App.Views['loginView'] = new LoginView();
    },
    home: function() {
      var cookie = Cookies.get("login-token");
      var token = new Token();
      token.url += cookie;
      console.log("hi");
      console.log(token);
      if (cookie === "undefined" || cookie === undefined) {
          console.log('undefined cookie');
          Backbone.history.navigate('login');  
          App.Views['loginView'].render();
      } else {
        token.fetch({
            success: function(data){
              console.log(data.attributes.user);
              
              App.Views['homeView'].render({
                "name" : data.attributes.user.name
              });
          }, failure: function(data) {
            console.log('invalid cookie');
            Backbone.history.navigate('login');  
            App.Views['loginView'].render();
          } 
        });
      }
    },
    activities: function(){
      console.log("The activities router was called ");
      //Constructing View 
      App.Views['activitiesView'].render()    
    },
    activity: function(options) {
      console.log("The activity router was called");
      console.log(options);
      // App.Views[''].render();
    },
    interests: function(){
      console.log("The interests router was called ");
      //Constructing View 
      App.Views['interestView'].render()      
    },
    settings: function(){
      console.log("The settings router was called ");
      //Constructing View 
      App.Views['settingsView'].render()      
    },
    customActivities: function(){
      console.log("The custom Activities router was called ");
      //Constructing View 
      App.Views['customActivity'].render()      
    },    
    createCustomActivity: function(){
      console.log("Creating a custom activity");
      App.Views['createCustomActivity'].render();
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
      App.Views['SignupView'] = new SignupView()
      App.Views['SignupView'].render()      
    },
    login: function(){
      console.log("The login router was called ");
      //Constructing View 
      App.Views['loginView'].render()      
    },

  });
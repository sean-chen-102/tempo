var TempoRouter = Backbone.Router.extend({
    routes: {
      '': 'index',
      'home': 'home',
      'signup': 'signup',
      "interests": "interests",
      "activities": "activities",
      "show": "show"
    },
    initialize: function() {
      console.log("HEY");
      App.Views['homeView'] = new HomeView();
      App.Views['activityView'] = new ActivityView()
      App.Views['interestView'] = new InterestView()
    },
    index: function(){
      console.log("Index router is called");
      App.Views['homeView'].render();
    },
    home: function() {
      console.log("Home router is called");
      App.Views['homeView'].render();
    },
    activities: function(){
      console.log("The activities router was called ");
      //Constructing View 
      App.Views['activityView'].render()    
    },    
    interests: function(){
      console.log("The interests router was called ");
      //Constructing View 
      App.Views['interestView'].render()      
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

  });
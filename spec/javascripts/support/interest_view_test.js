describe("AppRouter routes", function() {
  beforeEach(function() {
    this.user = new UserLogin();
    this.user.save({
      "username" : "test",
      "password" : "test"
    })
    this.homeSpy = sinon.spy(TempoRouter.prototype, "home");
    this.loginSpy = sinon.spy(TempoRouter.prototype, "login");
    this.interestsSpy = sinon.spy(TempoRouter.prototype, "interests");
    this.settingsSpy = sinon.spy(TempoRouter.prototype, "settings");
    this.activitiesSpy = sinon.spy(TempoRouter.prototype, "activities");
    this.activitySpy = sinon.spy(TempoRouter.prototype, "activity");

    this.customActivitiesSpy = sinon.spy(TempoRouter.prototype, "customActivities");
    this.createCustomActivitySpy = sinon.spy(TempoRouter.prototype, "createCustomActivity");
    this.signupSpy = sinon.spy(TempoRouter.prototype, "signup");

    this.router = new TempoRouter;
    try {
      Backbone.history.start({silent:true, pushState:true});
    } catch(e) {}
    this.router.navigate("elsewhere");
  });

  afterEach(function() {
    TempoRouter.prototype.home.restore();
    TempoRouter.prototype.login.restore();
    TempoRouter.prototype.interests.restore();
    TempoRouter.prototype.settings.restore();
    TempoRouter.prototype.activities.restore();
    TempoRouter.prototype.activity.restore();
    TempoRouter.prototype.customActivities.restore();
    TempoRouter.prototype.createCustomActivity.restore();
    TempoRouter.prototype.signup.restore();
  });



});


describe("Routing when not logged in", function() {

});
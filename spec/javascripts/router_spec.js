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
    this.customActivitiesSpy = sinon.spy(TempoRouter.prototype, "customActivities");
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
    TempoRouter.prototype.customActivities.restore();
  });

  it("The home view is rendered when the user is logged in and routes to that view", function() {
    this.router.navigate("", true);
    expect(this.homeSpy.calledOnce).toBeTruthy();
  });

  it("The login view is rendered when the user is logged in and routes to that view", function() {
    this.router.navigate("login", true);
    expect(this.loginSpy.calledOnce).toBeTruthy();
  });

  it("The interests view is rendered when the user is logged in and routes to that view", function() {
    this.router.navigate("interests", true);
    expect(this.interestsSpy.calledOnce).toBeTruthy();
  });

  it("The settings view is rendered when the user is logged in and routes to that view", function() {
    this.router.navigate("settings", true);
    expect(this.settingsSpy.calledOnce).toBeTruthy();
  });

  it("The activities view is rendered when the user is logged in and routes to that view", function() {
    this.router.navigate("activities", true);
    expect(this.activitiesSpy.calledOnce).toBeTruthy();
  });


  it("The customActivities view is rendered when the user is logged in and routes to that view", function() {
    this.router.navigate("customActivities", true);
    expect(this.customActivitiesSpy.calledOnce).toBeTruthy();
  });


});


describe("Routing when not logged in", function() {
  beforeEach(function() {
    this.cookie = Cookies.get("login-token"); //essentially logging out
    Cookies.set("login-token", undefined);
    this.loginSpy = sinon.spy(TempoRouter.prototype, "home");
    this.router = new TempoRouter;

    try {
      Backbone.history.start({silent:true, pushState:true});
    } catch(e) {}
    this.router.navigate("elsewhere");
  });

  afterEach(function() {
    Cookies.set("login-token", this.cookie);

  });

  it("The home view is fired when routing to the root", function() {
    console.log("ramming speed!");
    this.router.navigate("", true);
    expect(this.loginSpy.calledOnce).toBeTruthy();
  });
});
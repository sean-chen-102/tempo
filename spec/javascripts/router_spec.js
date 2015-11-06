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

  it("The activity view is rendered when the user is logged in and routes to that view", function() {
    this.router.navigate("activities/3", true);
    expect(this.activitySpy.calledOnce).toBeTruthy();
  });

  it("The customActivities view is rendered when the user is logged in and routes to that view", function() {
    this.router.navigate("customActivities", true);
    expect(this.customActivitiesSpy.calledOnce).toBeTruthy();
  });


  it("The createCustomActivity view is rendered when the user is logged in and routes to that view", function() {
    this.router.navigate("createCustomActivity", true);
    expect(this.createCustomActivitySpy.calledOnce).toBeTruthy();
  });


  it("The signup view is rendered when the user is logged in and routes to that view", function() {
    this.router.navigate("signup", true);
    expect(this.signupSpy.calledOnce).toBeTruthy();
  });



});


describe("Routing when not logged in", function() {
  beforeEach(function() {
    this.stub = sinon.stub(TempoRouter.prototype, "verifyUser", function() {
      TempoRouter.prototype.renderView("login", "")
    });
    this.loginSpy = sinon.spy(TempoRouter.prototype, "renderView");
    this.router = new TempoRouter;

    try {
      Backbone.history.start({silent:true, pushState:true});
    } catch(e) {}
    this.router.navigate("elsewhere");
  });

  afterEach(function() {
    Cookies.set("login-token", this.cookie);
    TempoRouter.prototype.verifyUser.restore();
    TempoRouter.prototype.renderView.restore();

  });

  it("The login view is fired when routing to the root", function() {
    this.router.navigate("", true);
    expect(this.loginSpy.calledWith("login", "")).toBeTruthy();
  });

  it("The login view is fired when routing to the settings page", function() {
    this.router.navigate("settings", true);
    expect(this.loginSpy.calledWith("login", "")).toBeTruthy();
  });

    it("The login view is fired when routing to the interests page", function() {
    this.router.navigate("interests", true);
    expect(this.loginSpy.calledWith("login", "")).toBeTruthy();
  });

  it("The login view is fired when routing to the activities page", function() {
    this.router.navigate("activities", true);
    expect(this.loginSpy.calledWith("login", "")).toBeTruthy();
  });

   it("The login view is fired when routing to the customActivities page", function() {
    this.router.navigate("customActivities", true);
    expect(this.loginSpy.calledWith("login", "")).toBeTruthy();
  });

  it("The login view is fired when routing to the createCustomActivity page", function() {
    this.router.navigate("createCustomActivity", true);
    expect(this.loginSpy.calledWith("login", "")).toBeTruthy();
  });
});
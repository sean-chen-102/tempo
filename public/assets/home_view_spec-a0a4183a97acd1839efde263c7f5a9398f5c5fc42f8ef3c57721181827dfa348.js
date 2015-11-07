describe("Home View", function() {
  beforeEach(function() {
    this.user = new UserLogin();
    this.user.save({
      "username" : "test",
      "password" : "test"
    });
    this.user = {
      "username" : "test",
      "password" : "test",
      "name" : "test",
      "email" : "test@test.com"
    }
    this.homeSpy = sinon.spy(HomeView.prototype, "render");
    App.Views["HomeView"].render({
            "user" : this.user
      });
  });

  afterEach(function() {
    TempoRouter.prototype.home.restore();
  });

  it("The View is called with the correct user object", function() {
    expect(this.homeSpy.calledOnce).toBeTruthy();
  });

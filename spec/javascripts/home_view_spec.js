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
    App.Views["homeView"].render({
            "user" : this.user
      });
  });

  afterEach(function() {
    this.homeSpy.restore();
  });

  it("The View is called with the correct user object", function() {
    expect(this.homeSpy.calledWith({"user": this.user})).toBeTruthy();

  });
  it("The time selector should be defined", function() {
    expect($('#time-selector')).toBeDefined();
  });

});

describe("Home View Go", function() {
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
    this.goSpy = sinon.spy(HomeView.prototype, "makeGoRequest");
    $ = sinon.stub();
    $.returns("0");
    App.Views["homeView"].render({
            "user" : this.user
      });
    App.Views["homeView"].makeGoRequest({"user" : this.user});
  });


  afterEach(function() {
    this.homeSpy.restore();
  });

  // it("Go request should be called", function() {
  //   // expect(this.homeSpy.calledWith({"user": this.user})).toBeTruthy();
    
  // });

});
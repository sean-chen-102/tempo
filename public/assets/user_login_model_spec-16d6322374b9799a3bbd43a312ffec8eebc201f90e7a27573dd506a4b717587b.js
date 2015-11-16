describe("AppRouter routes", function() {
  beforeEach(function() {
    this.routeSpy = sinon.spy(TempoRouter.prototype, "home");
    this.router = new TempoRouter;
    try {
      Backbone.history.start({silent:true, pushState:true});
    } catch(e) {}
    this.router.navigate("elsewhere");
  });

  it("The home view is fired when routing to the root", function() {
    this.router.navigate("", true);
    expect(this.routeSpy.calledOnce).toBeTruthy();
  });
});

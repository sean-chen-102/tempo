describe("UserModel", function() {

  beforeEach(function() {
    this.user = new User();
    this.user.username = "AaronZ";
    this.user.password = "AaronZ";

  });

  it("should expose an attribute", function() {
    expect(this.user.username)
      .toEqual("AaronZ");
  });

});

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

   it("should not save when title is empty", function() {
	   var eventSpy = sinon.spy();
	   this.todo.bind("error", eventSpy);
	   this.user.save({"username": ""});
	   expect(this.user.validationError).toEqual("hi")
	 });

});

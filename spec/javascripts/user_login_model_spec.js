
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

   it("should save successfully", function() {
	   var eventSpy = sinon.spy();
	   this.user.bind("success", eventSpy);
     this.user.username = "";
	   this.user.save();
     console.log(this.user);
	   expect(this.user.validationError).toEqual("hi")
	 });

});
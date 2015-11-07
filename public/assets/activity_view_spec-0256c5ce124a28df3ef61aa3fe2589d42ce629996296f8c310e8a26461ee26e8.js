describe("Activity View", function() {
  var view, model;
  this.user = {
      "username" : "test",
      "password" : "test",
      "name" : "test",
      "email" : "test@test.com"
  };

  beforeEach(function () {
    view = new ActivityView({id:"3"});
  });

  describe('When view is constructing', function () {
    it ('should exist', function(){
      expect(view).toBeDefined();
    })
  });

  // describe('When view is rendered'), function () {
  //   beforeEach(function () {
  //     console.log("Hello world");
  //     console.log(view);
  //     // view.render({'user':this.user});
  //   });

    // it ('should render the correct title', function () {
    //   expect(view.$el.find('#title').toHaveValue('A Magical Answer to an 80-Year-Old Puzzle'));
    // });
  }

});

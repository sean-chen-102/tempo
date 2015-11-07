describe("Activity View", function() {
  var view, model, server;
  var user = {
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

  describe('When view is rendered', function () {
    beforeEach(function () {
      server = sinon.fakeServer.create();
      var responseData = '{"activity":{"id":3,"title":"A Magical Answer to an 80-Year-Old Puzzle",'
        + '"content":"Lorem ipsum dolor", "completion_time":20,"content_type":"text", '
        + '"link":"http://www.wired.com/2015/10/a-magical-answer-to-an-80-year-old-puzzle/",'
        + '"created_at":"2015-11-06T23:44:49.268Z","updated_at":"2015-11-06T23:44:49.268Z","like_count":0}}';
      server.respondWith('GET', '/api/activities/3',
        [
          200,
          {'Content-Type': 'application/json'},
          responseData
        ]);

      view.render({'user':user});
    });

    it ('should render the correct title', function () {
      console.log("hello");
      console.log(view.$el);
      server.respond();
      expect(view.$el.find('#title')).toEqual('A Magical Answer to an 80-Year-Old Puzzle');
    });
  });

});
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  Tempo.Routers.ActivitiesRouter = (function(superClass) {
    extend(ActivitiesRouter, superClass);

    function ActivitiesRouter() {
      return ActivitiesRouter.__super__.constructor.apply(this, arguments);
    }

    ActivitiesRouter.prototype.initialize = function(options) {
      this.activities = new Tempo.Collections.ActivitiesCollection();
      return this.activities.reset(options.activities);
    };

    ActivitiesRouter.prototype.routes = {
      "new": "newActivity",
      "index": "index",
      ":id/edit": "edit",
      ":id": "show",
      ".*": "index"
    };

    ActivitiesRouter.prototype.newActivity = function() {
      this.view = new Tempo.Views.Activities.NewView({
        collection: this.activities
      });
      return $("#activities").html(this.view.render().el);
    };

    ActivitiesRouter.prototype.index = function() {
      this.view = new Tempo.Views.Activities.IndexView({
        collection: this.activities
      });
      return $("#activities").html(this.view.render().el);
    };

    ActivitiesRouter.prototype.show = function(id) {
      var activity;
      activity = this.activities.get(id);
      this.view = new Tempo.Views.Activities.ShowView({
        model: activity
      });
      return $("#activities").html(this.view.render().el);
    };

    ActivitiesRouter.prototype.edit = function(id) {
      var activity;
      activity = this.activities.get(id);
      this.view = new Tempo.Views.Activities.EditView({
        model: activity
      });
      return $("#activities").html(this.view.render().el);
    };

    return ActivitiesRouter;

  })(Backbone.Router);

}).call(this);

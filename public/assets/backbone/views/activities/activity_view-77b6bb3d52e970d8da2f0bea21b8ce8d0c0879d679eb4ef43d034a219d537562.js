(function() {
  var base,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  (base = Tempo.Views).Activities || (base.Activities = {});

  Tempo.Views.Activities.ActivityView = (function(superClass) {
    extend(ActivityView, superClass);

    function ActivityView() {
      return ActivityView.__super__.constructor.apply(this, arguments);
    }

    ActivityView.prototype.template = JST["backbone/templates/activities/activity"];

    ActivityView.prototype.events = {
      "click .destroy": "destroy"
    };

    ActivityView.prototype.tagName = "tr";

    ActivityView.prototype.destroy = function() {
      this.model.destroy();
      this.remove();
      return false;
    };

    ActivityView.prototype.render = function() {
      this.$el.html(this.template(this.model.toJSON()));
      return this;
    };

    return ActivityView;

  })(Backbone.View);

}).call(this);

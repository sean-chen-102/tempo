(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  Tempo.Models.Activity = (function(superClass) {
    extend(Activity, superClass);

    function Activity() {
      return Activity.__super__.constructor.apply(this, arguments);
    }

    Activity.prototype.paramRoot = 'activity';

    Activity.prototype.defaults = {
      title: null,
      content: null,
      completion_time: null,
      content_type: null,
      link: null
    };

    return Activity;

  })(Backbone.Model);

  Tempo.Collections.ActivitiesCollection = (function(superClass) {
    extend(ActivitiesCollection, superClass);

    function ActivitiesCollection() {
      return ActivitiesCollection.__super__.constructor.apply(this, arguments);
    }

    ActivitiesCollection.prototype.model = Tempo.Models.Activity;

    ActivitiesCollection.prototype.url = '/activities';

    return ActivitiesCollection;

  })(Backbone.Collection);

}).call(this);

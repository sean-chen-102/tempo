(function() {
  var base,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  (base = Tempo.Views).Activities || (base.Activities = {});

  Tempo.Views.Activities.EditView = (function(superClass) {
    extend(EditView, superClass);

    function EditView() {
      return EditView.__super__.constructor.apply(this, arguments);
    }

    EditView.prototype.template = JST["backbone/templates/activities/edit"];

    EditView.prototype.events = {
      "submit #edit-activity": "update"
    };

    EditView.prototype.update = function(e) {
      e.preventDefault();
      e.stopPropagation();
      return this.model.save(null, {
        success: (function(_this) {
          return function(activity) {
            _this.model = activity;
            return window.location.hash = "/" + _this.model.id;
          };
        })(this)
      });
    };

    EditView.prototype.render = function() {
      this.$el.html(this.template(this.model.toJSON()));
      this.$("form").backboneLink(this.model);
      return this;
    };

    return EditView;

  })(Backbone.View);

}).call(this);

var ActivityModalView = Backbone.View.extend({
    id: 'base-modal',
    className: 'modal fade hide',
    template: 'backbone/templates/activities/modal',
    
    events: {
      'hidden': 'teardown'
    },
    
    initialize: function() {
       _.bindAll(this, 'show', 'teardown', 'render', 'renderView');
       this.render();
    },

    show: function() {
      console.log("in show for modal");
      // TODO: Modal isn't being displayed as a modal, check bootstrap?
      this.$el.modal('show');
    },

    teardown: function() {
      this.$el.data('modal', null);
      // TODO; This.remove isn't working?
      this.remove();
    },

    render: function() {
      var that = this;
      var home_template = JST[this.template]({
              title: that.model.get('title'),
              body: that.model.get('content'),
              completion_time: that.model.get('completion_time'),
              content_type: that.model.get('content_type')
          });
      this.$el.html(home_template);
      this.$el.modal({show:false});
      //this.getTemplate(this.template, this.renderView);
      return this;
    },
    
    renderView: function(template) {
      this.$el.html(template());
      this.$el.modal({show:false}); // dont show modal on instantiation
    }
});

Tempo.Views.Activities ||= {}

class Tempo.Views.Activities.IndexView extends Backbone.View
  template: JST["backbone/templates/activities/index"]

  initialize: () ->
    @collection.bind('reset', @addAll)

  addAll: () =>
    @collection.each(@addOne)

  addOne: (activity) =>
    view = new Tempo.Views.Activities.ActivityView({model : activity})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(activities: @collection.toJSON() ))
    @addAll()

    return this

class Tempo.Routers.ActivitiesRouter extends Backbone.Router
  initialize: (options) ->
    @activities = new Tempo.Collections.ActivitiesCollection()
    @activities.reset options.activities

  routes:
    "new"      : "newActivity"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newActivity: ->
    @view = new Tempo.Views.Activities.NewView(collection: @activities)
    $("#activities").html(@view.render().el)

  index: ->
    @view = new Tempo.Views.Activities.IndexView(collection: @activities)
    $("#activities").html(@view.render().el)

  show: (id) ->
    activity = @activities.get(id)

    @view = new Tempo.Views.Activities.ShowView(model: activity)
    $("#activities").html(@view.render().el)

  edit: (id) ->
    activity = @activities.get(id)

    @view = new Tempo.Views.Activities.EditView(model: activity)
    $("#activities").html(@view.render().el)

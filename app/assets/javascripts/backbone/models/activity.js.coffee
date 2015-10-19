class Tempo.Models.Activity extends Backbone.Model
  paramRoot: 'activity'

  defaults:
    title: null
    content: null
    completion_time: null
    content_type: null
    link: null

class Tempo.Collections.ActivitiesCollection extends Backbone.Collection
  model: Tempo.Models.Activity
  url: '/activities'

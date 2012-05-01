class app.collections.runs extends Backbone.PaginatedCollection
  model: app.models.run
  namespace: 'run'

  initialize: (models, options) ->
    @job = options.job if options.job
    super(models, options)

  parse: (resp) ->
    @count = resp.count
    @paginator.setCount(@count)
    resp.models

  fetch: ->
    super(data: jobId: @job.id)
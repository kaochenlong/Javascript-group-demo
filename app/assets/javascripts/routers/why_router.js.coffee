class WhyRoute extends Backbone.Router
  # urls mapping
  routes:
    "": "index"

  initialize: ->
    @reasons = new app.WhyCollection()
    @reasons.fetch()

  index: ->
    console.log "Hello, JavaScript!"
    main_view = new app.MainView
      collection: @reasons
      el:'#main-container'

@app = window.app ? {}
@app.WhyRoute = WhyRoute

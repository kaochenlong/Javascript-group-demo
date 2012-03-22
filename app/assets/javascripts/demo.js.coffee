@app = window.app ? {}
@app.init = ->
  new app.WhyRoute()
  Backbone.history.start()

$ ->
  app.init()

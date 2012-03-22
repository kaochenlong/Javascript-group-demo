
# ---------------------------------------------------
class WhyRoute extends Backbone.Router
  # urls mapping
  routes:
    "": "index"

  index: ->
    console.log "Hello, Javascript"
# ---------------------------------------------------
@app = window.app ? {}
@app.init = ->
  new WhyRoute()
  Backbone.history.start()
# ---------------------------------------------------
$ ->
  app.init()

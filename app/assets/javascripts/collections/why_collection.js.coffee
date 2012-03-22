class WhyCollection extends Backbone.Collection
  model: app.WhyModel
  url: '/reasons'

@app = window.app ? {}
@app.WhyCollection = WhyCollection

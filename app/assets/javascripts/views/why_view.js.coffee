class WhyView extends Backbone.View
  tagName: "tr"
  template: _.template('<td>你為什麼要<%= reason %>呢?</td>')

  render: (model) ->
    reason = model.get('reason')
    $(@el).html(@template({reason: reason}))
    @

@app = window.app ? {}
@app.WhyView = WhyView

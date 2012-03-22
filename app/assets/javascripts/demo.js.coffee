# ---------------------------------------------------------------
class WhyModel extends Backbone.Model
  urlRoot: '/reasons'
# ---------------------------------------------------------------
class WhyCollection extends Backbone.Collection
  model: WhyModel
  url: '/reasons'
# ---------------------------------------------------------------
class WhyView extends Backbone.View
  tagName: "tr"
  template: _.template('<td>你為什麼要<%= reason %>呢?</td>')

  render: (model) ->
    reason = model.get('reason')
    $(@el).html(@template({reason: reason}))
    @
# ---------------------------------------------------------------
class MainView extends Backbone.View
  events:
    'submit': 'submit_handler'

  initialize: ->
    @collection.on 'reset', @render, @

  template: _.template(
      '<h1>你為什麼要...?</h1>
        <p></p>
        <div class="content">
          <div class="row">
            <div class="span9">
            <form name="reason_form" id="reason_form">
              <input type="text" name="reason" id="reason" value="">
              <input type="submit" name="some_name" value="新增!">
            </form>
            <table class="table table-striped table-bordered">
              <tbody id="items"> </tbody>
            </table>
            </div>
          </div>
        </div>')

  submit_handler: (e) ->
    e.preventDefault()
    reason = $('#reason').val()

    if reason != ''
      # create a model
      model = new WhyModel({reason: reason})
      # append to view
      @add_item(model)
      # and save it!
      model.save()

  render: ->
    $(@el).html(@template(reasons: @reasons))
    @collection.map(@add_item)
    @

  add_item: (m) ->
    # create a item view
    item = new WhyView()
    # append to table
    $('#items').prepend(item.render(m).el)
# ---------------------------------------------------------------
class WhyRoute extends Backbone.Router
  # urls mapping
  routes:
    "": "index"

  initialize: ->
    @reasons = new WhyCollection()
    @reasons.fetch()

  index: ->
    console.log "Hello, JavaScript!"
    main_view = new MainView(collection: @reasons)
    $('#main-container').html(main_view.render().el)
# ---------------------------------------------------------------
@app = window.app ? {}
@app.Collection = WhyCollection
@app.init = ->
  new WhyRoute()
  Backbone.history.start()
# ---------------------------------------------------------------
$ ->
  app.init()

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
      model = new app.WhyModel({reason: reason})
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
    item = new app.WhyView()
    # append to table
    $('#items').prepend(item.render(m).el)

@app = window.app ? {}
@app.MainView = MainView

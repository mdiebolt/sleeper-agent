$ ->
  model = SleeperAgent.Model()

  updateModel = ->
    attributes = SleeperAgent.serializeForm('form')

    model.set attributes

    model.save()

  $(document).on 'change', 'form .quality', updateModel
  $(document).on 'mouseup', '.toggle', updateModel

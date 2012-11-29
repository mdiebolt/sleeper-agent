SleeperAgent.Edit = ->
  updateModel = ->
    today = (new XDate).toString('MM-dd-yy')

    model = SleeperAgent.Model()

    SleeperAgent.Model.find today, (foundModel) ->
      model = foundModel

      attributes = SleeperAgent.serializeForm('form')

      model.set attributes

      model.save()

  $(document).on 'change', 'form .quality', updateModel
  $(document).on 'mouseup', '.toggle', updateModel

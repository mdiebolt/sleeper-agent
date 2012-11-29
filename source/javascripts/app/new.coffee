SleeperAgent.New = ->
  today = (new XDate).toString('MM-dd-yy')

  SleeperAgent.Model.find today, (model) ->
    $('.sleep').attr('disabled', 'disabled').text("Sleeping since #{model.asleepSince()}")

  $(document).on 'click', '.sleep', (e) ->
    $target = $(e.currentTarget)

    return if $target.is('[disabled]')

    model = SleeperAgent.Model(
      time: (new Date)
    ).save()

    $target.attr('disabled', 'disabled').text("Sleeping since #{model.asleepSince()}")

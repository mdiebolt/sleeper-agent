$ ->
  model = SleeperAgent.Model()

  $(document).on 'change', 'form .quality', (e) ->
    $target = $(e.currentTarget)

    model.set 'sleepQuality', $target.val()
    model.set 'time', (new Date)

    model.save()

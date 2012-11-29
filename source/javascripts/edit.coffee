$ ->
  model = SleeperAgent.Model()

  $(document).on 'change', 'form .quality', (e) ->
    $target = $(e.currentTarget)

    model.set 'sleepQuality', $target.val()
    model.set 'time', (new Date)

    model.save()

  $(document).on 'mouseup', '.toggle', (e) ->
    $target = $(e.currentTarget)

    attributeName = $target.attr('name').trim().replace /(\-|_|\s)+(.)?/g, (match, separator, chr) ->
      if chr then chr.toUpperCase() else ''

    model.set attributeName, $target.is('.active')

    model.save()

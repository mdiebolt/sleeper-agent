$ ->
  $(document).on 'click', '.sleep', (e) ->
    {persistence:fs} = SleeperAgent

    $target = $(e.currentTarget)

    return if $target.is('[disabled]')

    $target.attr('disabled', 'disabled').text('Sleeping...')

    date = new XDate

    fs.writeFile "#{date.toString('MM-dd-yy')}.txt", "#{date.toString('hh:mm:ss')}\n", (error, stat) ->
      ;

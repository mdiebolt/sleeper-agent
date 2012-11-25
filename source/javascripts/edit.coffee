$ ->
  today = (new XDate)

  $(document).on 'change', 'form .quality', (e) ->
    {persistence:fs} = SleeperAgent

    $target = $(e.currentTarget)

    fs.writeFile "#{today.toString('MM-dd-yy')}-details.txt", $target.val(), (error, stat) ->
      ;

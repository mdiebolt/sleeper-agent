SleeperAgent.namespace 'SleeperAgent', (sa) ->
  sa.Model = (attributes={}) ->
    attributes = attributes

    toJSON: ->
      attributes

    set: (attr, value) ->
      attributes[attr] = value

    save: (errorCB) ->
      today = XDate(attributes.time)

      sa.persistence.writeFile "sleep-log-#{today.toString('MM-dd-yy')}.txt", JSON.stringify(attributes), (error, stat) ->
        errorCB?(error)

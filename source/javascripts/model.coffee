SleeperAgent.namespace 'SleeperAgent', (sa) ->
  sa.Model = (attributes={}) ->
    attributes = attributes

    toJSON: ->
      attributes

    set: (attr, value) ->
      if value?
        attributes[attr] = value
      else
        Object.extend attributes, attr

    save: (errorCB) ->
      today = XDate(attributes.time)

      sa.persistence.writeFile "sleep-log-#{today.toString('MM-dd-yy')}.txt", JSON.stringify(attributes), (error, stat) ->
        errorCB?(error)

  sa.Model.find = (date, cb) ->
    sa.persistence.readFile "sleep-log-#{date}.txt", (error, data) ->
      cb?(sa.Model(JSON.parse(data)))

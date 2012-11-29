SleeperAgent.namespace 'SleeperAgent', (sa) ->
  sa.Model = (attributes={}) ->
    attributes = attributes

    asleepSince: ->
      return unless attributes.time?

      XDate(attributes.time.toString('hh:mm:ss'))

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
      if data?
        cb?(sa.Model(JSON.parse(data)))
      else
        return undefined

  sa.Model.findByName = (fullDate, cb) ->
    sa.persistence.readFile fullDate, (error, data) ->
      if data?
        cb?(sa.Model(JSON.parse(data)))
      else
        return undefined

  # sa.Model.findAll = (cb) ->
  #   output = []

  #   sa.persistence.readdir '/', (error, fileNames) ->
  #     if fileNames?
  #       output = $.map fileNames, (name, index) ->
  #         sa.Model.findByName name, (model) ->
  #           output.push model

  #   cb?(output)

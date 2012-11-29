Object.defaults = (target, objects...) ->
  for object in objects
    for name of object
      unless target.hasOwnProperty(name)
        target[name] = object[name]

  return target

Object.extend = (target, sources...) ->
  for source in sources
    for name of source
      target[name] = source[name]

  return target

String::camelize = ->
  @trim().replace /(\-|_|\s)+(.)?/g, (match, separator, chr) ->
    if chr then chr.toUpperCase() else ''

SleeperAgent.serializeForm = (formSelector) ->
  output = {}

  $(formSelector).find('[name]').map (index, el) ->
    $el = $(el)
    inputName = $el.attr('name').camelize()

    output[inputName] = $el.val() || $el.is('.active')

  output

$ ->
  window.addEventListener 'push', (detail) ->
    console.log detail

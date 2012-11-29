#= require_tree .

String::capitalize = ->
  this.charAt(0).toUpperCase() + this.substring(1).toLowerCase()

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
  window.addEventListener 'push', (event) ->
    # Create an a element and set the href to the new url,
    # which will automatically parse the parts of the URL
    parser = document.createElement 'a'
    parser.href = event.detail.state.url

    # Strip out leading "/" and ".html"
    pagename = parser.pathname.split(".")[0].substr(1)
    if pagename
      SleeperAgent[pagename.capitalize()]?()

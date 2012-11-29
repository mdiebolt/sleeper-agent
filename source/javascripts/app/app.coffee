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

createParser = (url) ->
  # Create an a element and set the href to the new url,
  # which will automatically parse the parts of the URL
  parser = document.createElement 'a'
  parser.href = url
  parser

# Calls a function corresponding to the page's name.
# @param pathname is a string of the page's name or pathname, e.g. "/page.html"
callPageFunction = (pathname) ->
  pagename = pathname
  if pagename[0] = '/'
    parser = createParser pathname
    # Strip out leading "/" and ".html"
    pagename = parser.pathname.substr(1).split(".")[0]

  # If the pagename isn't blank, try to call a function!
  if pagename
    SleeperAgent[pagename.capitalize()]?()

SleeperAgent.serializeForm = (formSelector) ->
  output = {}

  $(formSelector).find('[name]').map (index, el) ->
    $el = $(el)
    inputName = $el.attr('name').camelize()

    output[inputName] = $el.val() || $el.is('.active')

  output

SleeperAgent.init = ->
  # On the first and only page load, call that page's function
  callPageFunction window.location.pathname

  # On every push event call that page's functions
  window.addEventListener 'push', (event) ->
    callPageFunction event.detail.state.url

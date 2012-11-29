String::capitalize = ->
 this.charAt(0).toUpperCase() + this.substring(1).toLowerCase()

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

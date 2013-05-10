#config   = require 'lib/config'
mediator = require 'mediator'

Handlebars.registerHelper 'currentUrlPath', ->
  return window.location.pathname

Handlebars.registerHelper 'currentUrl', ->
  return window.location.href

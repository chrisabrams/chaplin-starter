mediator = require 'mediator'

Handlebars.registerHelper 'isAuthenticated', (block) ->

  if mediator.user.get('isAuthenticated')
    block.fn @
  else
    block.inverse @

Handlebars.registerHelper 'unlessAuthenticated', (block) ->

  if not mediator.user.get('isAuthenticated')
    block.fn @

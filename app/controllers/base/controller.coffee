Chaplin  = require 'chaplin'
mediator = require 'mediator'

module.exports = class Controller extends Chaplin.Controller

  initialize: (params) ->

    if params
      mediator.params = params

    super

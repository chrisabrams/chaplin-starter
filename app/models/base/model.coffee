Chaplin  = require 'chaplin'
mediator = require 'mediator'

module.exports = class Model extends Chaplin.Model
  defaults: {}

  initialize: (options) ->

    @options = _.extend {}, @options, @defaults, _.omit(options, ['collection', 'model'])

    super

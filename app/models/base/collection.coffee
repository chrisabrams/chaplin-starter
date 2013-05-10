#config  = require 'lib/config'
Chaplin = require 'chaplin'

module.exports = class Collection extends Chaplin.Collection
  defaults: {}

  initialize: (options) ->

    @options = _.extend {}, @options, @defaults, _.omit(options, ['collection', 'model'])

    super

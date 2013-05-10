Chaplin     = require 'chaplin'
Collection  = require 'models/base/collection'
mediator    = require 'mediator'
Model       = require 'models/base/model'

HeaderView  = require 'views/layout/header'

module.exports = class Layout extends Chaplin.Layout

  initialize: ->

    @headerView = new HeaderView

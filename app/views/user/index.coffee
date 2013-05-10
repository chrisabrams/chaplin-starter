mediator    = require 'mediator'
Model       = require 'models/base/model'
User        = require 'models/user'
View        = require 'views/base/view'

module.exports = class UserView extends View
  autoRender: yes
  container: '.layout-main'
  containerMethod: 'append'
  id: 'user-view'
  template: 'user/index'

  initialize: ->
    super

    @model.on 'change', @render, @

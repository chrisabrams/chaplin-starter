api      = require 'lib/api'
config   = require 'lib/config'
mediator = require 'mediator'
Model    = require 'models/base/model'

module.exports = class User extends Model

  init: ->

    d = new $.Deferred

    d.resolve()

    d

  setUser: (user) ->

    user.isAuthenticated = true
    @set user
    @trigger 'change'
    store.set 'user', user

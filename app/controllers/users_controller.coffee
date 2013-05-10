Collection      = require 'models/base/collection'
Controller      = require 'controllers/base/controller'
logger          = require 'lib/logger'
mediator        = require 'mediator'

User            = require 'models/user'

UserIndex       = require 'views/user/index'
IndexView       = require 'views/main/index'

SidebarWelcomeView = require 'views/sidebar/welcome'

module.exports = class UsersController extends Controller

  initialize: ->
    super

  index: (params) ->

    @model = new User({
      params: params
    })

    @view = new IndexView()

    @model.fetch().done =>

      @view.subview('user-index', new UserIndex({
        model: @model
      }))

    @view.subview('sidebar-welcome', new SidebarWelcomeView())

Chaplin                 = require 'chaplin'
Collection              = require 'models/base/collection'
Layout                  = require 'views/layout/layout'
logger                  = require 'lib/logger'
mediator                = require 'mediator'
routes                  = require 'routes'
WebsocketController     = require 'controllers/websocket_controller'
User                    = require 'models/user'

# The application object
module.exports = class Application extends Chaplin.Application
  # Set your application name here so the document title is set to
  # “Controller title – Site title” (see Layout#adjustTitle)
  title: 'Chaplin Example'

  initialize: ->

    # Template stuff
    @initTemplateHelpers()
    @initTemplatePartials()

    # Initialize core components
    @initDispatcher()
    @initMediator()

    # Application-specific scaffold
    @initPassiveControllers()

    mediator.user = new User store.get 'user'

    $xhr = mediator.user.init()

    $xhr.done =>

      @initStage(true)

    #$xhr.fail =>

  initComposer: (options) ->
    #@composer = new Composer options

  # Override standard layout initializer
  # ------------------------------------
  initLayout: ->
    # Use an application-specific Layout class. Currently this adds
    # no features to the standard Chaplin Layout, it’s an empty placeholder.
    @layout = new Layout {@title}

  # Instantiate common controllers
  # ------------------------------
  initPassiveControllers: ->

  # Create additional mediator properties
  # -------------------------------------
  initMediator: ->
    mediator.params = null
    #mediator.seal()

  initStage: (connectivity) ->
    # Register all routes
    @initRouter routes
    @initComposer()

    @initLayout()

    # start routing
    @startRouting()

    #mediator.publish 'client:connectivity:update', connectivity

    #new WebsocketController()

    #new FastClick(document.body)

  initTemplateHelpers: ->
    require 'templates/helpers/common'
    require 'templates/helpers/partials'
    require 'templates/helpers/user'

  initTemplatePartials: ->

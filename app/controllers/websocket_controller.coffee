Controller = require 'controllers/base/controller'
logger     = require 'lib/logger'
mediator   = require 'mediator'

module.exports = class WebsocketController extends Controller

  initialize: ->
    super

    logger.log 'Initializing the Websocket Controller'

    @subscribeEvent 'client:connectivity:update', @onClientConnectivityUpdate

    @establishSocketConnection()

  destroySocketConnection: ->

  establishSocketConnection: ->

    if io
      url = 'http://localhost:3031'

      @socket = io.connect(url, {
        'reconnect': true
        'reconnection delay': 500
      })

      @setupSocketEvents()

  normalizeData: (data) ->
    if typeof data is "string"
      data = JSON.parse data

    data

  onClientConnectivityUpdate: (online) ->

    if online
      @establishSocketConnection()

    else
      @destroySocketConnection()

  setupSocketEvents: ->

    #@socket.on 'some:message', (message) =>

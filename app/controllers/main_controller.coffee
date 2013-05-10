Collection      = require 'models/base/collection'
Controller      = require 'controllers/base/controller'
logger          = require 'lib/logger'
mediator        = require 'mediator'

IndexView       = require 'views/layout/main'
DefaultView     = require 'views/default/index'
ExampleView     = require 'views/default/example'

module.exports  = class MainController extends Controller

  index: (params) ->

    @view = new IndexView()
    @view.subview('default', new DefaultView())

  example: (params) ->

    index: (params) ->

    @view = new IndexView()
    @view.subview('example', new ExampleView())

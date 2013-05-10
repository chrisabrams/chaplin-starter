config   = require 'lib/config'
mediator = require 'mediator'

module.exports = (options) ->

  options.url  = "//#{config.api.host}#{config.api.path}" + options.url

  defaults =
    cache       : false
    data        : {}
    dataType    : 'json'
    headers:
      'Accept'  : ''
    timeout     : 10000
    type        : 'GET'
    #xhrFields   :
    #  withCredentials: true

  params = _.extend {}, defaults, options

  $.ajax params

Chaplin  = require 'chaplin'
mediator = require 'mediator'

module.exports = class View extends Chaplin.View

  # Precompiled templates function initializer.
  getTemplateFunction: ->
    @_cachedTemplateFunction ||= require("templates/#{@template}") if @template

  getFormData: (fields...) ->
    data = @$('form').formParams()

    if fields.length
      _.pick(data, fields...)
    else
      data

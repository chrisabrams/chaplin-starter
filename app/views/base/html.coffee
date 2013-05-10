mediator = require 'mediator'
View     = require 'views/base/view'

module.exports = class HtmlView extends View
  autoRender: yes

  render: ->
    super

    if @options.url
      @$el.load @options.url, _.bind(@trigger, @, 'htmlLoaded')

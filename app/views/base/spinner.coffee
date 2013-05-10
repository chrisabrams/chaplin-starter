View = require 'views/base/view'

module.exports = class Spinner extends View
  autoRender: yes
  className: 'spinner-container'
  container: '#page-container'

  attach: ->
    super

    @start()

  start: (options) ->
    @$el.spin
      lines: 11
      length: 0
      width: 4
      radius: 8
      corners: 1
      rotate: 0
      color: options?.color || '#ccc'
      speed: 1
      trail: 10
      shadow: no
      hwaccel: yes
      className: 'spinner'
      zIndex: 1
      top: 'auto'
      left: 'auto'

  stop: ->
    @$el.spin(false)

  dispose: ->
    @stop()
    super

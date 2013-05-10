mediator = require 'mediator'
View     = require 'views/base/view'

module.exports = class ModalView extends View
  attributes:
    role: 'dialog'
    'aria-hidden': true
    'tabindex': '-1'

  autoRender: yes
  className: 'modal hide fade'
  container: 'body'


  initialize: ->
    super

    @subscribeEvent '!router:route', => @$el?.modal('hide')

    #@$el.on 'hidden', _.bind(@dispose, @) #- not working :(

  attach: ->
    super

    @$el.modal().center()

    $('.modal-backdrop, .close').on 'click', _.bind(@dispose, @)

  hide: -> @$el?.modal 'hide'

  dispose: ->
    $('.modal-backdrop, .close').off 'click'
    $('.modal-backdrop').remove()
    
    super

mediator      = require 'mediator'
View          = require 'views/base/view'

module.exports = class HeaderView extends View
  autoRender: yes
  container: 'body'
  containerMethod: 'prepend'
  id: 'header'
  tagName: 'header'
  template: 'layout/header'

  events:
    'click a[href="#login"]': 'onLoginClick'
    'click a[href="#logout"]': 'onLogoutClick'

  initialize: ->
    super

    @listenTo mediator.user, 'change', @render

  onLoginClick: (e) ->
    e.preventDefault()

  onLogoutClick: (e) ->
    e.preventDefault()

  dispose: ->
    @stopListening mediator.user

    super

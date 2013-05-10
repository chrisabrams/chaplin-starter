mediator = require 'mediator'
View     = require 'views/base/view'

module.exports = class DefaultView extends View
  autoRender: yes
  container: '.layout-main'
  containerMethod: 'append'
  id: 'default-view'
  template: 'default/index'

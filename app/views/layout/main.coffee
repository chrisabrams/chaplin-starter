mediator = require 'mediator'
View     = require 'views/base/view'

module.exports = class IndexView extends View
  autoRender: yes
  container: '#page-container'
  containerMethod: 'append'
  id: 'index-view'
  template: 'layout/main'

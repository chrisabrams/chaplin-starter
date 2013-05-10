describe 'Links Collection', ->

  {Collection} = require 'chaplin'
  Links        = require 'models/links'

  links = null

  beforeEach ->
    links = new Links

  afterEach ->
    links.dispose()

  describe 'Structure', ->

    it 'should be able to extend Chaplin\'s Collection', (done) ->

      expect(links).to.be.an Object
      expect(links).to.be.a Collection

      done()

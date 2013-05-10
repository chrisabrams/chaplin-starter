Application = require 'application'

# Initialize the application on DOM ready event.
$ ->
  console.log "Starting up the application..."

  app = new Application()
  app.initialize()

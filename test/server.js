var connect = require('connect')
  , fs = require('fs')

connect.createServer(
  connect.static(__dirname)
).listen(4567);
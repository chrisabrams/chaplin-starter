fs = require 'fs'
sysPath = require 'path'

try
  require 'shelljs/global'
catch error
  console.log 'You will need to install "shelljs":'
  console.log 'npm install shelljs'
  process.exit(1)

task 'clean', 'Clean Dependencies', ->
  exec 'rm -rf node_modules'

task 'install', 'Install dependencies', ->
  exec 'npm install'
  exec 'grunt bower'

task 'test', 'Test', ->

  exec 'forever start test/server.js'
  exec 'grunt t'
  exec 'forever stop test/server.js'

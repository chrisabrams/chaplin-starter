// - Dependencies
var express = require('express'),
    hbs     = require('hbs'),
    path    = require('path'),
    util    = require('util'),
    app     = express(),
    port    = 4040

// - Server Settings

app.set('views', path.join(__dirname, '/public'));
app.set('view engine', 'hbs');
app.engine('hbs', hbs.__express);

app.use(express.static(__dirname + '/public'));

app.use(express.favicon());
app.use(express.logger('dev'));

app.use(express.query());
app.use(express.bodyParser());
app.use(express.cookieParser("whateveryouwantmetobe"));
app.use(express.methodOverride());

app.use(express.session());

// app.use(app.router);

var GAIgnoreIPs = [
  ''
]

var HostnamesIgnore = [
  ''
]

app.get('*', function(req, res) {
  var hostname = ( req.headers.host.match(/:/g) ) ? req.headers.host.slice( 0, req.headers.host.indexOf(":") ) : req.headers.host

  var ip = req.connection.remoteAddress,
      ignore = false;

  if(GAIgnoreIPs.indexOf(ip) > -1 || HostnamesIgnore.indexOf(hostname) > -1) {
    ignore = true;
  }

  res.render('index', {
    ignore: ignore,
    layout: false
  });
});

// - Start Up Server

app.listen(port);

util.log("Express server instance listening on port " + port);

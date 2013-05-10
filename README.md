chaplin-starter
===============

Simple boilerplate to offer structure when starting a new project.

## What's included
The structure of the app is primary based off of how [Brunch.io](http://brunch.io/) structures Chaplin apps; the main difference here is that I have replaced Brunch with Grunt.

### Primary Libraries
- [Backbone.js](http://backbonejs.org/)
- [Bower](http://bower.io/)
- [Chaplin.js](http://chaplinjs.org/)
- [Coffeescript](http://coffeescript.org/)
- [Grunt.js](http://gruntjs.com/)
- [Handlebars.js](http://handlebarsjs.com/)
- [Normalize.css](http://necolas.github.io/normalize.css/)
- [Nib](http://visionmedia.github.io/nib/)
- [Node.js](http://nodejs.org/)
- [Stylus](http://learnboost.github.io/stylus/)
- [Underscore.js](http://underscorejs.org/)

### Secondary Libraries (optional)
- [Fontello Icons](http://fontello.com/)
- [Socket.io](http://socket.io/)
- [Store.js](https://github.com/marcuswestin/store.js/)

## Getting Started
First clone this repo.

You will need Node.js in order to complete the following steps. Please [install Node.js](https://github.com/joyent/node/wiki/Installation) if you have not doen so.

Install these dependencies globally if you have not done so:

    npm install -g bower coffee-script grunt-cli

Then install these dependencies locally (run from root of this project):

    npm install

Now let's get some dependencies from Bower:

    grunt bower

### Building the project
You'll need two tabs. The reason I do this is because node usually ends up running behind a web server such as [Nginx](http://nginx.org/) which involves splitting the server and build process from each other anyway.

The first tab starts the node server:

    node server.js

The second tab builds and watches the project:

    grunt w

## Todo
- Make installing dependencies one command.

module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - ' +
      '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
      '<%= pkg.homepage ? "* " + pkg.homepage + "\\n" : "" %>' +
      '* Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %>;' +
      ' Licensed <%= _.pluck(pkg.licenses, "type").join(", ") %> */\n'

    bower:
      install:
        options:
          targetDir: './vendor/scripts/bower'
          cleanup: false
          install: true

    clean:
      dist: ['public/', 'tmp/']
      test: ['test/public', 'tmp/']

    coffee:
      dist:
        expand: yes
        cwd: 'app/'
        src: '**/*.coffee'
        dest: 'tmp/'
        ext: '.js'
      test:
        files:
          'test/public/js/test.js': "test/unit/**/*.coffee"

    commonjs:
      modules:
        cwd: 'tmp/'
        src: ['**/*.js']
        dest: 'tmp/'

    concat:
      distCss:
        src: [
          'vendor/styles/normalize-1.0.1.css'
          'vendor/styles/animation.css'
          'tmp/css/app.css'
          'vendor/styles/helpers.css'
        ]
        dest: 'public/css/app.css'
      devJs:
        files:
          'public/js/app.js': '<%= jsFiles %>'

    copy:
      dist:
        files: [
          {
            expand: true
            cwd: 'app/assets/'
            src: ['**']
            dest: 'public/'
            filter: 'isFile'
          }
        ]
      test:
        files: [
          {
            expand: true
            cwd: 'app/assets/'
            src: ['**']
            dest: 'test/public/'
            filter: 'isFile'
          }
        ]

    handlebars:
      dist:
        files: grunt.file.expandMapping(['app/templates/**/*.hbs'], 'tmp/templates/', {
          rename: (destBase, destPath) ->
            return destBase + destPath.split('app/templates/')[1].replace /\.hbs$/, '.js'
        })

    livereload:
      options:
        base: 'public',
      files: ['public/**/*']

    mincss:
      dist:
        files:
          "public/css/app.css": "public/css/app.css"

    stylus:
      dist:
        options:
          compress: false
          paths: ['app/css']
        files:
          'tmp/css/app.css': 'app/css/application.styl'

    jsFiles: [
      'vendor/scripts/before/before.js'
      'vendor/scripts/bower/commonjs/common.js'
      'vendor/scripts/bower/underscore/underscore.js'
      'vendor/scripts/bower/underscore.string/dist/underscore.string.min.js'
      'vendor/scripts/bower/backbone/backbone.js'
      'vendor/scripts/before/chaplin-0.8.1.js'
      'vendor/scripts/before/handlebars.js'
      'vendor/scripts/bower/store.js/store.js'
      'vendor/scripts/libs/**/*.js'
      'tmp/**/*.js'
      'vendor/scripts/before/after.js'
    ]

    mocha:
      test:
        src: "http://localhost:4567/index.html"
        mocha:
          ignoreLeaks: false
          timeout: 20000
        run: true

    uglify:
      options:
        mangle: false
      dist:
        files:
          'public/js/app.js': '<%= jsFiles %>'
      test:
        options:
          beautify: true
        files:
          'test/public/js/app.js': '<%= jsFiles %>'

    watch:
      assets:
        files: ['app/assets/**/*'],
        tasks: ['copy']
        options:
          debounceDelay: 50
      css:
        files: ['app/css/**/*.styl'],
        tasks: ['styles']
        options:
          debounceDelay: 50
      hbs:
        files: ['app/templates/**/*.hbs']
        tasks: ['scripts', 'concat:devJs']
        options:
          debounceDelay: 250
      js:
        files: ['app/**/*.coffee'],
        tasks: ['scripts', 'concat:devJs']
        options:
          debounceDelay: 250

  grunt.loadNpmTasks 'grunt-bower-task'
  grunt.loadNpmTasks 'grunt-commonjs'
  grunt.loadNpmTasks 'grunt-commonjs-handlebars'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-livereload'
  grunt.loadNpmTasks 'grunt-mocha'

  grunt.registerTask 'styles',  ['stylus', 'concat:distCss']
  grunt.registerTask 'scripts', ['coffee:dist', 'handlebars', 'commonjs']
  grunt.registerTask 'prep',    ['styles', 'scripts']
  grunt.registerTask 'b',       ['clean:dist', 'prep', 'concat:devJs', 'copy:dist']
  grunt.registerTask 'm',       ['clean:dist', 'prep', 'mincss:dist', 'uglify:dist', 'copy:dist']
  grunt.registerTask 't',       ['clean:test', 'prep', 'coffee:test', 'uglify:test', 'copy:test', 'mocha']
  grunt.registerTask 'w',       ['b', 'livereload', 'watch']

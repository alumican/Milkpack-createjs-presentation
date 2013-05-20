module.exports = (grunt) ->
  'use strict'

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.initConfig

    coffee:
      example:
        files:
          'deploy/script/application.js': 'src/**/*.coffee'

    watch:
      example:
        files:
          'src/**/*.coffee'
        tasks:
          'coffee:example'

  grunt.registerTask 'default', ['watch']

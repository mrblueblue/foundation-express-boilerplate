gulp = require 'gulp'
server = require 'browser-sync'
jade = require 'gulp-jade'
webpack = require 'webpack-stream'

gulp.task 'serve', () ->
  server
    port: process.env.PORT || 3000
    open: false
    server: 
      baseDir: 'dist'
      routes: 
         '/foundation': __dirname + '/node_modules/foundation-sites/'

  gulp.watch 'dist/*', server.reload

gulp.task 'jade', () ->
  gulp.src './src/index.jade'
    .pipe jade()
    .pipe gulp.dest './dist/'

gulp.task 'webpack:build', () ->
  gulp.src './src/app.js'
    .pipe webpack require './webpack.config.coffee' 
    .pipe gulp.dest './dist/'

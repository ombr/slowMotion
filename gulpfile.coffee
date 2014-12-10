gulp = require('gulp')
gutil = require('gulp-util')
bower = require('bower')
concat = require('gulp-concat')
sass = require('gulp-sass')
coffee = require('gulp-coffee')
slim = require('gulp-slim')
minifyCss = require('gulp-minify-css')
rename = require('gulp-rename')
sh = require('shelljs')
paths =
  sass: ['./scss/**/*.scss']
  coffee: ['./coffee/*.coffee']
  slim: ['./slim/**/*.slim']

gulp.task 'default', [ 'sass', 'coffee' ]

gulp.task 'slim', (done) ->
  gulp
    .src('./slim/**/*.slim')
    .pipe(slim())
    .pipe(gulp.dest('./www/'))
    .on('end', done)
  return

gulp.task 'coffee', (done) ->
  gulp
    .src('./coffee/*.coffee')
    .pipe(coffee(bare: true))
    .pipe(gulp.dest('./www/js/'))
    .on('end', done)
  return

gulp.task 'sass', (done) ->
  gulp
    .src('./scss/ionic.app.scss')
    .pipe(sass())
    .pipe(gulp.dest('./www/css/'))
    .pipe(minifyCss(keepSpecialComments: 0))
    .pipe(rename(extname: '.min.css'))
    .pipe(gulp.dest('./www/css/'))
    .on 'end', done
  return

gulp.task 'watch', ->
  gulp.watch paths.sass, ['sass']
  gulp.watch paths.coffee, ['coffee']
  gulp.watch paths.slim, ['slim']
  return

gulp.task 'install', ['git-check'], ->
  bower.commands.install().on 'log', (data) ->
    gutil.log 'bower', gutil.colors.cyan(data.id), data.message

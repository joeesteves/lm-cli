var gulp = require('gulp'),
  gutil = require('gulp-util'),
  coffee = require('gulp-coffee'),
  jade = require('gulp-jade'),
  inject = require('gulp-inject'),
  bowerFiles = require('main-bower-files'),
  webserver = require('gulp-webserver')

gulp.task('coffee', function() {
  gulp.src('app/**/*.coffee')
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(gulp.dest('dist/'))
});

gulp.task('css', function() {
  gulp.src('app/styles/*.css')
    .pipe(gulp.dest('dist/styles'))
});

gulp.task('injects', function () {
  var target = gulp.src('app/index.jade'),
    sources = gulp.src(['dist/**/*.js','dist/styles/*.css'], {read: false});
  return target.pipe(inject(sources))
    .pipe(inject(gulp.src(bowerFiles(), {read: false}), {name: 'bower'}))
    .pipe(gulp.dest('app'));
});

gulp.task('jade', function () {
  gulp.src('app/**/*.jade')
  .pipe(jade())
  .pipe(gulp.dest('dist/'));
});

gulp.task('webserver', function() {
  gulp.src('')
    .pipe(webserver({
      livereload: true,
      directoryListing: false,
      open: true
  }));
});


gulp.task('default',['coffee', 'css', 'injects', 'jade', 'webserver'], function() {
  gulp.watch('app/**/*.coffee', ['coffee', 'injects', 'jade']);
  gulp.watch('app/**/*.jade', ['jade']);

})

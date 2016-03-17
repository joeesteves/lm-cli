angular.module('Lm', ['ngRoute','googlechart'])
.run ($rootScope) ->
  # $rootScope.rootPath = 'http://lastmileapi.herokuapp.com/'
  # $rootScope.rootPath = 'http://localhost:3000/'
  # $rootScope.rootPath = 'http://181.16.9.39:3000/'
  $rootScope.rootPath = 'http://200.58.145.235:3000/'

angular.module('Lm', ['ngRoute'])
.run ($rootScope) ->
  # $rootScope.rootPath = 'http://lastmileapi.herokuapp.com/'
  $rootScope.rootPath = 'http://localhost:3000/'

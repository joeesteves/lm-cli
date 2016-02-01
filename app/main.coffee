angular.module('Lm', ['ngRoute'])
.run ($rootScope) ->
  $rootScope.rootPath = 'http://localhost:3000/'

angular.module('Lm', ['ngRoute']).run(function($rootScope) {
  return $rootScope.rootPath = 'http://localhost:3000/';
});

angular.module('Lm', ['ngRoute']).run(function($rootScope) {
  return $rootScope.rootPath = 'http://lastmileapi.herokuapp.com/';
});

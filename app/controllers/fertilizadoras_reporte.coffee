angular.module 'Lm'
.controller 'FertilizadorasReporteCtrl', ($routeParams, $rootScope, $scope, $http) ->
  ruta = $rootScope.rootPath + 'reporteador?tipo=' + $routeParams.tipo + '&precio_gasoil=' + $routeParams.precio_gasoil
  $http.get(ruta).then (resp) ->
    $scope.obj = resp.data

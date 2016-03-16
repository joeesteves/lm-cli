angular.module 'Lm'
.controller 'ReportesCtrl', ($routeParams, $rootScope, $scope, $http) ->
  ruta = $rootScope.rootPath + 'reporteador?tipo=' + $routeParams.tipo + '&precio_gasoil=' + $routeParams.precio_gasoil
  $scope.tarifa = $routeParams.tarifa || 1
  $scope.precio_gasoil = $routeParams.precio_gasoil
  $http.get(ruta).then (resp) ->
    $scope.obj = resp.data

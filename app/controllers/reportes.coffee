angular.module 'Lm'
.controller 'ReportesCtrl', ($routeParams, $rootScope, $scope, $http) ->
  ruta = $rootScope.rootPath + 'reporteador?tipo=' + $routeParams.tipo + '&precio_gasoil=' + $routeParams.precio_gasoil
  $scope.tarifa = $routeParams.tarifa || 1
  $scope.precio_gasoil = $routeParams.precio_gasoil
  $scope.total = 0
  $scope.addTotal = (importe) ->
    $scope.total += importe
    importe
  $scope.resetTotal = () ->
    total = $scope.total
    $scope.total = 0
    total

  $http.get(ruta).then (resp) ->
    $scope.obj = resp.data

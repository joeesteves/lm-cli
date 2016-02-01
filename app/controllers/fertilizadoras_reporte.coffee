angular.module 'Lm'
.controller 'FertilizadorasReporteCtrl', ($rootScope, $scope, $http) ->
  ruta = $rootScope.rootPath + 'reporteador'
  $http.get(ruta, {tipo: 'fertilizadoras'}).then (resp) ->
    $scope.obj = resp.data

angular.module 'Lm'
.directive 'detalle', ($rootScope, $http) ->
  restrict: 'E'
  # controller: 'LaboresCtrl'
  templateUrl: 'views/detalle/labores.html'
  link: (scope, e, attr) ->
    ruta = $rootScope.rootPath + attr.tipo
    $http.get(ruta+'?reporte='+attr.reporte)
    .then (resp) ->
      scope.coleccion = resp.data

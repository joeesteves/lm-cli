angular.module 'Lm'
.directive 'labores', ($rootScope, $http, $timeout) ->
  restrict: 'E'
  # controller: 'LaboresCtrl'
  # templateUrl: 'views/detalle/labores.html'
  link: (scope, e, attr) ->
    ruta = $rootScope.rootPath + 'labores'
    $http.get(ruta+'?reporte='+attr.reporte)
    .then (resp) ->
      scope.labores = resp.data
  controller: ($scope) ->
    $scope.getTotal = (maquina) ->
      total = 0
      m = $scope.labores.filter (item) ->
        item.maquina == maquina
      angular.forEach m[0].actividades, (act) ->
        total = total + parseFloat(act.superficie)
      total
  templateUrl: (e, attr) ->
    'views/detalle/labores.html'

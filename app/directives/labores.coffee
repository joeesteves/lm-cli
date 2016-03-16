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
    $scope.totalControl = {}
    $scope.acumula = (maquina, superficie) ->
      $scope.totalControl[maquina] = 0.00 if $scope.totalControl[maquina] == undefined
      $scope.totalControl[maquina] += parseFloat(superficie)
    $scope.totalActividad = {}
    $scope.charts = {}
    cols = [ {id: "t", label: "Actividad", type: "string"}, {id: "s", label: "Has", type: "number"} ]
    $scope.calculaTotales = ->
      $scope.labores.forEach (maquina) ->
        $scope.charts[maquina.maquina] = {'type': 'BarChart', 'options': {'title': 'Has. x act'} }
        rows = []
        $scope.totalActividad[maquina.maquina] = 0
        maquina.actividades.forEach (actividad) ->
          rows.push( {c: [ {v: actividad.nombre}, {v: actividad.superficie} ] } )
          $scope.totalActividad[maquina.maquina] += parseFloat(actividad.superficie)
        data = {'cols': cols, 'rows': rows }
        $scope.charts[maquina.maquina].data = data

    $timeout(
      ->
        $scope.calculaTotales()
      1000
    )

      # $scope.calculaTotales()
    $scope.getTotal = (maquina) ->
      total = 0
      m = $scope.labores.filter (item) ->
        item.maquina == maquina
      angular.forEach m[0].actividades, (act) ->
        total = total + parseFloat(act.superficie)
      total
  templateUrl: (e, attr) ->
    'views/detalle/labores.html'

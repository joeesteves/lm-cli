angular.module 'Lm'
.directive 'detalle', ($rootScope, $http, $timeout) ->
  restrict: 'E'
  # controller: 'LaboresCtrl'
  # templateUrl: 'views/detalle/labores.html'
  link: (scope, e, attr) ->
    ruta = $rootScope.rootPath + attr.tipo
    solo_gasoil = false
    if attr.tipo == 'gasoil'
      solo_gasoil = 1
      ruta = $rootScope.rootPath + 'mantenimientos'
    $http.get(ruta+'?reporte='+attr.reporte+'&solo_gasoil='+solo_gasoil)
    .then (resp) ->
      scope[attr.tipo] = resp.data
    $timeout(
      ->
        console.log 'tooltip'
        $('td').tooltip()
      2500
    )
  templateUrl: (e, attr) ->
    'views/detalle/' + attr.tipo + '.html'

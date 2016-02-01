angular.module 'Lm'
.controller 'FertilizadorasCtrl', ($rootScope, $scope, $http, Upload) ->
  ruta = $rootScope.rootPath + 'reporteador'

  # Utiliza la directiva uploadFile
  $scope.upload = (tipo, file) ->
    Upload.file(ruta, tipo, file)
    .then () ->
      $scope.css[tipo] = 'glyphicon-ok'
      $scope.div[tipo] = 'btn-success'
    .catch () ->
      $scope.css[tipo] = 'glyphicon-remove'
      $scope.div[tipo] = 'btn-danger'

  $scope.css_base = 'glyphicon upload-indicador '
  $scope.css = {labores: 'glyphicon-minus', mantenimiento: 'glyphicon-minus', compras: 'glyphicon-minus', sueldos: 'glyphicon-minus'}
  $scope.div_base = 'btn col-xs-2 '
  $scope.div = {labores: 'btn-info', mantenimiento: 'btn-info', compras: 'btn-info', sueldos: 'btn-info'}

  $scope.generar = () ->
    $http.get(ruta, {tipo: 'fertilizadoras'}).then (resp) ->
      $scope.obj = resp.data
      console.log(resp)

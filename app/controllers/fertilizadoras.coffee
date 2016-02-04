angular.module 'Lm'
.controller 'FertilizadorasCtrl', ($timeout, $rootScope, $scope, $http, Upload) ->
  ruta_rep = $rootScope.rootPath + 'reporteador'
  ruta_up = $rootScope.rootPath + 'uploader'

  reporte_nombre = 'fertilizadoras'
  reporte = ''
  # Utiliza la directiva uploadFile
  $scope.upload = (tipo, file, reporte_attr) ->
    reporte = reporte_attr || reporte_nombre
    Upload.file(ruta_up, tipo, file, reporte)
    .then () ->
      $scope.check_status(tipo)
    .catch () ->
      $scope.css[tipo] = 'glyphicon-remove'
      $scope.div[tipo] = 'btn-danger'

  $scope.css_base = 'glyphicon upload-indicador '
  $scope.css = {labores: 'glyphicon-minus', mantenimientos: 'glyphicon-minus', compras: 'glyphicon-minus', personas: 'glyphicon-minus'}
  $scope.div_base = 'btn col-xs-2 '
  $scope.div = {labores: 'btn-info', mantenimientos: 'btn-info', compras: 'btn-info', personas: 'btn-info'}

  $scope.generar = () ->
    $http.get(ruta_rep + '?tipo=' + reporte_nombre).then (resp) ->
      $scope.obj = resp.data
      console.log(resp)

  $scope.check_status = (tipo) ->
    # console.log tipo
    ruta_estado = $rootScope.rootPath + 'estados/check'
    ref = reporte + '_' + tipo
    $http.post(ruta_estado, {referencia: ref})
    .then (resp) ->
      switch resp.data
        when 'terminado'
          $scope.css[tipo] = 'glyphicon-ok'
          $scope.div[tipo] = 'btn-success'
        when 'proceso'
          $timeout(
            ->
              $scope.check_status(tipo)
            1000
          )
        else
          $scope.css[tipo] = 'glyphicon-remove'
          $scope.div[tipo] = 'btn-danger'
    .catch (e) ->
      console.log e

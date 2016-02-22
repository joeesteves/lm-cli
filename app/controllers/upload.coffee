angular.module 'Lm'
.controller 'UploaderCtrl', ($location, $timeout, $rootScope, $scope, $http, Upload) ->
  ruta_rep = $rootScope.rootPath + 'reporteador'
  ruta_up = $rootScope.rootPath + 'uploader'
  reporte_nombre = $location.path().replace('/','')
  reporte = ''
  $scope.precio_gasoil = 1
  # Utiliza la directiva uploadFile
  $scope.upload = (tipo, file, reporte_attr) ->
    reporte = reporte_attr || reporte_nombre
    Upload.file(ruta_up, tipo, file, reporte)
    .then () ->
      $scope.check_status(tipo)
    .catch () ->
      $scope.estado_upload[tipo] = 'error'

  $scope.estado_upload = {labores: 'inicial', mantenimientos: 'inicial', compras: 'inicial', personas: 'inicial', depreciaciones: 'inicial'}

  $scope.check_status = (tipo) ->
    # console.log tipo
    ruta_estado = $rootScope.rootPath + 'estados/check'
    ref = reporte + '_' + tipo
    $http.post(ruta_estado, {referencia: ref})
    .then (resp) ->
      switch resp.data
        when 'terminado'
          $scope.estado_upload[tipo] = 'terminado'
        when 'proceso'
          $timeout(
            ->
              $scope.check_status(tipo)
            1000
          )
        else
          $scope.estado_upload[tipo] = 'error'
    .catch (e) ->
      console.log e

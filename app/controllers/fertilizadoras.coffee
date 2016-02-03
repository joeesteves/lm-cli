angular.module 'Lm'
.controller 'FertilizadorasCtrl', ($timeout, $rootScope, $scope, $http, Upload) ->
  ruta_rep = $rootScope.rootPath + 'reporteador'

  # Utiliza la directiva uploadFile
  $scope.upload = (tipo, file) ->
    Upload.file(ruta_rep, tipo, file)
    .then () ->
      $scope.check_status(tipo)
    .catch () ->
      $scope.css[tipo] = 'glyphicon-remove'
      $scope.div[tipo] = 'btn-danger'

  $scope.css_base = 'glyphicon upload-indicador '
  $scope.css = {labores: 'glyphicon-minus', mantenimientos: 'glyphicon-minus', compras: 'glyphicon-minus', sueldos: 'glyphicon-minus'}
  $scope.div_base = 'btn col-xs-2 '
  $scope.div = {labores: 'btn-info', mantenimientos: 'btn-info', compras: 'btn-info', sueldos: 'btn-info'}

  $scope.generar = () ->
    $http.get(ruta + '?tipo=fertilizadoras').then (resp) ->
      $scope.obj = resp.data
      console.log(resp)

  $scope.check_status = (tipo) ->
    # console.log tipo
    ruta_estado = $rootScope.rootPath + 'estados/check'
    ref = 'fertilizadoras_' + tipo
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

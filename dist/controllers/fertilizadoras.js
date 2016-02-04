angular.module('Lm').controller('FertilizadorasCtrl', function($timeout, $rootScope, $scope, $http, Upload) {
  var reporte, reporte_nombre, ruta_rep, ruta_up;
  ruta_rep = $rootScope.rootPath + 'reporteador';
  ruta_up = $rootScope.rootPath + 'uploader';
  reporte_nombre = 'fertilizadoras';
  reporte = '';
  $scope.upload = function(tipo, file, reporte_attr) {
    reporte = reporte_attr || reporte_nombre;
    return Upload.file(ruta_up, tipo, file, reporte).then(function() {
      return $scope.check_status(tipo);
    })["catch"](function() {
      $scope.css[tipo] = 'glyphicon-remove';
      return $scope.div[tipo] = 'btn-danger';
    });
  };
  $scope.css_base = 'glyphicon upload-indicador ';
  $scope.css = {
    labores: 'glyphicon-minus',
    mantenimientos: 'glyphicon-minus',
    compras: 'glyphicon-minus',
    personas: 'glyphicon-minus'
  };
  $scope.div_base = 'btn col-xs-2 ';
  $scope.div = {
    labores: 'btn-info',
    mantenimientos: 'btn-info',
    compras: 'btn-info',
    personas: 'btn-info'
  };
  $scope.generar = function() {
    return $http.get(ruta_rep + '?tipo=' + reporte_nombre).then(function(resp) {
      $scope.obj = resp.data;
      return console.log(resp);
    });
  };
  return $scope.check_status = function(tipo) {
    var ref, ruta_estado;
    ruta_estado = $rootScope.rootPath + 'estados/check';
    ref = reporte + '_' + tipo;
    return $http.post(ruta_estado, {
      referencia: ref
    }).then(function(resp) {
      switch (resp.data) {
        case 'terminado':
          $scope.css[tipo] = 'glyphicon-ok';
          return $scope.div[tipo] = 'btn-success';
        case 'proceso':
          return $timeout(function() {
            return $scope.check_status(tipo);
          }, 1000);
        default:
          $scope.css[tipo] = 'glyphicon-remove';
          return $scope.div[tipo] = 'btn-danger';
      }
    })["catch"](function(e) {
      return console.log(e);
    });
  };
});

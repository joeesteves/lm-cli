angular.module('Lm').controller('FertilizadorasCtrl', function($timeout, $rootScope, $scope, $http, Upload) {
  var ruta_rep;
  ruta_rep = $rootScope.rootPath + 'reporteador';
  $scope.upload = function(tipo, file) {
    return Upload.file(ruta_rep, tipo, file).then(function() {
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
    sueldos: 'glyphicon-minus'
  };
  $scope.div_base = 'btn col-xs-2 ';
  $scope.div = {
    labores: 'btn-info',
    mantenimientos: 'btn-info',
    compras: 'btn-info',
    sueldos: 'btn-info'
  };
  $scope.generar = function() {
    return $http.get(ruta + '?tipo=fertilizadoras').then(function(resp) {
      $scope.obj = resp.data;
      return console.log(resp);
    });
  };
  return $scope.check_status = function(tipo) {
    var ref, ruta_estado;
    ruta_estado = $rootScope.rootPath + 'estados/check';
    ref = 'fertilizadoras_' + tipo;
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

angular.module('Lm').controller('FertilizadorasCtrl', function($rootScope, $scope, $http, Upload) {
  var ruta;
  ruta = $rootScope.rootPath + 'reporteador';
  $scope.upload = function(tipo, file) {
    return Upload.file(ruta, tipo, file).then(function() {
      $scope.css[tipo] = 'glyphicon-ok';
      return $scope.div[tipo] = 'btn-success';
    })["catch"](function() {
      $scope.css[tipo] = 'glyphicon-remove';
      return $scope.div[tipo] = 'btn-danger';
    });
  };
  $scope.css_base = 'glyphicon upload-indicador ';
  $scope.css = {
    labores: 'glyphicon-minus',
    mantenimiento: 'glyphicon-minus',
    compras: 'glyphicon-minus',
    sueldos: 'glyphicon-minus'
  };
  $scope.div_base = 'btn col-xs-2 ';
  $scope.div = {
    labores: 'btn-info',
    mantenimiento: 'btn-info',
    compras: 'btn-info',
    sueldos: 'btn-info'
  };
  return $scope.generar = function() {
    return $http.get(ruta, {
      tipo: 'fertilizadoras'
    }).then(function(resp) {
      $scope.obj = resp.data;
      return console.log(resp);
    });
  };
});

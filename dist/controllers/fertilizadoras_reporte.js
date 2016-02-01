angular.module('Lm').controller('FertilizadorasReporteCtrl', function($rootScope, $scope, $http) {
  var ruta;
  ruta = $rootScope.rootPath + 'reporteador';
  return $http.get(ruta, {
    tipo: 'fertilizadoras'
  }).then(function(resp) {
    return $scope.obj = resp.data;
  });
});

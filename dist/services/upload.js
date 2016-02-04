angular.module('Lm').factory('Upload', function($q, $rootScope, $http) {
  return {
    file: function(ruta, tipo, file, reporte) {
      var def, fd;
      def = $q.defer();
      fd = new FormData();
      fd.append('file', file);
      fd.append('tipo', tipo);
      fd.append('reporte', reporte);
      $http.post(ruta, fd, {
        headers: {
          'Content-Type': void 0
        },
        transformRequest: angular.identity
      }).then(function() {
        return def.resolve();
      })["catch"](function() {
        return def.reject();
      });
      return def.promise;
    }
  };
});

angular.module('Lm').directive('fileUpload', function() {
  return {
    restrict: 'A',
    link: function(scope, elm, attr) {
      return elm.bind('change', function() {
        scope.upload(attr.fileUpload, elm[0].files[0], attr.reporte);
        scope.css[attr.fileUpload] = 'glyphicon-time';
        return scope.div[attr.fileUpload] = 'btn-warning';
      });
    }
  };
});

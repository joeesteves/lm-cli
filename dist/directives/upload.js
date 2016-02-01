angular.module('Lm').directive('fileUpload', function() {
  return {
    restrict: 'A',
    link: function(scope, elm, attr) {
      return elm.bind('change', function() {
        scope.css[attr.fileUpload] = 'glyphicon-time';
        scope.div[attr.fileUpload] = 'btn-warning';
        return scope.upload(attr.fileUpload, elm[0].files[0]);
      });
    }
  };
});

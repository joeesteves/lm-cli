angular.module 'Lm'
.directive 'fileUpload', () ->
  restrict: 'A'
  link: (scope, elm, attr) ->
    elm.bind 'change', ->
      scope.css[attr.fileUpload] = 'glyphicon-time'
      scope.div[attr.fileUpload] = 'btn-warning'
      scope.upload(attr.fileUpload, elm[0].files[0])

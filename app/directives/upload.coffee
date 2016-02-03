angular.module 'Lm'
.directive 'fileUpload', () ->
  restrict: 'A'
  link: (scope, elm, attr) ->
    elm.bind 'change', ->
      scope.upload(attr.fileUpload, elm[0].files[0])
      scope.css[attr.fileUpload] = 'glyphicon-time'
      scope.div[attr.fileUpload] = 'btn-warning'

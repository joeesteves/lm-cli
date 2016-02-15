angular.module 'Lm'
.directive 'fileUpload', () ->
  restrict: 'A'
  link: (scope, elm, attr) ->
    elm.bind 'change', ->
      scope.upload(attr.fileUpload, elm[0].files[0], attr.reporte)
      scope.estado_upload[attr.fileUpload] = 'loading'
      $(elm).prev('span').text(elm[0].files[0].name)

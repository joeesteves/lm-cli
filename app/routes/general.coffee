angular.module 'Lm'
.config ($routeProvider) ->
  $routeProvider
  .when '/',
    templateUrl: '/views/main_nav.html'
  .when '/reporte/:tipo/:precio_gasoil',
    controller: 'FertilizadorasReporteCtrl'
    templateUrl: ($routeParams) ->
      '/views/' + $routeParams.tipo + '_reporte.html'
  .when '/:tipo',
    controller: 'UploaderCtrl'
    templateUrl: ($routeParams) ->
      '/views/' + $routeParams.tipo + '.html'

angular.module('starter', ['ionic'])
  .run ($ionicPlatform) ->
    $ionicPlatform.ready ->
      ionic.Platform.fullScreen(true, false)
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar true  if window.cordova and window.cordova.plugins.Keyboard
      StatusBar.hide()  if window.StatusBar
  .config ($stateProvider, $urlRouterProvider)->
    $stateProvider
      .state(
        'todos',
        url: '/todos',
        views: 
          'todos': 
            templateUrl: 'templates/todos.html'
            controller: 'todos'
      )
    $urlRouterProvider.otherwise('/todos')

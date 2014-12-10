angular.module('starter', ['ionic']).run(function($ionicPlatform) {
  return $ionicPlatform.ready(function() {
    ionic.Platform.fullScreen(true, false);
    if (window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
    }
    if (window.StatusBar) {
      return StatusBar.hide();
    }
  });
}).config(function($stateProvider, $urlRouterProvider) {
  $stateProvider.state('todos', {
    url: '/todos',
    views: {
      'todos': {
        templateUrl: 'templates/todos.html',
        controller: 'todos'
      }
    }
  });
  return $urlRouterProvider.otherwise('/todos');
});

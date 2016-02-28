var app = angular.module('mvmt', []);

// This will cause your app to compile when Turbolinks loads a new page
// and removes the need for ng-app in the DOM
$(document).on('ready page:load', function(arguments) {
  angular.bootstrap(document.body, ['mvmt']);
  console.log('bootstrapped');
});
//
//angular.module('mvmt', [])
//.config(["$httpProvider", function(provider) {
//  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
//}]);

app.controller('CategoryController',['$window', '$scope',
    function ($window, $scope) {
        var catMenu = this;
        $scope.filters = [];
        console.log('CategoryController hooked');

        $scope.addToFilter = function(category){
            console.log($scope.filters);
            var index = $scope.filters.indexOf(category)
            if (index > -1){
                $scope.filters.splice(index, 1, category);
            }
            else {
                $scope.filters.splice(index, 0, category);
            }
        }
    }
]);


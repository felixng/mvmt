var app = angular.module('mvmt', []);

// This will cause your app to compile when Turbolinks loads a new page
// and removes the need for ng-app in the DOM
$(document).on('ready page:load', function(arguments) {
  angular.bootstrap(document.body, ['mvmt']);
});

app.controller('CategoryController',['$window', '$scope', '$rootScope',
    function ($window, $scope, $rootScope) {
        var catMenu = this;
        console.log($rootScope.filters);
        $rootScope.filters = [];

        $scope.updateFilter = function(category){
            
            var index = $rootScope.filters.indexOf(category);

            if (index > -1){
                //console.log(index);
                $rootScope.filters.splice(index, 1);
            }
            else {
                $rootScope.filters.splice(index, 0, category);
            }
            console.log($rootScope.filters);
        }

        $scope.show = function(category){
            if ($rootScope.filters.length == 0)
                return true;
            else return ($rootScope.filters.indexOf(category) > -1);
        }

        $scope.inFilter = function(category){
            console.log($rootScope.filters);
            if ($rootScope != undefined || $rootScope.filters != undefined)
                return ($rootScope.filters.indexOf(category) > -1);
        }
    }
]);



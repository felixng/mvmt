
app.controller('CategoryController',['$window', '$scope', '$rootScope', '$sce', '$http',
    function ($window, $scope, $rootScope, $sce, $http) {
        var catMenu = this;

        $rootScope.mapUrl = '';

        $rootScope.filters = [];

        $scope.getAllStudios = function(){

        }

        $scope.updateFilter = function(category){

            var index = $rootScope.filters.indexOf(category);

            if (index > -1){
                console.log(index);
                $rootScope.filters.splice(index, 1);
            }
            else {
                $rootScope.filters.splice(index, 0, category);
            }
        }

        $scope.addCurrentClass = function(category){
            if (($rootScope != undefined || $rootScope.filters != undefined) && ($rootScope.filters.indexOf(category) > -1))
                return 'menu__item--current';
        }

        $scope.inList = function(category){
            if ($rootScope != undefined || $rootScope.filters != undefined)
                return ($rootScope.filters.indexOf(category) > -1);
        }

        $scope.MapUrl = function(name){
            return $sce.trustAsResourceUrl('https://www.google.com/maps/embed/v1/place?q=' + name + '&key=AIzaSyA3aZfa51yc-MiMjZyToarr9BqUdx1A-S4&zoom=15');
        }

        $scope.updateClickThrough = function(id){
            $http.get( "/api/v1/resources/" + id)
                .then(function(response){
                    $http({
                        url: "/api/v1/resources/" + id,
                        dataType: 'json',
                        method: 'PUT',
                        data: {
                            id: id,
                            clickthrough: response.data.resource.clickthrough + 1
                        },
                        headers: {
                            "Content-Type": "application/json"
                        }
                    }).success(function(response){
                    }).error(function(error){
                        console.log(error);
                    });
                });
        }

    }
]);
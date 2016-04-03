app.controller('PlacesController',['$window', '$scope', '$rootScope', '$sce', '$http',
    function ($window, $scope, $rootScope, $sce, $http) {
        var catMenu = this;
        $rootScope.mapUrl = '';
        $rootScope.filters = [];
        $rootScope.places = [];

        $scope.init = function(){
            getAllStudios();
        }

        $scope.$on('ngRepeatFinished', function(ngRepeatFinishedEvent) {
            resizeFont('.rb-grid h3');
            Boxgrid.init();
        });

        $scope.getCardClass = function(index){
            return {
                'rb-span-2': index%21%8 == 0
            };
        }

        function getAllStudios(){
            $http.get( "/api/v1/places/")
                .then(function(response){
                    $rootScope.places = response.data.places;
                });
        }

        $scope.categoryComparer = function( filters ) {
            return function( item ) {
                return filters.indexOf(item.category[0].name.toLowerCase()) > 0;
            };
        }

        $scope.updateFilter = function(category){

            var index = $rootScope.filters.indexOf(category);

            if (index > -1){
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
            $http.get( "/api/v1/places/" + id)
                .then(function(response){
                    $http({
                        url: "/api/v1/places/" + id,
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


        function resizeFont(ele){
            $(ele).each(function() {
                var $name = $(this);

                var divHeight = $name.height();
                var lineHeight = $name.css('line-height').replace('px', '');
                var lines = Math.round(divHeight / lineHeight);

                if (lines === 2) {
                    $name.addClass("small");
                }
                else if (lines === 3) {
                    $name.addClass("smaller");
                }
                else if (lines === 4) {
                    $name.addClass("xsmall");
                }
                else if (lines > 4) {
                    $name.addClass("xxsmall");
                }
            });
        }

    }
]);
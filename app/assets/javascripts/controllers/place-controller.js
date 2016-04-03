app.controller('PlacesController',['$window', '$scope', '$rootScope', '$sce', '$http',
    function ($window, $scope, $rootScope, $sce, $http) {
        var catMenu = this;
        $rootScope.mapUrl = '';
        $rootScope.filters = [];
        $rootScope.places = [];
        $rootScope.map = [];

        var Boxgrid = (function () {
                var $items = $('#rb-grid > li'),
                    transEndEventNames = {
                        'WebkitTransition': 'webkitTransitionEnd',
                        'MozTransition': 'transitionend',
                        'OTransition': 'oTransitionEnd',
                        'msTransition': 'MSTransitionEnd',
                        'transition': 'transitionend'
                    },
                // transition end event name
                    transEndEventName = transEndEventNames[Modernizr.prefixed('transition')],
                // window and body elements
                    $window = $(window),
                    $body = $('.con'),
                // transitions support
                    supportTransitions = Modernizr.csstransitions,
                // current item's index
                    current = -1,
                // window width and height
                    winsize = getWindowSize();

                function init(options) {
                    // apply fittext plugin
                    $items = $('#rb-grid > li');
                    console.log($items);
                    $items.find('div.rb-week > div span').fitText(1).end().find('div.rb-city').fitText(0.7);
                    initEvents();
                }

                function initEvents() {

                    $items.each(function () {

                        var $item = $(this),
                            $close = $item.find('span.rb-close'),
                            $overlay = $item.children('div.rb-overlay');

                        $item.on('click', function () {
                            console.log('click!');
                            if ($item.data('isExpanded')) {
                                return false;
                            }
                            $item.data('isExpanded', true);
                            // save current item's index
                            current = $item.index();

                            var layoutProp = getItemLayoutProp($item),
                                clipPropFirst = 'rect(' + layoutProp.top + 'px ' + ( layoutProp.left + layoutProp.width ) + 'px ' + ( layoutProp.top + layoutProp.height ) + 'px ' + layoutProp.left + 'px)',
                                clipPropLast = 'rect(0px ' + winsize.width + 'px ' + winsize.height + 'px 0px)';

                            $overlay.css({
                                clip: supportTransitions ? clipPropFirst : clipPropLast,
                                opacity: 1,
                                zIndex: 9999,
                                pointerEvents: 'auto'
                            });

                            if (supportTransitions) {
                                $overlay.on(transEndEventName, function () {

                                    $overlay.off(transEndEventName);

                                    setTimeout(function () {
                                        $overlay.css('clip', clipPropLast).on(transEndEventName, function () {
                                            $overlay.off(transEndEventName);
                                            $body.css('overflow-y', 'hidden');
                                        });
                                    }, 25);

                                });
                            }
                            else {
                                $body.css('overflow-y', 'hidden');
                            }

                        });

                        var closeOverlay = function () {

                            $body.css('overflow-y', 'auto');

                            var layoutProp = getItemLayoutProp($item),
                                clipPropFirst = 'rect(' + layoutProp.top + 'px ' + ( layoutProp.left + layoutProp.width ) + 'px ' + ( layoutProp.top + layoutProp.height ) + 'px ' + layoutProp.left + 'px)',
                                clipPropLast = 'auto';

                            // reset current
                            current = -1;

                            $overlay.css({
                                clip: supportTransitions ? clipPropFirst : clipPropLast,
                                opacity: supportTransitions ? 1 : 0,
                                pointerEvents: 'none'
                            });

                            if (supportTransitions) {
                                $overlay.on(transEndEventName, function () {

                                    $overlay.off(transEndEventName);
                                    setTimeout(function () {
                                        $overlay.css('opacity', 0).on(transEndEventName, function () {
                                            $overlay.off(transEndEventName).css({clip: clipPropLast, zIndex: -1});
                                            $item.data('isExpanded', false);
                                        });
                                    }, 15);

                                });
                            }
                            else {
                                $overlay.css('z-index', -1);
                                $item.data('isExpanded', false);
                            }

                            return false;

                        };

                        $(document).keydown(function (e) {
                            // ESCAPE key pressed
                            if (e.keyCode == 27 && $item.data('isExpanded')) {
                                closeOverlay();
                            }
                        });

                        $close.on('click', function () {
                            closeOverlay();
                        });

                    });

                    //$( window ).on( 'debouncedresize', function() {
                    //	winsize = getWindowSize();
                    //	// todo : cache the current item
                    //	if( current !== -1 ) {
                    //		$items.eq( current ).children( 'div.rb-overlay' ).css( 'clip', 'rect(0px ' + winsize.width + 'px ' + winsize.height + 'px 0px)' );
                    //	}
                    //} );

                }


                function getItemLayoutProp($item) {

                    var scrollT = $window.scrollTop(),
                        scrollL = $window.scrollLeft(),
                        itemOffset = $item.offset();

                    return {
                        left: itemOffset.left - scrollL,
                        top: itemOffset.top - scrollT,
                        width: $item.outerWidth(),
                        height: $item.outerHeight()
                    };

                }

                function getWindowSize() {
                    $body.css('overflow-y', 'hidden');
                    var w = $window.width(), h = $window.height();
                    if (current === -1) {
                        $body.css('overflow-y', 'none');
                    }
                    return {width: w, height: h};
                }

                return {init: init};

        })();


        $scope.init = function(){
            getAllStudios();
        }

        $scope.$on('ngRepeatFinished', function(ngRepeatFinishedEvent) {
            resizeFont('.rb-grid h3');
            console.log('calling init');
            Boxgrid.init();
        });

        $scope.getCardClass = function(index){
            return {
                'rb-span-2': index%21%8  == 0
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

        function MapUrl(name){
            return $sce.trustAsResourceUrl('https://www.google.com/maps/embed/v1/place?q=' + name + '&key=AIzaSyA3aZfa51yc-MiMjZyToarr9BqUdx1A-S4&zoom=15');
        }

        $scope.ClickThroughUpdate = function(id, name){
            console.log(id);
            console.log(name);
            $rootScope.map[id] = MapUrl(name);

            $http.get( "/api/v1/places/" + id)
                .then(function(response){
                    $http({
                        url: "/api/v1/places/" + id,
                        dataType: 'json',
                        method: 'PUT',
                        data: {
                            id: id,
                            clickthrough: response.data.place.clickthrough + 1
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
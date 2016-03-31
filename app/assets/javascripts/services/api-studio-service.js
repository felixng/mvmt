app.factory('StudioService', ['$http', 'API', '$q', 'toastr', function($http, API, $q, toastr) {
    $http.defaults.cache = true;

    var Service = this;
    Service.typeaheadQueue = [];

    return {
        // ==============================================================
        // ========================= GETTING DATA =======================
        // ==============================================================

        cancelTypeahed: function() {
            //abort previous requests in queue
            angular.forEach(Service.typeaheadQueue, function(item, idx) {
                item.abort();
            });
        },
        searchByTypeahed: function(searchTerm) {
            // http://www.bennadel.com/blog/2616-aborting-ajax-requests-using-http-and-angularjs.htm
            // The timeout property of the http request takes a deferred value
            // that will abort the underying AJAX request if / when the deferred
            // value is resolved.
            var deferredAbort = $q.defer();

            var request = $http({
                method: "get",
                url: API + 'fundproducts/typeahead?Name=' + searchTerm,
                timeout: deferredAbort.promise
            });

            // Rather than returning the http-promise object, we want to pipe it
            // through another promise so that we can "unwrap" the response
            // without letting the http-transport mechansim leak out of the
            // service layer.
            var promise = request.then(
                function(response) {
                    return (response.data);
                },
                function(response) {
                    return ($q.reject("Something went wrong"));
                }
            );

            // Now that we have the promise that we're going to return to the
            // calling context, let's augment it with the abort method. Since
            // the $http service uses a deferred value for the timeout, then
            // all we have to do here is resolve the value and AngularJS will
            // abort the underlying AJAX request.
            promise.abort = function() {
                deferredAbort.resolve();
            };

            // Since we're creating functions and passing them out of scope,
            // we're creating object references that may be hard to garbage
            // collect. As such, we can perform some clean-up once we know
            // that the requests has finished.
            promise.finally(
                function() {
                    promise.abort = angular.noop;
                    deferredAbort = request = promise = null;
                }
            );

            // push the request to the quee
            Service.typeaheadQueue.push(promise);

            return (promise);
        },

        search: function(searchRequest) {
            return $http.post(API + 'fundproducts/search', searchRequest);
        },

        download: function(ids) {

            var deferredAbort = $q.defer();

            var request = $http.post(API + 'fundproducts/downloads/get-download-link?c=' + new Date().getTime(), ids);
            request.then(
                function(response){
                    toastr.success('The search results csv file will be with you shortly',  '');
                    window.location.href= API + 'fundproducts/downloads/searchresults.csv?f=' + response.data + '&c=' + new Date().getTime();
                },
                function(response){
                    toastr.error('Apologies, something went wrong with the download', 'Error');
                    return ($q.reject("Something went wrong"));
                });
        },

        loadFilters: function(query) {
            var searchRequest = {
                sortParameters: [{
                    property: "name",
                    direction: "asc"
                }]
            };

            if(typeof query !== "undefined" && query !== null && query !== ""){
                searchRequest.query = query;
            }

            return $http.post(API + 'fundproducts/search?loadingFilters', searchRequest);
        },

        topPerformes: function() {
            var searchRequest = {
                itemsPerPage: 10,
                sortParameters: [{
                    property: "last12MonthCompoundReturn",
                    direction: "desc"
                }],
                filters: {
                    aumRange : {
                        from: 500
                    }
                }
            };
            return $http.post(API + 'fundproducts/search', searchRequest);
        },

        recentFunds: function() {
            var searchRequest = {
                itemsPerPage: 10,
                sortParameters: [{
                    direction: "desc",
                    property: "inceptionDate"
                }]
            };
            return $http.post(API + 'fundproducts/search', searchRequest);
        },

        getSearchFilters: function(query) {
            var searchRequest = {};
            if(query !== null){
                searchRequest = {
                    query: query,
                };
            }

            if(typeof searchRequest === "undefined"){
                searchRequest = '';
            }
            return $http.post(API + 'fundproducts/search?filters', searchRequest);
        },

        // ==============================================================
        // ======================== PROCESSING DATA =====================
        // ==============================================================

        mapTypeahed: function(data) {

            return data;
        }

    };
}]);
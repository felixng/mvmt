app.factory('StudioService', ['$http', 'API', '$q', 'toastr', function($http, API, $q, toastr) {
    $http.defaults.cache = true;

    var Service = this;
    Service.typeaheadQueue = [];

    return {
        // ==============================================================
        // ========================= GETTING DATA =======================
        // ==============================================================
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
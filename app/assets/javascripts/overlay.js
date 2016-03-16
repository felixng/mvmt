/**
 * Created by nfelix on 16/03/16.
 */
var map;
var infoWindow;
var service;

function initMap() {
    map = new google.maps.Map(document.getElementById('footer-map'), {
        center: {lat: -33.867, lng: 151.206},
        zoom: 15,
        styles: [{
            stylers: [{ visibility: 'simplified' }]
        }, {
            elementType: 'labels',
            stylers: [{ visibility: 'off' }]
        }]
    });

    service = new google.maps.places.PlacesService(document.getElementById('footer-map'));
    performSearch();
    // The idle event is a debounced event, so we can query & listen without
    // throwing too many requests at the server.
    //map.addListener('idle', performSearch);
}

function performSearch() {
    var request = {
        query: 'Gravity Circus'
    };
    service.textSearch(request, callback);
}

function callback(results, status) {
    if (status !== google.maps.places.PlacesServiceStatus.OK) {
        console.error(status);
        return;
    }
    for (var i = 0, result; result = results[i]; i++) {
        console.log(result);
    }
}
var app = angular.module('mvmt', []);

$(document).on('ready page:load', ->
  angular.bootstrap(document, ['mvmt'])
)
//
//app.controller('CategoryController', function() {
//    var catMenu = this;
//
//    catMenu.filters = { };
//    console.log('in');
//    catMenu.addToFilter = function(category){
//        console.log('in');
//        var index = filters.indexOf(category)
//        if (index > -1){
//            filters.splice(index, 1, category);
//        }
//        else {
//            filters.spice(index, 0, category);
//        }
//    }
//});

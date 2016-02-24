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

app.controller('CategoryController', function() {
   var catMenu = this;
   catMenu.filters = { };
   console.log('CategoryController hooked');

   catMenu.addToFilter = function(category){
       console.log('addToFilter triggered');
       var index = filters.indexOf(category)
       if (index > -1){
           filters.splice(index, 1, category);
       }
       else {
           filters.spice(index, 0, category);
       }
   }
});


angular.module('starter.controllers', ['ionic'])
.constant('FORECASTIO_KEY', 'a21102dca6e640c80a35bd7476617599')
.controller('HomeCtrl', function($scope,$state,Weather,DataStore) {
   //read default settings into scope
   console.log('inside home');

   $scope.city  = DataStore.city;
   var latitude  =  DataStore.latitude;
   var longitude = DataStore.longitude;

    //call getCurrentWeather method in factory ‘Weather’
    Weather.getCurrentWeather(latitude,longitude).then(function(resp) {
    $scope.current = resp.data;
    console.log('GOT CURRENT', $scope.current);
    }, function(error) {
      alert('Unable to get current conditions');
      console.error(error);
   });
})
.controller('LocationsCtrl', function($scope,$rootScope, $state,DataStore) {
     $scope.cities = [];
     var data = window.localStorage.getItem('cities');

    if (data != null )  {
        $scope.cities   = null;
        $scope.cities   = JSON.parse(data);
        console.log('using local storage');
   }
   else {
       var cityObj = Parse.Object.extend("yelpData");
       var query = new Parse.Query(cityObj);
       //query.descending("createdAt");  //specify sorting
      //query.limit(20);  //specify limit -- fetch only 20 objects

       query.find({
           success:function(results) { 
               $scope.$apply(function() {
                  var index =0;
                  var Arrlen=results.length ;

                   for (index = 0; index < Arrlen; ++index) {
                       var obj = results[index];
                        $scope.cities.push({ 
                          id :  obj.id,
                          name: obj.attributes.name,
                          lat:  obj.attributes.latitude,
                          lgn:  obj.attributes.longitude
                        });
                   }
                  window.localStorage.setItem('cities', JSON.stringify($scope.cities));
            });     
        },
        error:function(error) {
              console.log("Error retrieving cities!");
        }
    }); //end query.find
}


$scope.changeCity = function(cityId) {

    //get lat and longitude for seleted location
    var data = JSON.parse(window.localStorage.getItem('cities'));

    var lat  = data[cityId].lat; //latitude
    var lgn  = data[cityId].lgn; //longitude
    var city = data[cityId].name; //city name

    DataStore.setCity(city);
    DataStore.setLatitude(lat);
    DataStore.setLongitude(lgn);

    $state.go('tab.home');
}
})
.controller('SettingsCtrl', function($scope) {
  //manages app settings
});

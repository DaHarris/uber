$(document).ready(function() {
  var map;

  function initialize() {
    var mapOptions = {
      zoom: 14,
    };
    var map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);

    // Try HTML5 geolocation
    if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var pos = new google.maps.LatLng(position.coords.latitude,
                                         position.coords.longitude);


        map.setCenter(pos);

        function centerFoodTruck(lat, long) {
          $('#map-canvas').css('width','30%');
          google.maps.event.trigger(map, "resize");
          position = new google.maps.LatLng(lat, long);
          map.setCenter(position);
          map.setZoom(16);
        }

        $('body').on('click', '.fi-x', function(){
          $('#pullout').css('width','0%');
          $('#map-canvas').css('width','100%');
          google.maps.event.trigger(map, "resize");
        });

        function menuPull(name) {
          $('#pullout').css('width','70%');
          truck = foodTrucks.filter(function(x) { return x.name === name})[0];
          $('#name').text("    " + truck.name);
          $('#name').prepend('<i class="fi-x"></i>');
          $('#address').text(truck.location);
          $('#other-address').text(truck.location_description);
          $('#food').text("Offerings: " + truck.food);
        }


        var foodTrucks = [];

        function getTrucks() {
          $.ajax({
            url: "/api/v1/all",
            type: "get"
          }).success(function(data) {
            $.each(data, function(index, truck) {
              foodTrucks.push(truck);
              setMarker(truck.latitude, truck.longitude, truck.name);
            })
          })
        };

        getTrucks();
        setMarker();

        function setMarker(lat, long, title) {
          if (lat === undefined && long === undefined) {
            lat = position.coords.latitude;
            long = position.coords.longitude;
            title = "Your Location";
          }

          pos = new google.maps.LatLng(lat,long);

          var iconbase;

          if (title == "Your Location") {
            iconBase = 'http://piepho.com/wp-content/uploads/2012/12/glyphicons_242_google_maps.png';
          } else {
            iconBase = 'http://enroute.aircanada.com/web/images/icons/city/map-red-pin-food_drink.png';
          }

          var marker = new google.maps.Marker({
              position: pos,
              map: map,
              title: title,
              icon: iconBase
          });


          if (title != "Your Location") {
            google.maps.event.addListener(marker, 'click', function(){menuPull(marker.title);});
            google.maps.event.addListener(marker, 'click', function(){centerFoodTruck(lat, long);});
          }
        }
      }, function() {
        handleNoGeolocation(true);
      });
    } else {
      // Browser doesn't support Geolocation
      handleNoGeolocation(false);
    }
  }

  function handleNoGeolocation(errorFlag) {
    if (errorFlag) {
      var content = 'Error: The Geolocation service failed.';
    } else {
      var content = 'Error: Your browser doesn\'t support geolocation.';
    }

    var options = {
      map: map,
      position: new google.maps.LatLng(60, 105),
      content: content
    };

    map.setCenter(options.position);
  }

  google.maps.event.addDomListener(window, 'load', initialize);

});

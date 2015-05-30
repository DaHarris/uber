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


        var setPosition = new google.maps.LatLng(37.7833, -122.4167);
        map.setCenter(setPosition);

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
          //
          // if (title == "Your Location") {
          //   iconBase = 'http://mt.googleapis.com/vt/icon/name=icons/spotlight/spotlight-poi.png';
          // } else {
          //   var check = false;
          //   for (var i=0;i<visited_breweries.length;i++) {
          //     if (visited_breweries[i].brewery_name == title) {
          //       check = true;
          //       break;
          //     }
          //   }
          //   if (check == false) {
          //
          // var iconBase = 'http://mt.googleapis.com/vt/icon/name=icons/spotlight/spotlight-poi.png';
          //   } else {
          //     var iconBase = 'http://icons.iconarchive.com/icons/icons8/windows-8/32/Food-Beer-icon.png';
          //   }
          // }

          var marker = new google.maps.Marker({
              position: pos,
              map: map,
              title: title
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

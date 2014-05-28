var Locations = {
  initialize: function () {
    $('.autocomplete').each(function (index) {
      var $this = $(this),
          autocomplete = new google.maps.places.Autocomplete(
            $this[0],
            { types: ['geocode'] }
          );

      google.maps.event.addListener(autocomplete, 'place_changed', function () {
        console.log(autocomplete);
        Locations.fillInAddress(autocomplete, $this);
      });
    });
  },
  fillInAddress: function (autocomplete, $this) {
    var place = autocomplete.getPlace();

    for (var i = 0; i < place.address_components.length; i++) {
      if ( place.address_components[i].types[0] == "locality" ) {
        $('.city-field').val( place.address_components[i].long_name )
        // $("#contractor_location_city").val(place.address_components[i].long_name);

      }

      if ( place.address_components[i].types[0] == "country" ) {
        $('.country-field').val( place.address_components[i].long_name )
        // $("#contractor_location_country").val(place.address_components[i].long_name);
      }
    }
  },
  geolocate: function () {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var geolocation = new google.maps.LatLng(
            position.coords.latitude, position.coords.longitude);
        autocomplete.setBounds(new google.maps.LatLngBounds(geolocation,
            geolocation));
      });
    }
  }

};

$('document').ready(function() {
  console.log($('#autocomplete'));


  if ($('.autocomplete') != null) {
    // This example displays an address form, using the autocomplete feature
    // of the Google Places API to help users fill in the information.

    var placeSearch, autocomplete;
    var componentForm = {
      street_number: 'short_name',
      route: 'long_name',
      locality: 'long_name',
      administrative_area_level_1: 'short_name',
      country: 'long_name',
      postal_code: 'short_name'
    };



    Locations.initialize();
  }
});

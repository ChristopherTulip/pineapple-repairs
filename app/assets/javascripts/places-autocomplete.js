document.ready = function() {
  if (document.getElementById('autocomplete') != null) {
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

    function initialize() {
      // Create the autocomplete object, restricting the search
      // to geographical location types.
      autocomplete = new google.maps.places.Autocomplete(
          /** @type {HTMLInputElement} */(document.getElementById('autocomplete')),
          { types: ['geocode'] });
      // When the user selects an address from the dropdown,
      // populate the address fields in the form.
      google.maps.event.addListener(autocomplete, 'place_changed', function() {
        fillInAddress();
      });
    }

    function fillInAddress() {
      // Get the place details from the autocomplete object.
      var place = autocomplete.getPlace();

      for (var i = 0; i < place.address_components.length; i++) {
        if ( place.address_components[i].types[0] == "locality" ) {
          $('#job_location_city').val( place.address_components[i].long_name )
        }

        if ( place.address_components[i].types[0] == "country" ) {
          $('#job_location_country').val( place.address_components[i].long_name )
        }
      }
    }

    // Bias the autocomplete object to the user's geographical location,
    // as supplied by the browser's 'navigator.geolocation' object.
    function geolocate() {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
          var geolocation = new google.maps.LatLng(
              position.coords.latitude, position.coords.longitude);
          autocomplete.setBounds(new google.maps.LatLngBounds(geolocation,
              geolocation));
        });
      }
    }

    initialize();
  }
}
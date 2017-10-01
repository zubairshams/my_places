jQuery ->
  markersArray = []
  lat_field = $('#place_latitude')
  lng_field = $('#place_longitude')

  window.initMap = ->
    if $('#map').size() > 0
      map = new google.maps.Map $('#map')[0], {
        center: {lat: 1.290270, lng: 103.851959}
        zoom: 8
      }

      map.addListener 'click', (e) ->
        placeMarkerAndPanTo e.latLng, map
        updateFields e.latLng

      $('#find-on-map').click (e) ->
        e.preventDefault()
        placeMarkerAndPanTo {
          lat: parseInt lat_field.val(), 10
          lng: parseInt lng_field.val(), 10
        }, map

  placeMarkerAndPanTo = (latLng, map) ->
    markersArray.pop().setMap(null) while(markersArray.length)
    marker = new google.maps.Marker
      position: latLng
      map: map

    map.panTo latLng
    markersArray.push marker

  updateFields = (latLng) ->
    lat_field.val latLng.lat()
    lng_field.val latLng.lng()

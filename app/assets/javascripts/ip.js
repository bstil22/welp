$( document ).ready(function() {
  geoFindMe();
  window.setInterval(function(){
    geoFindMe();
  }, 10000);
});
function geoFindMe() {
  var output = document.getElementById("out");

  if (!navigator.geolocation){
    output.innerHTML = "<p>Geolocation is not supported by your browser</p>";
    return;
  }

  function success(position) {
    var latitude  = position.coords.latitude;
    var longitude = position.coords.longitude;
    finder(latitude, longitude);

    output.innerHTML = '<center><p id="pad">Your current location is ' + latitude + '°, ' + longitude + '°</p></center>';

  };

  function error() {
    output.innerHTML = "Unable to retrieve your location";
  };

  output.innerHTML = "<center><p>Loading...</p></center>";

  navigator.geolocation.getCurrentPosition(success, error);
}

function finder(latitude, longitude) {
  console.log(latitude)
  console.log(longitude)
  $.ajax({
    url: "/coordinates",
    data: { latitude: latitude, longitude: longitude }
  }).done(function(data) {
    console.log('way to go')
  }).fail(function(textStatus ) {
    console.log(textStatus)
        // alert( "Request failed: " + textStatus );
      });
}

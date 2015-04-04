$( document ).ready(function() {
  geoFindMe();
  window.setInterval(function(){
    geoFindMe();
  }, 10000);
});
function geoFindMe() {
  $( "#target" ).click(function() {
    console.log("im called")
    window.location.href = "/results";
  });
  var output = document.getElementById("out");

  if (!navigator.geolocation){
    output.innerHTML = "<p>Geolocation is not supported by your browser</p>";
    return;
  }

  function success(position) {
    var latitude  = position.coords.latitude;
    var longitude = position.coords.longitude;
    finder(latitude, longitude);

    output.innerHTML = '<p>Your current location is ' + latitude + '°, ' + longitude + '°</p>';

  };

  function error() {
    output.innerHTML = "Unable to retrieve your location";
  };

  output.innerHTML = "<p>Locating…</p>";

  navigator.geolocation.getCurrentPosition(success, error);
}

function finder(latitude, longitude) {
  console.log(latitude)
  console.log(longitude)
  $.ajax({
    url: "/location",
    data: { latitude: latitude, longitude: longitude }        
  }).done(function(data) {
    console.log('way to go')
  }).fail(function(textStatus ) {
    console.log(textStatus)
        // alert( "Request failed: " + textStatus );
      });
}
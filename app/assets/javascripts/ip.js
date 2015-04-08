$( document ).ready(function() {
  geoFindMe();
  window.setInterval(function(){
    geoFindMe();
  }, 10000);
});
function geoFindMe() {

  if (!navigator.geolocation){
    return;
  }

  function success(position) {
    var latitude  = position.coords.latitude;
    var longitude = position.coords.longitude;
    finder(latitude, longitude);


  };

  function error() {
  };


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

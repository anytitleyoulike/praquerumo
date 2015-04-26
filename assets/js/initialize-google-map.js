	function initialize(latitude, longitude) {
		  // Create an array of styles.
		var latitude = document.getElementById("latitude");
		var longitude = document.getElementById("longitude");

				
		//var myLatlng = new google.maps.LatLng(36.5110, -4.8825);
		var myLatlng = new google.maps.LatLng(latitude.innerHTML, longitude.innerHTML);

	  // Create a new StyledMapType object, passing it the array of styles,
	  // as well as the name to be displayed on the map type control.
	  

	  // Create a map object, and include the MapTypeId to add
	  // to the map type control.
	  var mapOptions = {
		zoom: 15,
		center: myLatlng,
		mapTypeControlOptions: {
		  mapTypeIds: [google.maps.MapTypeId.ROADMAP, google.maps.MapTypeId.SATELLITE, google.maps.MapTypeId.HYBRID]
		}
	  };

	  var map = new google.maps.Map(document.getElementById('map-canvas'),
		mapOptions);
	
	  var ponto_de_encontro = document.getElementById("ponto_de_encontro");

	  var marker = new google.maps.Marker({
		  position: myLatlng,
		  map: map,
		  title: ponto_de_encontro.innerHTML
	  });

	  //Associate the styled map with the MapTypeId and set it to display.
	  //map.mapTypes.set('map_style', styledMap);
	  map.setMapTypeId(google.maps.MapTypeId.SATELLITE);
	}

	
	function loadScript() {
		setTimeout(function (){
		  $('#map-canvas').css({'display':'block'});
		  var script = document.createElement('script');
		  script.type = 'text/javascript';
		  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&' +
		  	  'callback=initialize';
		  document.body.appendChild(script);
		  
		  //google.maps.event.trigger(map, 'resize');
	    }, 500);	
		
	}
	
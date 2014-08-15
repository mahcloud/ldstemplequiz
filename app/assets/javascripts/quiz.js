$(document).ready(function() {
	maplace.o.afterCreateMarker = function (index, location, marker) {
	    google.maps.event.addListener(marker, 'click', function() {
		if(this.id == temple_id) {
		  alert('Congratulations that\'s correct!');
		} else {
		  alert('Try again!');
		}
	    });
	};
});

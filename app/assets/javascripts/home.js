$(document).ready(function() {
	maplace.o.afterCreateMarker = function (index, location, marker) {
	    google.maps.event.addListener(marker, 'click', function() {
		openPhotos(this.id);
	    });
	};
});

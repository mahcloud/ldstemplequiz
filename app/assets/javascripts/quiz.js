$(document).ready(function() {
	maplace.o.afterCreateMarker = function (index, location, marker) {
	    google.maps.event.addListener(marker, 'click', function() {
              $.post('/answers.json', { temple_id: this.id }, function(data) {
                if(data['correct'] === true){
                  alert('Correct');
                } else if(data['temple_name'] == 'Already guessed') {
                  alert('You have already guessed. Please take the quiz again.');
                } else {
                  alert('Incorrect! It was the '+data['temple_name']+' Temple!');
                }
                $('#gmap, .accordion').hide();
                if(data['temple_name'] == 'Already guessed') {
                } else {
                  $('#temple_answer').html(data['temple_name'] + ' Temple');
                }
              });
	    });
	};
});

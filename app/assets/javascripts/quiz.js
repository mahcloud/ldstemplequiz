$(document).ready(function() {
	maplace.o.afterCreateMarker = function (index, location, marker) {
	    google.maps.event.addListener(marker, 'click', function() {
              $.post('/answers.json', { temple_id: this.id }, function(data) {
                $('#gmap, .accordion').hide();
                if(data['temple_name'] == 'Already guessed') {
		  $('#temple_answer').html('You have already guessed!');
                } else {
                  $('#temple_answer').html(data['temple_name'] + ' Temple');
                }
		$('#temple_answer, .next_quiz').show();
		$('#stats').html(data['correct_answers'] + ' Correct<br/>'+data['total_answers']+ ' Guesses');
                if(data['correct'] === true){
                  alert('Correct');
                } else if(data['temple_name'] == 'Already guessed') {
                  alert('You have already guessed. Please take the quiz again.');
                } else {
                  alert('Incorrect! It was the '+data['temple_name']+' Temple!');
                }
              });
	    });
	};
});

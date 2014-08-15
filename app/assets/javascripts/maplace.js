var maplace;
var temple_id = 0;
function showGroup(index) {
    $('.accordion .content').removeClass('active');
    $.getJSON('temples.json', { continent_id: index }, function(data) {
        maplace.Load({
            locations: data.locations,
            view_all: false,
            type: 'marker',
            force_generate_controls: true
        });
	$('#g'+index).addClass('active');
	$('#temple_photos').html('');
    });
}

function openPhotos(temple_id) {
	$.getJSON('photos.json', { temple_id: temple_id }, function(data) {
	    $('#temple_photos').html('<ul data-orbit></ul>');
	    for (var i=0; i<=data['photos'].length - 1; i++) {
		$('#temple_photos ul').append('<li><div><img src="'+data['photos'][i]['link']+'"/></div></li>');
	    }
	    setTimeout("$(document).foundation('orbit');", 50);
	    if(data['photos'].length == 0) {
		$('#temple_photos').html('');
	    }
	});
}

$(function() {
	maplace = new Maplace({
	    map_div: '#gmap',
	    controls_div: '.content',
	    controls_type: 'list',
	    controls_on_map: false
	});

	$('.accordion a').click(function(e) {
	    e.preventDefault();
	    var index = $(this).attr('data-load');
	    showGroup(index);
	});

	showGroup(0);
});

var maplace;
function showGroup(index) {
    var el = $('#g'+index);
    $('#tabs li').removeClass('active');
    $(el).parent().addClass('active');
    $.getJSON('temples.json', { country_id: index }, function(data) {
        maplace.Load({
            locations: data.locations,
            view_all_text: data.title,
            type: data.type,
            force_generate_controls: true
        });
    });
}

$(function() {
	maplace = new Maplace({
	    map_div: '#gmap',
	    controls_div: '#controls-mixed',
	    controls_type: 'list',
	    controls_on_map: false
	});

	$('#tabs a').click(function(e) {
	    e.preventDefault();
	    var index = $(this).attr('data-load');
	    showGroup(index);
	});
});

var maplace;
function showGroup(index) {
    $('.accordion .content').removeClass('active');
    $.getJSON('temples.json', { continent_id: index }, function(data) {
        maplace.Load({
            locations: data.locations,
            view_all: false,
            type: data.type,
            force_generate_controls: true
        });
	$('#g'+index).addClass('active');
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
});

$(document).ready(function() {
	$('div[id^="star"').each(function(){
		$(this).raty({
	    path: '/images/ratyrate/',
	    readOnly: true,
	    score: function() {
				return $(this).attr('data-score');
	 		}

	});
	})


})
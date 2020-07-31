$(window).scroll(function() {    
    var scroll = $(window).scrollTop();    
    if (scroll > 50) {
        $('#header').addClass('headerC');
        $('#h_myPage').addClass('scroll');
    } else{
    	$('#header').removeClass('headerC');
    	$('#h_myPage').removeClass('scroll');
    }
});

$(document).ready(function() {
	$('#h_profile').click(function() {
		if($('#h_myPage').css('display') == "none"){
			$('#h_myPage').css('display', 'block');
		}
		else{
			$('#h_myPage').css('display', 'none');
		}
	});
	$('#h_myPage_back').click(function() {
			$('#h_myPage').css('display', 'none');
	});
});
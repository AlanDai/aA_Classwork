$(window).scroll(function(){
    if ($(window).scrollTop() >= 160) {
        $('#section-nav').addClass('sticky');
    }
    else {
        $('#section-nav').removeClass('sticky');
    }
});
$(window).scroll(function () {
    if (window.pageYOffset >= 231) {
        $('#header').addClass("navbar-fixed-top");
        $('')
    } else {
        $('#header').removeClass("navbar-fixed-top");
    }
});



$('body').addClass("showItem");
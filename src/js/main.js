'use strict';

(function ($) {

    // Preloader (if the #preloader div exists)
    $(window).on('load', function () {
        $(".loader").fadeOut();
        $("#preloder").delay(200).fadeOut("slow");
    });

    // Set Background Image
    $('.set-bg').each(function () {
        var bg = $(this).data('setbg');
        $(this).css('background-image', 'url(' + bg + ')');
    });

    // Canvas Menu
    $(".canvas__open").on('click', function () {
        $(".offcanvas-menu-wrapper").addClass("active");
        $(".offcanvas-menu-overlay").addClass("active");
    });

    $(".offcanvas-menu-overlay").on('click', function () {
        $(".offcanvas-menu-wrapper").removeClass("active");
        $(".offcanvas-menu-overlay").removeClass("active");
    });

    // Navigation Menu
    $(".header__menu").slicknav({
        prependTo: '#mobile-menu-wrap',
        allowParentLinks: true
    });

    /*-----------------------
        Range Slider
    ------------------------ */
    // let rangeSlider = $(".price-range");
    // rangeSlider.slider({
    //     range: true,
    //     min: 1,
    //     max: 4000,
    //     values: [800, 3200],
    //     slide: function (event, ui) {
    //         $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
    //     }
    // });
    // $("#amount").val("$" + $(".price-range").slider("values", 0) + " - $" + $(".price-range").slider("values", 1));

    let rangeSlider = $(".price-range");
    rangeSlider.slider({
        range: true,
        min: 1,
        max: 400000,
        values: [800, 200000],
        slide: function (event, ui) {
            $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
        }
    });

    // Initialize the #amount field with the current values of the slider
    $("#amount").val("$" + rangeSlider.slider("values", 0) + " - $" + rangeSlider.slider("values", 1));


    $("select").niceSelect();
})(jQuery);
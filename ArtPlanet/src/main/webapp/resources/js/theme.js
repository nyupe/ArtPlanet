;(function($){
    "use strict"


    var nav_offset_top = $('header').height() + 50; 
    /*-------------------------------------------------------------------------------
	  Navbar 
     -------------------------------------------------------------------------------*/

	//* Navbar Fixed  
    function navbarFixed(){
        if ( $('.header_area').length ){ 
            $(window).scroll(function() {
                var scroll = $(window).scrollTop();   
				/* 탑메뉴 아래로 내려올시 */
                if (scroll >= nav_offset_top ) {
                    $(".header_area").addClass("navbar_fixed");
                    /*
					$('.header_area .navbar .nav .nav-item .nav-link').css("color","black");
					$('.header_area .navbar .nav .nav-item.active .nav-link').css("color","red");
					$('.header_area .right-button ul li a').css("color","black");
					*/
                } 
				/* 탑메뉴 상단에 있을시 */
				else {
                    $(".header_area").removeClass("navbar_fixed");
					/*
					$('.header_area .navbar .nav .nav-item .nav-link').css("color","white");
					$('.header_area .navbar .nav .nav-item.active .nav-link').css("color","red");
					$('.header_area .right-button ul li a').css("color","white");
					*/
                }
            });
        };
    };
    navbarFixed();





    /*----------------------------------------------------*/
    /*  Parallax Effect js
    /*----------------------------------------------------*/
    function parallaxEffect() {
    	$('.bg-parallax').parallax();
    }
    parallaxEffect();

    $('.counter').counterUp({
        delay: 10,
        time: 1000
    });


      //------- Owl Carusel  js --------//




      $(document).ready(function() {

          $('.testimonial').owlCarousel({
            items: 1,
            loop: true,
            margin: 30,
            autoplayHoverPause: true,
            smartSpeed:500,
            dots: true
    });


// Search Toggle
    $("#search_input_box").hide();
    $("#search").on("click", function () {
        $("#search_input_box").slideToggle();
        $("#search_input").focus();
    });
    $("#close_search").on("click", function () {
        $('#search_input_box').slideUp(500);
    });

      });




 //------- mailchimp --------//  
 function mailChimp() {
    $('#mc_embed_signup').find('form').ajaxChimp();
}
mailChimp();

   //-------- Counter js --------//
   $(window).on("load", function() {


    $('.portfolio-filter ul li').on('click', function () {
        $('.portfolio-filter ul li').removeClass('active');
        $(this).addClass('active');

        var data = $(this).attr('data-filter');
        $workGrid.isotope({
            filter: data
        });
    });

    if (document.getElementById('portfolio')) {
        var $workGrid = $('.portfolio-grid').isotope({
            itemSelector: '.all',
            percentPosition: true,
            masonry: {
                columnWidth: '.grid-sizer'
            }
        });
    }
});


   


})(jQuery)
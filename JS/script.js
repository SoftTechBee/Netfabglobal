(function($) {
  'use strict';
      /*======================= 
        01. Wow Active 
      ======================*/
      new WOW().init();

      /*======================= 
        02. Timer
      ======================*/
      var ClockDate = $('#clock').data( "date" );
      $('#clock').countdown(ClockDate, function(event) {
        var $this = $(this).html(event.strftime(''
          + '<ul>'
          + '<li><span>%D<em>days</em></span></li>'
          + '<li><span>%H<em>hours </em></span></li>'
          + '<li><span>%M<em>minutes</em></span></li>'
          + '<li><span>%S<em>seconds</em></span></li>'
          + '</ul>'
          ));
      });
      /*======================= 
        03. Brand Logo Carousel Slider
      ======================*/
      $('.brand-logos').owlCarousel({
          loop:true,
          autoplay:true,
          autoplayTimeout:4500,
          margin:10,
          nav: false,
          dots: false,
          responsiveClass:true,
          responsive:{
              0:{
                  items:1            },
              600:{
                  items:3
              },
              1000:{
                  items:4
              }
          }
      });
      /*======================= 
        04. Roadmap Slider Carousel Slider
      ======================*/
      $('.roadmap-slider').owlCarousel({
          loop:true,
          autoplay:true,
          autoplayTimeout:6000,
          margin:0,
          nav: false,
          dot: true,
          responsiveClass:true,
          responsive:{
              0:{
                  items:1
              },
              600:{
                  items:3
              },
              1000:{
                  items:4
              },
              1350:{
                  items:5
              }
          }
      });
      $('.horizontal-roadmap').owlCarousel({
          loop:false,
          autoplay:false,
          autoplayTimeout:6000,
          margin:10,
          nav: false,
          dot: true,
          mouseDrag:false,
          responsiveClass:true,
          responsive:{
              0:{
                  items:1
              },
              600:{
                  items:3
              },
              1000:{
                  items:4
              },
              1200:{
                  items:6
              }
          }
      });
      
      /*===============================
        05. Blog Slider Carousel Slider
      ==================================*/
      $('.blog-slider.with-navigation').owlCarousel({
          loop:false,
          autoplay:true,
          autoplayTimeout:6000,
          margin:0,
          nav: true,
          dot: true,
          responsiveClass:true,
          responsive:{
              0:{
                  items:1,
                  nav: false
              },
              600:{
                  items:1,
                  nav: false
              },
              1000:{
                  items:2,
                  nav: true
              },
              1350:{
                  items:3,
                  nav: true
              }
          }
      });
      $('.blog-slider').owlCarousel({
          loop:false,
          autoplay:true,
          autoplayTimeout:6000,
          margin:0,
          nav: false,
          dot: true,
          responsiveClass:true,
          responsive:{
              0:{
                  items:1
              },
              600:{
                  items:1
              },
              1000:{
                  items:2
              },
              1350:{
                  items:3
              }
          }
      });
      $('.services-slider').owlCarousel({
          loop:false,
          autoplay:true,
          autoplayTimeout:6000,
          margin:0,
          nav: false,
          dot: true,
          responsiveClass:true,
          responsive:{
              0:{
                  items:1
              },
              600:{
                  items:1
              },
              1000:{
                  items:2
              },
              1350:{
                  items:3
              }
          }
      });

      /*===============================
        06. Expert Slider Carousel Slider
      ==================================*/
      $('.expert-slider').owlCarousel({
          loop:true,
          autoplay:true,
          autoplayTimeout:6000,
          margin:0,
          nav: true,
          dot: false,
          animateOut: 'fadeOut',
          animateIn: 'fadeIn',
          responsiveClass:true,

          responsive:{
              0:{
                  items:1
              },
              600:{
                  items:1
              },
              1000:{
                  items:1
              },
              1350:{
                  items:1
              }
          }
      });
      /*===============================
        07. Mobile Menu
      ==================================*/
      if($(window).width() < 767){
        jQuery('.menu-icon').on("click", function() {
          jQuery(this).toggleClass('active');
          jQuery('nav').slideToggle();
          jQuery('nav ul li a').on("click", function(){
            jQuery('.menu-icon').removeClass('active');
            jQuery('nav').hide();
          });
        });
      }

})(jQuery);

equalheight = function(container){
  var currentTallest = 0,
     currentRowStart = 0,
     rowDivs = new Array(),
     $el,
     topPosition = 0;
  $(container).each(function() {

   $el = $(this);
   $($el).height('auto')
   topPostion = $el.position().top;

   if (currentRowStart != topPostion) {
     for (currentDiv = 0 ; currentDiv < rowDivs.length ; currentDiv++) {
       rowDivs[currentDiv].height(currentTallest);
     }
     rowDivs.length = 0; // empty the array
     currentRowStart = topPostion;
     currentTallest = $el.height();
     rowDivs.push($el);
   } else {
     rowDivs.push($el);
     currentTallest = (currentTallest < $el.height()) ? ($el.height()) : (currentTallest);
  }
   for (currentDiv = 0 ; currentDiv < rowDivs.length ; currentDiv++) {
     rowDivs[currentDiv].height(currentTallest);
   }
 });
}

$(window).load(function() {
  equalheight('.benefit-box');
});


$(window).resize(function(){
  equalheight('.benefit-box');
});

/*---------------- Counter -------------------------*/
var a = 0;
$(window).scroll(function() {
if($('#counter').length > 0){
  var oTop = $('#counter').offset().top - window.innerHeight;
  if (a == 0 && $(window).scrollTop() > oTop) {
    $('.counter-value').each(function() {
      var $this = $(this),
        countTo = $this.attr('data-count');
      $({
        countNum: $this.text()
      }).animate({
          countNum: countTo
        },

        {

          duration: 2000,
          easing: 'swing',
          step: function() {
            $this.text(Math.floor(this.countNum));
          },
          complete: function() {
            $this.text(this.countNum);
            //alert('finished');
          }

        });
    });
    a = 1;
  }
}
});
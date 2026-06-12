$(document).ready(function() {
    new Swiper('.services-slider', {
        loop: true,
        spaceBetween: 30,
        autoplay: {
            delay: 3000,
            disableOnInteraction: true,
        },

        navigation:{
            nextEl:'.testimonials-arrow-next',
            prevEl:'.testimonials-arrow-prev'
        },
        // pagination: {
        //     el: '.swiper-pagination',
        //     clickable: true,
        // },
        breakpoints: {
            0: {
                slidesPerView: 1
            },
            576: {
                slidesPerView: 2
            },
            768: {
                slidesPerView: 2
            },
            992: {
                slidesPerView: 3
            },
            1200: {
                slidesPerView: 4
            }
        }
    });
    new Swiper('.products-slider', {
        loop: true,
        spaceBetween: 20,

        autoplay: {
            delay: 3000,
            disableOnInteraction: true,
        },

        navigation:{
            nextEl:'.testimonials-arrow-next',
            prevEl:'.testimonials-arrow-prev'
        },

        breakpoints: {
            0: {
                slidesPerView: 1
            },
            576: {
                slidesPerView: 2
            },
            768: {
                slidesPerView: 2
            },
            992: {
                slidesPerView: 3
            },
            1200: {
                slidesPerView: 4
            }
        }
    });
    new Swiper('.testimonials-slider', {

        loop:true,

        autoplay:{
            delay:4000,
            disableOnInteraction:true
        },

        spaceBetween:20,

        navigation:{
            nextEl:'.testimonials-arrow-next',
            prevEl:'.testimonials-arrow-prev'
        },

        breakpoints:{
            0: {
                slidesPerView: 1
            },
            576: {
                slidesPerView: 2
            },
            768: {
                slidesPerView: 2
            },
            992: {
                slidesPerView: 3
            },
            1200: {
                slidesPerView: 4
            }
        }

    });
    new Swiper('.blogs-slider', {

        loop:true,

        autoplay:false,

        spaceBetween:25,

        navigation:{
            nextEl:'.blog-arrow-next',
            prevEl:'.blog-arrow-prev'
        },

        breakpoints:{
            0:{
                slidesPerView:1
            },
            768:{
                slidesPerView:2
            },
            1200:{
                slidesPerView:4
            }
        }

    });
});

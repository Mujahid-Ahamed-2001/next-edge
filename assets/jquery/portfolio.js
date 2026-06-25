$(document).ready(function () {
    new Swiper('.portfolio-testimonials-slider', {
        loop: true,
        spaceBetween: 25,
        autoplay: {
            delay: 4500,
            disableOnInteraction: true,
        },
        navigation: {
            nextEl: '.portfolio-testi-next',
            prevEl: '.portfolio-testi-prev',
        },
        pagination: {
            el: '.portfolio-testimonials-slider .swiper-pagination',
            clickable: true,
        },
        breakpoints: {
            0:   { slidesPerView: 1 },
            768: { slidesPerView: 2 },
            992: { slidesPerView: 3 },
        },
    });
    var currentCategory = 'all';

    function filterProjects() {
        var keyword = $('#portfolioSearch').val().toLowerCase().trim();
        var visible  = 0;

        $('.portfolio-item').each(function () {
            var cat   = String($(this).data('category'));
            var title = String($(this).data('title'));   // pre-lowercased in PHP
            var desc  = String($(this).data('desc'));    // pre-lowercased in PHP

            var catOk  = (currentCategory === 'all') || (cat === currentCategory);
            var srchOk = (keyword === '') || (title.indexOf(keyword) > -1) || (desc.indexOf(keyword) > -1);

            if (catOk && srchOk) {
                $(this).show();
                visible++;
            } else {
                $(this).hide();
            }
        });

        if (visible === 0) {
            $('#portfolioNoResults').show();
        } else {
            $('#portfolioNoResults').hide();
        }
    }
    $('.portfolio-filter-btn').on('click', function () {
        $('.portfolio-filter-btn').removeClass('active');
        $(this).addClass('active');
        currentCategory = String($(this).data('category'));
        filterProjects();
    });
    $('#portfolioSearch').on('keyup input', function () {
        filterProjects();
    });
    filterProjects();

});

$(document).ready(function(){

    let currentCategory = "all";
    let currentPage = 1;
    let itemsPerPage = 3;

    function showPage(page){

        currentPage = page;

        let cards = $('.blog-card.matched');

        let totalPages = Math.ceil(cards.length / itemsPerPage);

        cards.hide();

        cards.slice(
            (page - 1) * itemsPerPage,
            page * itemsPerPage
        ).show();

        $('.pagination').html('');

        if(totalPages > 1){

            for(let i = 1; i <= totalPages; i++){

                $('.pagination').append(
                    '<a href="#" class="page-btn ' +
                    (i === page ? 'active' : '') +
                    '" data-page="' + i + '">' +
                    i +
                    '</a>'
                );

            }

        }

    }

    function filterBlogs(){

        let keyword = $('#blogSearch').val().toLowerCase();

        $('.blog-card').each(function(){

            let categories = $(this).data('category').toString().split(',');
            let title = $(this).text().toLowerCase();

            let categoryMatch =
                currentCategory === 'all' ||
                categories.includes(currentCategory);

            let searchMatch =
                title.indexOf(keyword) > -1;

            if(categoryMatch && searchMatch){

                $(this).addClass('matched');

            }else{

                $(this).removeClass('matched');

            }

        });

        $('.blog-card').hide();

        showPage(1);

    }

    $('.filter-btn').on('click', function(e){

        e.preventDefault();

        $('.filter-btn').removeClass('active');
        $(this).addClass('active');

        currentCategory = $(this).data('category');

        filterBlogs();

    });

    $('#blogSearch').on('keyup', function(){

        filterBlogs();

    });

    $(document).on('click', '.page-btn', function(e){

        e.preventDefault();

        let page = parseInt($(this).data('page'));

        showPage(page);

    });

    filterBlogs();

});
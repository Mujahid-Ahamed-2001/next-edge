$(document).ready(function(){

    $('#mobileToggle').click(function(){
        $('#mobile-menu').toggleClass('active');
        $(this).toggleClass('active');
    });

    $('.submenu-toggle').click(function(e){

        e.preventDefault();
        e.stopPropagation();

        var parent = $(this).closest('.mobile-dropdown');

        parent.toggleClass('active');
        parent.find('.mobile-submenu').first().slideToggle(300);

    });

});
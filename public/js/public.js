$(document).ready(function () {
    /* Scroll Up Active */
    $.scrollUp({
        scrollText: '<i class="ion ion-ios-arrow-up"></i>',
        easingType: 'linear',
        scrollSpeed: 900,
        animation: 'slide'
    });
    if(($(window).width()+scrollCompensate())>=992)
    {
        var currentP=0;
        var headerSpaceH=$('.header').outerHeight(!0);

        //$('.headerSpace').css('height',headerSpaceH);
        $(window).scroll(function(){
            var scroll=$(window).scrollTop();
            //alert(headerSpaceH);
            //alert(scroll);
            if(scroll!=currentP){
                if(scroll>=headerSpaceH){
                $(".header-bottom").addClass("scroll-menu").addClass(" animated fadeInDown");
                //$('.headerSpace').removeClass('unvisible')
                $(".header-bottom").removeClass("bg-theme");
            }
            else
            {
                $(".header-bottom").removeClass("scroll-menu").removeClass(" animated fadeInDown");
                $(".header-bottom").addClass(" bg-theme");
                //$('.headerSpace').addClass('unvisible')

            }
          }
            currentP=$(window).scrollTop();
    });
   }
});
function scrollCompensate()
{
    var inner=document.createElement('p');
    inner.style.width="100%";
    inner.style.height="200px";
    var outer=document.createElement('div');
    outer.style.position="absolute";
    outer.style.top="0px";
    outer.style.left="0px";outer.style.visibility="hidden";
    outer.style.width="200px";outer.style.height="150px";
    outer.style.overflow="hidden";outer.appendChild(inner);
    document.body.appendChild(outer);
    var w1=inner.offsetWidth;
    outer.style.overflow='scroll';
    var w2=inner.offsetWidth;
    if(w1==w2)w2=outer.clientWidth;
    document.body.removeChild(outer);
    return(w1-w2)
}
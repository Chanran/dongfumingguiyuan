/**
 * Created by blue on 16-3-17.
 */

$(function () {
    /*菜单栏*/
    $(".menu-bars > li > .bar-title").on('click', function () {
        $(this).css('background-color', 'red').parents().siblings().children('a').css('background-color', 'green');
        $(this).css('display', 'block');
        $(this).parents().siblings().find('.menu2').hide(300);
        $(this).siblings('.menu2').slideToggle(400);
    });

    /*文章管理*/
    $('#shift > a').on('click',function(){
        var id = $(this).attr('href');
        $(id).parents().find('span').removeClass('tag-active');
        $(this).children('span').addClass('tag-active');
        $(id).parent().children().css('display', 'none');
        $(id).css('display', 'block');
    });
});

// Administry object setup
if (!Administry) var Administry = {};

// scrollToTop() - scroll window to the top
Administry.scrollToTop = function (e) {
    $(e).hide().removeAttr("href");
    if ($(window).scrollTop() != "0") {
        $(e).fadeIn("slow");
    }
    var scrollDiv = $(e);
    $(window).scroll(function () {
        if ($(window).scrollTop() == "0") {
            $(scrollDiv).fadeOut("slow");
        } else {
            $(scrollDiv).fadeIn("slow");
        }
    });
    $(e).click(function () {
        $("html, body").animate({
            scrollTop: 0
        }, "slow");
    });
};

// setup() - Administry init and setup
Administry.setup = function () {
    // Open an external link in a new window
    $('a[href^="http://"]').filter(function () {
        return this.hostname && this.hostname !== location.hostname;
    }).attr('target', '_blank');
  
    // scroll to top on request
    if ($("a#totop").length) Administry.scrollToTop("a#totop");
    
    // custom tooltips to replace the default browser tooltips for <a title=""> <div title=""> and <span title="">
    $("a[title], div[title], span[title], img[title],button[title]").tipTip();  
    
    // setup content boxes
    if ($(".content-box").length) {
        $(".content-box h3").css({
            "cursor": "s-resize"
        });
        // Give the header in content-box a different cursor	
        $(".content-box h3").click(
        function () {
            $(this).parent().find('div').first().toggle(); // Toggle the content
            $(this).parent().toggleClass("content-box-closed"); // Toggle the class "content-box-closed" on the content
        });
    }
};

//直接启用初始化
Administry.setup();